import 'dart:async';

import 'package:drift/drift.dart' show Value;
import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pokedex/core/database/app_database.dart';
import 'package:pokedex/features/pokemon/data/dto/pokemon_detail_dto.dart';
import 'package:pokedex/features/pokemon/data/remote/pokemon_detail_remote_data_source.dart';
import 'package:pokedex/features/pokemon/data/sync/pokemon_detail_local_repository.dart';
import 'package:pokedex/features/pokemon/domain/failures.dart';

import 'fixtures/pokemon_detail_fixture.dart';

class _FakeDetailRemote implements PokemonDetailRemoteDataSource {
  int calls = 0;
  bool offline = false;

  @override
  Future<PokemonDetailDto> fetchDetail({
    required int id,
    List<String>? versionGroups,
  }) async {
    calls++;
    if (offline) {
      throw const NetworkFailure();
    }
    return PokemonDetailDto.fromGraphql(buildPokemonDetailData(id: id));
  }
}

void main() {
  late AppDatabase db;
  late _FakeDetailRemote remote;
  late PokemonDetailLocalRepository repository;

  setUp(() {
    db = AppDatabase(NativeDatabase.memory());
    remote = _FakeDetailRemote();
    repository = PokemonDetailLocalRepository(db: db, remote: remote);
  });

  tearDown(() async {
    await db.close();
  });

  Future<int> count(String sql) async {
    final row = await db.customSelect(sql).getSingle();
    return row.read<int>('total');
  }

  test('refresh guarda el detalle completo en Drift', () async {
    final detail = await repository.refreshDetail(6);

    expect(remote.calls, 1);
    expect(detail.name, 'charizard');
    expect(detail.types, hasLength(2));
    expect(detail.stats!.attack, 84);
    expect(detail.abilities, hasLength(2));
    expect(detail.moves, hasLength(1));
    expect(detail.variants, hasLength(1));
    expect(detail.evolutions, hasLength(2));
    expect(detail.typeEfficacies, hasLength(1));
    expect(detail.species.eggGroups, ['dragon', 'monster']);
  });

  test('una segunda actualizacion no crea duplicados', () async {
    await repository.refreshDetail(6);
    await repository.refreshDetail(6);

    expect(remote.calls, 2);
    expect(await count('SELECT COUNT(*) AS total FROM pokemon'), 2);
    expect(await count('SELECT COUNT(*) AS total FROM pokemon_stats'), 1);
    expect(await count('SELECT COUNT(*) AS total FROM pokemon_move'), 1);
    expect(await count('SELECT COUNT(*) AS total FROM pokemon_ability'), 2);
    expect(await count('SELECT COUNT(*) AS total FROM evolution'), 2);
    expect(await count('SELECT COUNT(*) AS total FROM type_efficacy'), 1);
  });

  test('la lectura no depende de la red (reinicio offline)', () async {
    await repository.refreshDetail(6);
    remote.offline = true;

    final detail = await repository.getDetail(6);

    expect(detail, isNotNull);
    expect(detail!.name, 'charizard');
    expect(detail.variants, hasLength(2));
    expect(detail.typeEfficacies, hasLength(1));
    expect(remote.calls, 1);
  });

  test('watchDetail reacciona a los cambios de Drift', () async {
    final iterator = StreamIterator(repository.watchDetail(6));

    expect(await iterator.moveNext(), isTrue);
    expect(iterator.current, isNull);

    await repository.refreshDetail(6);

    expect(await iterator.moveNext(), isTrue);
    expect(iterator.current!.name, 'charizard');
    expect(iterator.current!.evolutions, hasLength(2));

    await iterator.cancel();
  });

  test('refrescar no sobrescribe favoritos', () async {
    await repository.refreshDetail(6);
    await db.into(db.favorites).insert(
          FavoritesCompanion.insert(pokemonId: Value(6)),
        );

    await repository.refreshDetail(6);

    expect(await count('SELECT COUNT(*) AS total FROM favorite'), 1);
  });

  test('un id invalido falla antes de consultar la red', () async {
    await expectLater(
      repository.refreshDetail(0),
      throwsA(isA<ValidationFailure>()),
    );
    expect(remote.calls, 0);
  });
}
