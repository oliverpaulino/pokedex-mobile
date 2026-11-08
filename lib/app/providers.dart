import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../core/database/app_database.dart';
import '../features/pokemon/data/pokemon_local_repository.dart';
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
