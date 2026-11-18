import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../core/database/app_database.dart';
import '../features/pokemon/data/catalog_load_store.dart';
import '../features/pokemon/data/catalog_loader.dart';
import '../features/pokemon/data/connection_checker.dart';
import '../features/pokemon/data/mappers/pokemon_mapper.dart';
import '../features/pokemon/data/pokemon_local_repository.dart';
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

// Repositorio utilizado para consultar los Pokemon.
final pokemonRepositoryProvider = Provider<PokemonRepository>((ref) {
  final db = ref.watch(appDatabaseProvider);

  return PokemonLocalRepository(db);
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
