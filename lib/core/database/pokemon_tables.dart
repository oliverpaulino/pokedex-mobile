import 'package:drift/drift.dart';

// 1. Tabla de Pokemon
@TableIndex(name: 'pokemon_name_index', columns: {#name})
class Pokemons extends Table {
  @override
  String get tableName => 'pokemon';

  IntColumn get id => integer()();

  IntColumn get nationalDexNumber => integer().unique()();

  TextColumn get name => text()();

  TextColumn get imageUrl => text().nullable()();

  TextColumn get artworkLocalPath => text().nullable()();

  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();

  @override
  Set<Column> get primaryKey => {id};
}

// 2. Tabla de tipos
class Types extends Table {
  @override
  String get tableName => 'type';

  IntColumn get id => integer()();

  TextColumn get name => text().unique()();

  @override
  Set<Column> get primaryKey => {id};
}

// 3. Relacion entre Pokemon y tipos
class PokemonTypes extends Table {
  @override
  String get tableName => 'pokemon_type';

  IntColumn get pokemonId => integer().references(Pokemons, #id)();

  IntColumn get typeId => integer().references(Types, #id)();

  IntColumn get slot => integer()();

  @override
  Set<Column> get primaryKey => {pokemonId, typeId};

  @override
  List<Set<Column>> get uniqueKeys => [
    {pokemonId, slot},
  ];
}

// 4. Tabla de favoritos
class Favorites extends Table {
  @override
  String get tableName => 'favorite';

  IntColumn get pokemonId => integer().references(Pokemons, #id)();

  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();

  @override
  Set<Column> get primaryKey => {pokemonId};
}

// 5. Metadatos de sincronizacion
class SyncMetadata extends Table {
  @override
  String get tableName => 'sync_metadata';

  TextColumn get resourceKey => text()();

  DateTimeColumn get lastSuccessAt => dateTime().nullable()();

  TextColumn get status => text().withDefault(const Constant('pending'))();

  TextColumn get cursorOrOffset => text().nullable()();

  @override
  Set<Column> get primaryKey => {resourceKey};
}
