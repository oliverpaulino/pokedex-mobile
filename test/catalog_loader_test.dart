import 'dart:async';

import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pokedex/core/database/app_database.dart';
import 'package:pokedex/features/pokemon/data/sync/catalog_load_store.dart';
import 'package:pokedex/features/pokemon/data/sync/catalog_loader.dart';
import 'package:pokedex/features/pokemon/data/dto/pokemon_catalog_dto.dart';
import 'package:pokedex/features/pokemon/data/mappers/pokemon_mapper.dart';
import 'package:pokedex/features/pokemon/data/sync/pokemon_local_repository.dart';
import 'package:pokedex/features/pokemon/data/remote/pokemon_remote_data_source.dart';
import 'package:pokedex/features/pokemon/domain/catalog_load.dart';
import 'package:pokedex/features/pokemon/domain/failures.dart';

class FakeCatalogRemoteDataSource implements PokemonCatalogRemoteDataSource {
  FakeCatalogRemoteDataSource(this.handler);

  final Future<PokemonCatalogDto> Function(int limit, int offset) handler;
  int calls = 0;

  @override
  Future<PokemonCatalogDto> fetchCatalog({
    required int limit,
    required int offset,
  }) {
    calls++;
    return handler(limit, offset);
  }
}

PokemonDto _pokemon(int id) {
  return PokemonDto(
    id: id,
    name: 'pokemon-$id',
    types: [
      PokemonTypeDto(id: 1, name: 'grass', slot: 1),
    ],
  );
}

PokemonCatalogDto _page({
  required List<int> ids,
  required int totalCount,
}) {
  return PokemonCatalogDto(
    pokemons: ids.map(_pokemon).toList(growable: false),
    totalCount: totalCount,
  );
}

void main() {
  late AppDatabase db;
  late CatalogLoadStore store;
  late PokemonLocalRepository repository;

  setUp(() {
    db = AppDatabase(NativeDatabase.memory());
    store = CatalogLoadStore(db);
    repository = PokemonLocalRepository(db);
  });

  tearDown(() async {
    await db.close();
  });

  CatalogLoader buildLoader(
    PokemonCatalogRemoteDataSource remote, {
    DateTime Function()? now,
    int pageSize = 2,
    int maxAttempts = 3,
  }) {
    return CatalogLoader(
      remoteDataSource: remote,
      repository: repository,
      store: store,
      mapper: const PokemonMapper(),
      pageSize: pageSize,
      maxAttempts: maxAttempts,
      initialBackoff: Duration.zero,
      now: now ?? DateTime.now,
    );
  }

  test('descarga todas las paginas y marca exito con lastSuccessAt', () async {
    final remote = FakeCatalogRemoteDataSource((limit, offset) async {
      expect(limit, 2);
      switch (offset) {
        case 0:
          return _page(ids: [1, 2], totalCount: 3);
        case 2:
          return _page(ids: [3], totalCount: 3);
        default:
          fail('offset inesperado: $offset');
      }
    });

    final completedAt = DateTime(2026, 11, 18, 10, 30);
    final loader = buildLoader(remote, now: () => completedAt);

    await loader.load();

    final info = await store.read();
    expect(info.status, CatalogLoadStatus.success);
    expect(info.lastSuccessAt, completedAt);

    final rows = await db.select(db.pokemons).get();
    expect(rows.map((r) => r.id), containsAll([1, 2, 3]));
    expect(rows, hasLength(3));
    expect(remote.calls, 2);
  });

  test('single-flight: cargas concurrentes comparten la misma operacion',
      () async {
    final gate = Completer<void>();
    var releaseCount = 0;
    final remote = FakeCatalogRemoteDataSource((limit, offset) async {
      if (offset == 0 && releaseCount == 0) {
        releaseCount++;
        await gate.future;
      }
      if (offset == 0) return _page(ids: [1, 2], totalCount: 2);
      return _page(ids: const [], totalCount: 2);
    });

    final loader = buildLoader(remote);

    final f1 = loader.load();
    final f2 = loader.load();

    await Future<void>.delayed(Duration.zero);
    expect(remote.calls, 1);

    gate.complete();
    await Future.wait([f1, f2]);

    expect(remote.calls, 1);
    expect((await store.read()).status, CatalogLoadStatus.success);
  });

  test('marca failed y no lanza ante fallo, conservando lastSuccessAt previo',
      () async {
    final successTime = DateTime(2026, 11, 18, 9, 0);
    await store.markSuccess(successTime);

    final remote = FakeCatalogRemoteDataSource((limit, offset) async {
      throw const NetworkFailure();
    });

    final loader = buildLoader(remote, maxAttempts: 1);

    await expectLater(loader.load(), completes);

    final info = await store.read();
    expect(info.status, CatalogLoadStatus.failed);
    expect(info.lastSuccessAt, successTime);
  });

  test('reintenta fallos transitorios y completa con exito', () async {
    var attempts = 0;
    final remote = FakeCatalogRemoteDataSource((limit, offset) async {
      attempts++;
      if (attempts < 3) {
        throw const TimeoutFailure();
      }
      return _page(ids: [1, 2], totalCount: 2);
    });

    final loader = buildLoader(remote, maxAttempts: 3);

    await loader.load();

    expect(attempts, 3);
    expect((await store.read()).status, CatalogLoadStatus.success);
  });

  test('no duplica pokemon al cargar de nuevo desde 0 (upsert)', () async {
    final remote = FakeCatalogRemoteDataSource((limit, offset) async {
      if (offset == 0) return _page(ids: [1, 2], totalCount: 2);
      return _page(ids: const [], totalCount: 2);
    });

    final loader = buildLoader(remote);

    await loader.load();
    await loader.load();

    final rows = await db.select(db.pokemons).get();
    expect(rows, hasLength(2));
    expect(rows.map((r) => r.id).toSet(), {1, 2});

    final typeLinks = await db.select(db.pokemonTypes).get();
    expect(typeLinks, hasLength(2));
  });

  test('catalogo vacio se marca como success', () async {
    final remote = FakeCatalogRemoteDataSource((limit, offset) async {
      return _page(ids: const [], totalCount: 0);
    });

    final loader = buildLoader(remote);

    await loader.load();

    expect((await store.read()).status, CatalogLoadStatus.success);
    expect(await db.select(db.pokemons).get(), isEmpty);
  });

  test('pagina vacia antes de completar marca failed', () async {
    final remote = FakeCatalogRemoteDataSource((limit, offset) async {
      return _page(ids: const [], totalCount: 10);
    });

    final loader = buildLoader(remote);

    await loader.load();

    expect((await store.read()).status, CatalogLoadStatus.failed);
  });
}
