import 'package:drift/drift.dart';

// La especie agrupa sus variantes. Las evoluciones se relacionan entre especies.
class PokemonSpecies extends Table {
  @override
  String get tableName => 'pokemon_species';

  IntColumn get id => integer()();
  TextColumn get name => text()();
  IntColumn get generationId => integer().nullable()();
  IntColumn get evolutionChainId => integer().nullable()();

  // Lista JSON de nombres. Solo se muestra; no hay filtro por egg group.
  TextColumn get eggGroupsJson => text().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}

// Pokemon representa una forma concreta (id estable de PokeAPI).
// Varias formas pueden tener el mismo numero nacional.
@TableIndex(name: 'pokemon_name_index', columns: {#name})
class Pokemons extends Table {
  @override
  String get tableName => 'pokemon';

  IntColumn get id => integer()();
  IntColumn get nationalDexNumber => integer()();
  IntColumn get speciesId =>
      integer().nullable().references(PokemonSpecies, #id)();
  BoolColumn get isDefault => boolean().withDefault(const Constant(true))();
  TextColumn get name => text()();
  TextColumn get imageUrl => text().nullable()();
  TextColumn get artworkLocalPath => text().nullable()();
  TextColumn get spriteUrl => text().nullable()();
  TextColumn get spriteLocalPath => text().nullable()();
  TextColumn get shinyArtworkUrl => text().nullable()();
  TextColumn get shinyArtworkLocalPath => text().nullable()();
  TextColumn get shinySpriteUrl => text().nullable()();
  TextColumn get shinySpriteLocalPath => text().nullable()();
  // PokeAPI expresa altura en decimetros y peso en hectogramos.
  IntColumn get heightDecimeters => integer().nullable()();
  IntColumn get weightHectograms => integer().nullable()();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();

  @override
  Set<Column> get primaryKey => {id};
}

class Types extends Table {
  @override
  String get tableName => 'type';

  IntColumn get id => integer()();
  TextColumn get name => text().unique()();

  @override
  Set<Column> get primaryKey => {id};
}

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

// Una fila por Pokemon cuando ya se descargaron las seis estadisticas.
class PokemonStats extends Table {
  @override
  String get tableName => 'pokemon_stats';

  IntColumn get pokemonId => integer().references(Pokemons, #id)();
  IntColumn get hp => integer()();
  IntColumn get attack => integer()();
  IntColumn get defense => integer()();
  IntColumn get specialAttack => integer()();
  IntColumn get specialDefense => integer()();
  IntColumn get speed => integer()();

  @override
  Set<Column> get primaryKey => {pokemonId};
}

class Abilities extends Table {
  @override
  String get tableName => 'ability';

  IntColumn get id => integer()();
  TextColumn get name => text()();
  TextColumn get effectSummary => text().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}

class PokemonAbilities extends Table {
  @override
  String get tableName => 'pokemon_ability';

  IntColumn get pokemonId => integer().references(Pokemons, #id)();
  IntColumn get abilityId => integer().references(Abilities, #id)();
  BoolColumn get isHidden => boolean()();
  IntColumn get slot => integer()();

  @override
  Set<Column> get primaryKey => {pokemonId, abilityId};

  @override
  List<Set<Column>> get uniqueKeys => [
    {pokemonId, slot},
  ];
}

class Moves extends Table {
  @override
  String get tableName => 'move';

  IntColumn get id => integer()();
  TextColumn get name => text()();

  @override
  Set<Column> get primaryKey => {id};
}

// Un mismo movimiento puede aprenderse de distintas maneras/versiones.
class PokemonMoves extends Table {
  @override
  String get tableName => 'pokemon_move';

  IntColumn get pokemonId => integer().references(Pokemons, #id)();
  IntColumn get moveId => integer().references(Moves, #id)();
  TextColumn get versionGroup => text()();
  TextColumn get learnMethod => text()();
  IntColumn get levelLearned => integer().withDefault(const Constant(0))();

  @override
  Set<Column> get primaryKey => {
    pokemonId,
    moveId,
    versionGroup,
    learnMethod,
    levelLearned,
  };
}

// Una evolucion es una relacion entre dos especies, no entre sprites.
class Evolutions extends Table {
  @override
  String get tableName => 'evolution';

  IntColumn get fromSpeciesId =>
      integer().references(PokemonSpecies, #id)();
  IntColumn get toSpeciesId => integer().references(PokemonSpecies, #id)();
  TextColumn get trigger => text()();
  TextColumn get triggerDetail => text().nullable()();

  @override
  Set<Column> get primaryKey => {fromSpeciesId, toSpeciesId, trigger};
}

// 0 / 50 / 100 / 200 es el factor porcentual de dano por tipo.
class TypeEfficacies extends Table {
  @override
  String get tableName => 'type_efficacy';

  IntColumn get attackingTypeId => integer().references(Types, #id)();
  IntColumn get defendingTypeId => integer().references(Types, #id)();
  IntColumn get damageFactor => integer()();

  @override
  Set<Column> get primaryKey => {attackingTypeId, defendingTypeId};
}

// Datos del usuario: nunca se borran al refrescar el catalogo.
class Favorites extends Table {
  @override
  String get tableName => 'favorite';

  IntColumn get pokemonId => integer().references(Pokemons, #id)();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();

  @override
  Set<Column> get primaryKey => {pokemonId};
}


// Las partidas de trivia son datos del usuario, no vienen de GraphQL.
// El ranking se calcula ordenando estas filas por puntuacion.
class TriviaResults extends Table {
  @override
  String get tableName => 'trivia_result';

  IntColumn get id => integer().autoIncrement()();
  IntColumn get score => integer()();
  IntColumn get correctAnswers => integer()();
  DateTimeColumn get playedAt => dateTime().withDefault(currentDateAndTime)();
}

// Respuestas de una partida para conservar el historial offline.
class TriviaAnswers extends Table {
  @override
  String get tableName => 'trivia_answer';

  IntColumn get id => integer().autoIncrement()();
  IntColumn get triviaResultId =>
      integer().references(TriviaResults, #id)();
  IntColumn get pokemonId => integer().references(Pokemons, #id)();
  BoolColumn get correct => boolean()();
}

// Preferencias simples del catalogo: busqueda, filtros y orden.
// Claves de ejemplo: catalog_search, catalog_type, catalog_sort.
class AppSettings extends Table {
  @override
  String get tableName => 'app_setting';

  TextColumn get key => text()();
  TextColumn get value => text()();

  @override
  Set<Column> get primaryKey => {key};
}

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
