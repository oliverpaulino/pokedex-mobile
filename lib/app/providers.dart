import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokedex/features/pokemon/data/sync/catalogo_preferencias_store.dart';

import '../core/database/app_database.dart';
import '../features/pokemon/data/sync/catalog_load_store.dart';
import '../features/pokemon/data/sync/catalog_loader.dart';
import '../features/pokemon/data/sync/connection_checker.dart';
import '../features/pokemon/data/mappers/pokemon_mapper.dart';
import '../features/pokemon/data/sync/pokemon_detail_local_repository.dart';
import '../features/pokemon/data/sync/pokemon_local_repository.dart';
import '../features/pokemon/data/remote/pokemon_detail_remote_data_source_provider.dart';
import '../features/pokemon/data/remote/pokemon_remote_data_source_provider.dart';
import '../features/pokemon/domain/catalog_load.dart';
import '../features/pokemon/domain/pokemon_repository.dart';

// Base de datos compartida por la aplicación.
final appDatabaseProvider = Provider<AppDatabase>((ref) {
  final db = AppDatabase.defaults();

  // Cerrar la base al destruir el contenedor de Riverpod.
  ref.onDispose(() {
    db.close();
  });

  return db;
});

final catalogoPreferenciasStoreProvider =
    Provider<CatalogoPreferenciasStore>((ref) {
  final db = ref.watch(appDatabaseProvider);

  return CatalogoPreferenciasStore(db);
});
// Repositorio utilizado para consultar los Pokemon.
final pokemonRepositoryProvider = Provider<PokemonRepository>((ref) {
  final db = ref.watch(appDatabaseProvider);

  return PokemonLocalRepository(db);
});

// Detalle: el repositorio expone refreshDetail(id) y la UI solo observa Drift.
final pokemonDetailRepositoryProvider = Provider<PokemonDetailLocalRepository>((
  ref,
) {
  return PokemonDetailLocalRepository(
    db: ref.watch(appDatabaseProvider),
    remote: ref.watch(pokemonDetailRemoteDataSourceProvider),
  );
});

final catalogLoadStoreProvider = Provider<CatalogLoadStore>((ref) {
  final db = ref.watch(appDatabaseProvider);
  return CatalogLoadStore(db);
});

final catalogLoaderProvider = Provider<CatalogLoader>((ref) {
  return CatalogLoader(
    remoteDataSource: ref.watch(pokemonRemoteDataSourceProvider),
    repository: ref.watch(pokemonRepositoryProvider),
    store: ref.watch(catalogLoadStoreProvider),
    mapper: const PokemonMapper(),
  );
});

final catalogLoadStatusProvider = StreamProvider<CatalogLoadInfo>((ref) {
  return ref.watch(catalogLoadStoreProvider).watch();
});

final connectionStatusProvider = StreamProvider<ConnectionStatus>((ref) {
  final checker = ConnectionChecker(
    remoteDataSource: ref.watch(pokemonRemoteDataSourceProvider),
  );

  final controller = StreamController<ConnectionStatus>();

  Future<void> emitCheck() async {
    final status = await checker.check();
    if (!controller.isClosed) {
      controller.add(status);
    }
  }

  controller.add(ConnectionStatus.checking);
  unawaited(emitCheck());

  final timer = Timer.periodic(const Duration(seconds: 30), (_) {
    unawaited(emitCheck());
  });

  ref.onDispose(() {
    timer.cancel();
    controller.close();
  });

  return controller.stream;
});
