import 'dart:async';

import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:pokedex/core/database/app_database.dart'
    hide Pokemon, PokemonType;
import 'package:pokedex/features/pokemon/data/dto/pokemon_catalog_dto.dart';
import 'package:pokedex/features/pokemon/data/pokemon_local_repository.dart';
import 'package:pokedex/features/pokemon/data/remote/pokemon_remote_data_source.dart';
import 'package:pokedex/features/pokemon/data/sync/catalog_sync_coordinator.dart';
import 'package:pokedex/features/pokemon/data/sync/drift_catalog_sync_metadata_store.dart';
import 'package:pokedex/features/pokemon/domain/catalog_sync.dart';
import 'package:pokedex/features/pokemon/domain/failures.dart';

/// Fuente remota controlada por una funcion para simular paginas y fallos.
class FakeCatalogRemoteDataSource implements PokemonCatalogRemoteDataSource {
  final Future<PokemonCatalogDto> Function(int limit, int offset) handler;

  final List<int> requestedOffsets = [];
  int calls = 0;

  FakeCatalogRemoteDataSource(this.handler);

  @override
  Future<PokemonCatalogDto> fetchCatalog({
    required int limit,
    required int offset,
  }) {
    calls++;
    requestedOffsets.add(offset);
    return handler(limit, offset);
  }
}

/// Construye una pagina del catalogo con ids consecutivos a partir de [offset].
PokemonCatalogDto buildPage({
  required int offset,
  required int totalCount,
  int pageSize = 20,
}) {
  final remaining = totalCount - offset;
  final count =
      remaining <= 0 ? 0 : (remaining < pageSize ? remaining : pageSize);

  return PokemonCatalogDto(
    pokemons: List.generate(
      count,
      (index) {
        final id = offset + index + 1;

        return PokemonDto(
          id: id,
          name: 'pokemon-$id',
          types: const [
            PokemonTypeDto(id: 1, name: 'normal', slot: 1),
          ],
        );
      },
    ),
    totalCount: totalCount,
  );
}

