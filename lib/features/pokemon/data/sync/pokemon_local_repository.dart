import 'package:drift/drift.dart';
import 'package:pokedex/features/pokemon/domain/pokemon_orden.dart';

import '../../../../core/database/app_database.dart' hide Pokemon, PokemonType;
import '../../domain/entities.dart';
import '../../domain/failures.dart';
import '../../domain/pokemon_repository.dart';

class PokemonLocalRepository implements PokemonRepository {
  final AppDatabase db;

  PokemonLocalRepository(this.db);

  // Validar los Pokemon recibidos.
  void validar(List<Pokemon> pokemons) {
    final ids = <int>{};

    for (final pokemon in pokemons) {
      if (pokemon.id <= 0 ||
          pokemon.number <= 0 ||
          pokemon.name.trim().isEmpty ||
          pokemon.types.isEmpty ||
          pokemon.types.length > 2) {
        throw const ValidationFailure(
          'Los datos del Pokemon no son validos',
        );
      }

      if (!ids.add(pokemon.id)) {
        throw const ValidationFailure(
          'Hay Pokemon duplicados en el lote',
        );
      }

      final idsTipos = <int>{};

      for (final tipo in pokemon.types) {
        if (tipo.id <= 0 ||
            tipo.name.trim().isEmpty ||
            !idsTipos.add(tipo.id)) {
          throw const ValidationFailure(
            'Los tipos del Pokemon no son validos',
          );
        }
      }
    }
  }

  // Convertir los resultados SQLite a entidades Domain.
  List<Pokemon> convertir(List<QueryRow> filas) {
    final resultado = <int, Pokemon>{};
    final tipos = <int, List<PokemonType>>{};

    for (final fila in filas) {
      final id = fila.read<int>('id');

      tipos.putIfAbsent(id, () => []);

      resultado.putIfAbsent(
        id,
        () => Pokemon(
          id: id,
          number: fila.read<int>('number'),
          name: fila.read<String>('name'),
          imageUrl: fila.readNullable<String>('image_url'),
          types: tipos[id]!,
        ),
      );

      final tipoId = fila.readNullable<int>('type_id');

      if (tipoId != null) {
        tipos[id]!.add(
          PokemonType(
            id: tipoId,
            name: fila.read<String>('type_name'),
          ),
        );
      }
    }

    return resultado.values.toList();
  }

  // Consulta compartida para obtener Pokemon y sus tipos.
  static const consulta = '''
    SELECT
      p.id,
      p.national_dex_number AS number,
      p.name,
      p.image_url,
      t.id AS type_id,
      t.name AS type_name
    FROM pokemon p
    LEFT JOIN pokemon_type pt
      ON p.id = pt.pokemon_id
    LEFT JOIN type t
      ON pt.type_id = t.id
  ''';

  @override
  Stream<List<Pokemon>> watchPokemon({
    String search = '',
    int? tipoId,
    OrdenPokemon orden = OrdenPokemon.numero,
    bool ascendente=true,
  }) {

    // Elegir ASC o DESC.
    final direccion = ascendente ? 'ASC' : 'DESC';

    // Elegir la ordenacion solicitada.
    final ordenSql = switch (orden) {
      OrdenPokemon.numero => 'p.national_dex_number $direccion, p.id ASC',
      OrdenPokemon.nombre => 'LOWER(p.name) $direccion, p.id ASC',
      OrdenPokemon.totalBase => '''
      CASE
        WHEN ps.pokemon_id IS NULL THEN 1
        ELSE 0
      END ASC,
      (
        ps.hp +
        ps.attack +
        ps.defense +
        ps.special_attack +
        ps.special_defense +
        ps.speed
      ) $direccion,
      p.national_dex_number ASC,
      p.id ASC
    ''',
    };

    // Filtrar por tipo solo cuando se selecciono alguno.
    final filtroTipo = tipoId == null
        ? ''
        : '''
        AND EXISTS (
          SELECT 1
          FROM pokemon_type pt_filtro
          WHERE pt_filtro.pokemon_id = p.id
            AND pt_filtro.type_id = ?
        )
      ''';

    // Los valores se envian como parametros SQL.
    final variables = [
      Variable.withString('%${search.trim()}%'),
      if (tipoId != null) Variable.withInt(tipoId),
    ];

    final sql = '''
    $consulta

    LEFT JOIN pokemon_stats ps
      ON ps.pokemon_id = p.id

    WHERE LOWER(p.name) LIKE LOWER(?)

    $filtroTipo

    ORDER BY $ordenSql, pt.slot ASC
  ''';

    return db
        .customSelect(
          sql,
          variables: variables,
          readsFrom: {
            db.pokemons,
            db.types,
            db.pokemonTypes,
            db.pokemonStats,
          },
        )
        .watch()
        .map(convertir);
  }

  // Guardar o actualizar sin duplicados.
  @override
  Future<void> savePokemon(List<Pokemon> pokemons) async {
    validar(pokemons);

    await db.transaction(() async {
      for (final pokemon in pokemons) {
        // Insertar o actualizar el Pokemon.
        await db.into(db.pokemons).insertOnConflictUpdate(
              PokemonsCompanion.insert(
                id: Value(pokemon.id),
                nationalDexNumber: pokemon.number,
                name: pokemon.name,
                imageUrl: Value(pokemon.imageUrl),
                updatedAt: Value(DateTime.now()),
              ),
            );

        // Eliminar las relaciones antiguas de tipos.
        await (db.delete(db.pokemonTypes)
              ..where(
                (tabla) => tabla.pokemonId.equals(pokemon.id),
              ))
            .go();

        // Guardar los tipos actuales.

        // Guardar los tipos actuales.
        for (var i = 0; i < pokemon.types.length; i++) {
          final tipo = pokemon.types[i];

          await db.into(db.types).insertOnConflictUpdate(
                TypesCompanion.insert(
                  id: Value(tipo.id),
                  name: tipo.name,
                ),
              );

          await db.into(db.pokemonTypes).insert(
                PokemonTypesCompanion.insert(
                  pokemonId: pokemon.id,
                  typeId: tipo.id,
                  slot: i + 1,
                ),
              );
        }

        // Guardar las estadisticas una sola vez por Pokemon.
        final stats = pokemon.baseStats;

        if (stats != null) {
          await db.into(db.pokemonStats).insertOnConflictUpdate(
                PokemonStatsCompanion.insert(
                  pokemonId: Value(pokemon.id),
                  hp: stats.hp,
                  attack: stats.attack,
                  defense: stats.defense,
                  specialAttack: stats.specialAttack,
                  specialDefense: stats.specialDefense,
                  speed: stats.speed,
                ),
              );
        }
      }
    });
  }

  @override
  Future<Pokemon?> getPokemon(int id) async {
    final filas = await db.customSelect(
      '''
    $consulta
    WHERE p.id = ?
    ORDER BY pt.slot
    ''',
      variables: [
        Variable.withInt(id),
      ],
    ).get();

    final resultado = convertir(filas);

    if (resultado.isEmpty) {
      return null;
    }

    return resultado.first;
  }
}
