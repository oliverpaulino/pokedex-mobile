import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';

import 'pokemon_tables.dart';

part 'app_database.g.dart';

@DriftDatabase(
  tables: [
    Pokemons,
    Types,
    PokemonTypes,
    Favorites,
    SyncMetadata,
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase(super.executor);

  AppDatabase.defaults() : super(driftDatabase(name: 'pokedex'));

  @override
  int get schemaVersion => 2;

  @override
  MigrationStrategy get migration => MigrationStrategy(
        onCreate: (m) async {
          await m.createAll();
        },
        onUpgrade: (m, from, to) async {
          if (from < 2) {
            await m.deleteTable('sync_metadata');
            await m.createTable(syncMetadata);
          }
        },
        beforeOpen: (details) async {
          await customStatement('PRAGMA foreign_keys = ON');
        },
      );
}