void main() {
  late AppDatabase db;
  late PokemonLocalRepository repository;
  late DriftCatalogSyncMetadataStore store;

  final fixedNow = DateTime(2026, 5, 1, 12);

  setUp(() {
    db = AppDatabase(NativeDatabase.memory());
    repository = PokemonLocalRepository(db);
    store = DriftCatalogSyncMetadataStore(db);
  });

  tearDown(() async {
    await db.close();
  });

  CatalogSyncCoordinator buildCoordinator(
    FakeCatalogRemoteDataSource remote, {
    int maxAttempts = 3,
  }) {
    return CatalogSyncCoordinator(
      remoteDataSource: remote,
      repository: repository,
      metadataStore: store,
      maxAttempts: maxAttempts,
      initialBackoff: Duration.zero,
      now: () => fixedNow,
    );
  }

  group('descarga completa', () {
    test('recorre todas las paginas y marca success al terminar', () async {
      final remote = FakeCatalogRemoteDataSource(
        (limit, offset) async => buildPage(offset: offset, totalCount: 45),
      );
      final coordinator = buildCoordinator(remote);

      final result = await coordinator.syncInitialCatalog();

      expect(result, isA<CatalogSyncCompleted>());
      final completed = result as CatalogSyncCompleted;
      expect(completed.skipped, isFalse);
      expect(completed.downloaded, 45);
      expect(completed.pages, 3);
      expect(completed.completedAt, fixedNow);
      expect(remote.requestedOffsets, [0, 20, 40]);

      final metadata = await store.read();
      expect(metadata.status, CatalogSyncStatus.success);
      expect(metadata.offset, 0);
      expect(metadata.lastSuccessAt, fixedNow);

      final stored = await repository.watchPokemon().first;
      expect(stored, hasLength(45));
    });

    test('guarda el progreso sin marcar exito antes de terminar', () async {
      final remote = FakeCatalogRemoteDataSource(
        (limit, offset) async {
          if (offset == 20) {
            // Entre paginas el estado es running y aun no hay exito.
            final metadata = await store.read();
            expect(metadata.status, CatalogSyncStatus.running);
            expect(metadata.offset, 20);
            expect(metadata.lastSuccessAt, isNull);
          }

          return buildPage(offset: offset, totalCount: 45);
        },
      );
      final coordinator = buildCoordinator(remote);

      final result = await coordinator.syncInitialCatalog();

      expect(result, isA<CatalogSyncCompleted>());
    });

    test('un catalogo vacio termina sin escrituras de Pokemon', () async {
      final remote = FakeCatalogRemoteDataSource(
        (limit, offset) async => buildPage(offset: offset, totalCount: 0),
      );
      final coordinator = buildCoordinator(remote);

      final result = await coordinator.syncInitialCatalog();

      expect(result, isA<CatalogSyncCompleted>());
      final completed = result as CatalogSyncCompleted;
      expect(completed.downloaded, 0);
      expect(completed.pages, 1);
      expect(remote.requestedOffsets, [0]);

      final metadata = await store.read();
      expect(metadata.status, CatalogSyncStatus.success);
      expect(metadata.lastSuccessAt, fixedNow);
      expect(await repository.watchPokemon().first, isEmpty);
    });
  });

  group('reanudacion', () {
    test('continua desde el offset persistido', () async {
      await store.markFailed(offset: 20);

      final remote = FakeCatalogRemoteDataSource(
        (limit, offset) async => buildPage(offset: offset, totalCount: 45),
      );
      final coordinator = buildCoordinator(remote);

      final result = await coordinator.syncInitialCatalog();

      expect(result, isA<CatalogSyncCompleted>());
      final completed = result as CatalogSyncCompleted;
      expect(completed.downloaded, 25);
      expect(completed.pages, 2);
      expect(remote.requestedOffsets, [20, 40]);

      expect(await repository.watchPokemon().first, hasLength(25));
    });

    test('un offset invalido reinicia desde cero', () async {
      await store.markFailed(offset: -5);

      final remote = FakeCatalogRemoteDataSource(
        (limit, offset) async => buildPage(offset: offset, totalCount: 5),
      );
      final coordinator = buildCoordinator(remote);

      final result = await coordinator.syncInitialCatalog();

      expect(result, isA<CatalogSyncCompleted>());
      expect(remote.requestedOffsets, [0]);
    });
  });

  group('concurrencia', () {
    test('las llamadas simultaneas comparten el mismo Future', () async {
      final gate = Completer<void>();
      final remote = FakeCatalogRemoteDataSource(
        (limit, offset) async {
          if (offset == 0) {
            await gate.future;
          }

          return buildPage(offset: offset, totalCount: 45);
        },
      );
      final coordinator = buildCoordinator(remote);

      final first = coordinator.syncInitialCatalog();
      final second = coordinator.syncInitialCatalog();

      expect(identical(first, second), isTrue);
      expect(coordinator.isSyncing, isTrue);

      gate.complete();

      final results = await Future.wait([first, second]);

      expect(results.first, isA<CatalogSyncCompleted>());
      expect(results[1], same(results.first));
      expect(remote.calls, 3);
      expect(coordinator.isSyncing, isFalse);
    });
  });

  group('fallos', () {
    test('conserva el ultimo offset confirmado y no actualiza lastSuccessAt',
        () async {
      final remote = FakeCatalogRemoteDataSource(
        (limit, offset) async {
          if (offset >= 20) {
            throw const GraphqlFailure('fallo de prueba');
          }

          return buildPage(offset: offset, totalCount: 45);
        },
      );
      final coordinator = buildCoordinator(remote);

      final result = await coordinator.syncInitialCatalog();

      expect(result, isA<CatalogSyncFailed>());
      final failed = result as CatalogSyncFailed;
      expect(failed.failure, isA<GraphqlFailure>());
      expect(failed.lastOffset, 20);
      expect(failed.downloaded, 20);
      expect(failed.pages, 1);
      expect(remote.requestedOffsets, [0, 20]);

      final metadata = await store.read();
      expect(metadata.status, CatalogSyncStatus.failed);
      expect(metadata.offset, 20);
      expect(metadata.lastSuccessAt, isNull);

      expect(await repository.watchPokemon().first, hasLength(20));
    });

    test('una pagina vacia con total pendiente se reporta como fallo',
        () async {
      final remote = FakeCatalogRemoteDataSource(
        (limit, offset) async => const PokemonCatalogDto(
          pokemons: [],
          totalCount: 45,
        ),
      );
      final coordinator = buildCoordinator(remote);

      final result = await coordinator.syncInitialCatalog();

      expect(result, isA<CatalogSyncFailed>());
      final failed = result as CatalogSyncFailed;
      expect(failed.failure, isA<GraphqlFailure>());
      expect(failed.lastOffset, 0);

      final metadata = await store.read();
      expect(metadata.status, CatalogSyncStatus.failed);
      expect(metadata.offset, 0);
    });

    test('refreshCatalog conserva lastSuccessAt si falla', () async {
      await store.markSuccess(completedAt: fixedNow);

      final remote = FakeCatalogRemoteDataSource(
        (limit, offset) async => throw const GraphqlFailure('fallo de prueba'),
      );
      final coordinator = buildCoordinator(remote);

      final result = await coordinator.refreshCatalog();

      expect(result, isA<CatalogSyncFailed>());

      final metadata = await store.read();
      expect(metadata.status, CatalogSyncStatus.failed);
      expect(metadata.lastSuccessAt, fixedNow);
    });
  });

  group('reintentos', () {
    test('reintenta fallos transitorios con backoff', () async {
      var attempts = 0;
      final remote = FakeCatalogRemoteDataSource(
        (limit, offset) async {
          attempts++;

          if (attempts < 3) {
            throw const NetworkFailure();
          }

          return buildPage(offset: offset, totalCount: 5);
        },
      );
      final coordinator = buildCoordinator(remote);

      final result = await coordinator.syncInitialCatalog();

      expect(result, isA<CatalogSyncCompleted>());
      expect(attempts, 3);
      expect(remote.requestedOffsets, [0, 0, 0]);
    });

    test('agota los intentos y reporta el fallo', () async {
      var attempts = 0;
      final remote = FakeCatalogRemoteDataSource(
        (limit, offset) async {
          attempts++;
          throw const TimeoutFailure();
        },
      );
      final coordinator = buildCoordinator(remote, maxAttempts: 3);

      final result = await coordinator.syncInitialCatalog();

      expect(result, isA<CatalogSyncFailed>());
      expect((result as CatalogSyncFailed).failure, isA<TimeoutFailure>());
      expect(attempts, 3);

      final metadata = await store.read();
      expect(metadata.status, CatalogSyncStatus.failed);
      expect(metadata.offset, 0);
    });

    test('no reintenta fallos no transitorios', () async {
      var attempts = 0;
      final remote = FakeCatalogRemoteDataSource(
        (limit, offset) async {
          attempts++;
          throw const GraphqlFailure('fallo permanente');
        },
      );
      final coordinator = buildCoordinator(remote);

      final result = await coordinator.syncInitialCatalog();

      expect(result, isA<CatalogSyncFailed>());
      expect(attempts, 1);
    });
  });

  group('sincronizacion inicial vs actualizacion', () {
    test('omite la carga inicial cuando ya fue exitosa', () async {
      await store.markSuccess(completedAt: fixedNow);

      final remote = FakeCatalogRemoteDataSource(
        (limit, offset) async => buildPage(offset: offset, totalCount: 5),
      );
      final coordinator = buildCoordinator(remote);

      final result = await coordinator.syncInitialCatalog();

      expect(result, isA<CatalogSyncCompleted>());
      final completed = result as CatalogSyncCompleted;
      expect(completed.skipped, isTrue);
      expect(completed.downloaded, 0);
      expect(completed.completedAt, fixedNow);
      expect(remote.calls, 0);

      final metadata = await store.read();
      expect(metadata.status, CatalogSyncStatus.success);
      expect(metadata.lastSuccessAt, fixedNow);
    });

    test('forceRestart vuelve a descargar aunque exista exito', () async {
      await store.markSuccess(completedAt: DateTime(2020));

      final remote = FakeCatalogRemoteDataSource(
        (limit, offset) async => buildPage(offset: offset, totalCount: 5),
      );
      final coordinator = buildCoordinator(remote);

      final result = await coordinator.syncInitialCatalog(forceRestart: true);

      expect(result, isA<CatalogSyncCompleted>());
      expect((result as CatalogSyncCompleted).skipped, isFalse);
      expect(remote.requestedOffsets, [0]);

      final metadata = await store.read();
      expect(metadata.status, CatalogSyncStatus.success);
      expect(metadata.lastSuccessAt, fixedNow);
    });

    test('refreshCatalog siempre reinicia desde cero', () async {
      await store.markSuccess(completedAt: DateTime(2020));

      final remote = FakeCatalogRemoteDataSource(
        (limit, offset) async => buildPage(offset: offset, totalCount: 25),
      );
      final coordinator = buildCoordinator(remote);

      final result = await coordinator.refreshCatalog();

      expect(result, isA<CatalogSyncCompleted>());
      final completed = result as CatalogSyncCompleted;
      expect(completed.skipped, isFalse);
      expect(completed.downloaded, 25);
      expect(remote.requestedOffsets, [0, 20]);

      final metadata = await store.read();
      expect(metadata.status, CatalogSyncStatus.success);
      expect(metadata.lastSuccessAt, fixedNow);
    });
  });
}
