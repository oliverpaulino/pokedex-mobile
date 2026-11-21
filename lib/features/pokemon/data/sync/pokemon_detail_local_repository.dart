import 'dart:convert';

import 'package:drift/drift.dart';

import '../../../../core/database/app_database.dart'
    hide Pokemon, PokemonType, PokemonAbility, PokemonMove, TypeEfficacy;
import '../../domain/entities.dart';
import '../../domain/failures.dart';
import '../../domain/pokemon_detail.dart';
import '../../domain/pokemon_detail_repository.dart';
import '../dto/pokemon_detail_dto.dart';
import '../mappers/pokemon_detail_mapper.dart';
import '../remote/pokemon_detail_remote_data_source.dart';

/// Unico punto de entrada del detalle: remoto para refrescar, Drift para leer.
class PokemonDetailLocalRepository implements PokemonDetailRepository {
  final AppDatabase db;
  final PokemonDetailRemoteDataSource remote;
  final PokemonDetailMapper mapper;

  const PokemonDetailLocalRepository({
    required this.db,
    required this.remote,
    this.mapper = const PokemonDetailMapper(),
  });

  @override
  Future<PokemonDetail> refreshDetail(int id) async {
    if (id <= 0) {
      throw const ValidationFailure('El id del Pokemon debe ser mayor que cero');
    }

    final dto = await remote.fetchDetail(id: id);
    await saveDetail(dto);
    return mapper.toEntity(dto);
  }

  /// Guarda una respuesta ya validada. Upsert transaccional por claves de
  Future<void> saveDetail(PokemonDetailDto dto) async {
    dto.validate();

    await db.transaction(() async {
      final ahora = DateTime.now();

      for (final species in mapper.toSpeciesTables(dto)) {
        await db.into(db.pokemonSpecies).insertOnConflictUpdate(species);
      }

      await db.into(db.pokemons).insertOnConflictUpdate(
            mapper.toPokemonTable(dto, updatedAt: ahora),
          );

      for (final variant in mapper.toVariantTables(dto)) {
        await db.into(db.pokemons).insertOnConflictUpdate(variant);
      }

      for (final type in mapper.toTypeTables(dto)) {
        await db.into(db.types).insertOnConflictUpdate(type);
      }
      await (db.delete(db.pokemonTypes)
            ..where((table) => table.pokemonId.equals(dto.id)))
          .go();
      for (final type in mapper.toPokemonTypeTables(dto)) {
        await db.into(db.pokemonTypes).insertOnConflictUpdate(type);
      }

      final stats = mapper.toStatsTable(dto);
      if (stats != null) {
        await db.into(db.pokemonStats).insertOnConflictUpdate(stats);
      }

      for (final ability in mapper.toAbilityTables(dto)) {
        await db.into(db.abilities).insertOnConflictUpdate(ability);
      }
      await (db.delete(db.pokemonAbilities)
            ..where((table) => table.pokemonId.equals(dto.id)))
          .go();
      for (final ability in mapper.toPokemonAbilityTables(dto)) {
        await db.into(db.pokemonAbilities).insertOnConflictUpdate(ability);
      }

      for (final move in mapper.toMoveTables(dto)) {
        await db.into(db.moves).insertOnConflictUpdate(move);
      }
      await (db.delete(db.pokemonMoves)
            ..where((table) => table.pokemonId.equals(dto.id)))
          .go();
      for (final move in mapper.toPokemonMoveTables(dto)) {
        await db.into(db.pokemonMoves).insertOnConflictUpdate(move);
      }

      final chainIds = <int>{
        dto.species.id,
        ...dto.species.chainSpecies.map((species) => species.id),
      }.toList();
      await (db.delete(db.evolutions)
            ..where(
              (table) =>
                  table.fromSpeciesId.isIn(chainIds) |
                  table.toSpeciesId.isIn(chainIds),
            ))
          .go();
      for (final evolution in mapper.toEvolutionTables(dto)) {
        await db.into(db.evolutions).insertOnConflictUpdate(evolution);
      }

      for (final type in mapper.toEfficacyTypeTables(dto)) {
        await db.into(db.types).insertOnConflictUpdate(type);
      }
      for (final efficacy in mapper.toTypeEfficacyTables(dto)) {
        await db.into(db.typeEfficacies).insertOnConflictUpdate(efficacy);
      }
    });
  }

  @override
  Stream<PokemonDetail?> watchDetail(int id) {
    return _baseQuery(id).watch().asyncMap((rows) => _readDetail(id));
  }

  @override
  Future<PokemonDetail?> getDetail(int id) async {
    return _readDetail(id);
  }

  Selectable<QueryRow> _baseQuery(int id) {
    return db.customSelect(
      '''
      SELECT
        p.id,
        p.national_dex_number AS number,
        p.name,
        p.is_default,
        p.image_url,
        p.sprite_url,
        p.shiny_artwork_url,
        p.shiny_sprite_url,
        p.height_decimeters,
        p.weight_hectograms,
        s.id AS species_id,
        s.name AS species_name,
        s.generation_id AS species_generation_id,
        s.evolution_chain_id,
        s.egg_groups_json
      FROM pokemon p
      LEFT JOIN pokemon_species s ON p.species_id = s.id
      WHERE p.id = ?
      ''',
      variables: [Variable.withInt(id)],
      readsFrom: {
        db.pokemons,
        db.pokemonSpecies,
        db.pokemonTypes,
        db.pokemonStats,
        db.abilities,
        db.pokemonAbilities,
        db.moves,
        db.pokemonMoves,
        db.evolutions,
        db.typeEfficacies,
        db.types,
      },
    );
  }

  Future<PokemonDetail?> _readDetail(int id) async {
    final base = await _baseQuery(id).get();
    if (base.isEmpty) {
      return null;
    }

    final row = base.first;
    final speciesId = row.read<int>('species_id');
    final chainId = row.readNullable<int>('evolution_chain_id') ?? speciesId;

    final types = await db.customSelect(
      '''
      SELECT t.id, t.name, pt.slot
      FROM pokemon_type pt
      JOIN type t ON t.id = pt.type_id
      WHERE pt.pokemon_id = ?
      ORDER BY pt.slot
      ''',
      variables: [Variable.withInt(id)],
    ).get();

    final stats = await db.customSelect(
      '''
      SELECT hp, attack, defense, special_attack, special_defense, speed
      FROM pokemon_stats
      WHERE pokemon_id = ?
      LIMIT 1
      ''',
      variables: [Variable.withInt(id)],
    ).get();

    final abilities = await db.customSelect(
      '''
      SELECT a.id, a.name, a.effect_summary, pa.is_hidden, pa.slot
      FROM pokemon_ability pa
      JOIN ability a ON a.id = pa.ability_id
      WHERE pa.pokemon_id = ?
      ORDER BY pa.slot
      ''',
      variables: [Variable.withInt(id)],
    ).get();

    final moves = await db.customSelect(
      '''
      SELECT m.id, m.name, pm.version_group, pm.learn_method, pm.level_learned
      FROM pokemon_move pm
      JOIN move m ON m.id = pm.move_id
      WHERE pm.pokemon_id = ?
      ORDER BY pm.version_group, pm.learn_method, pm.level_learned, m.name
      ''',
      variables: [Variable.withInt(id)],
    ).get();

    final variants = await db.customSelect(
      '''
      SELECT id, name, is_default
      FROM pokemon
      WHERE species_id = ?
      ORDER BY id
      ''',
      variables: [Variable.withInt(speciesId)],
    ).get();

    final evolutions = await db.customSelect(
      '''
      SELECT
        e.from_species_id,
        e.to_species_id,
        e.trigger,
        e.trigger_detail,
        fs.name AS from_name,
        ts.name AS to_name
      FROM evolution e
      JOIN pokemon_species fs ON fs.id = e.from_species_id
      JOIN pokemon_species ts ON ts.id = e.to_species_id
      WHERE fs.evolution_chain_id = ?
         OR ts.evolution_chain_id = ?
         OR fs.id = ?
         OR ts.id = ?
      ORDER BY e.from_species_id, e.to_species_id, e.trigger
      ''',
      variables: [
        Variable.withInt(chainId),
        Variable.withInt(chainId),
        Variable.withInt(speciesId),
        Variable.withInt(speciesId),
      ],
    ).get();

    final efficacies = await db.customSelect(
      '''
      SELECT
        te.damage_factor,
        at.id AS attacking_id,
        at.name AS attacking_name,
        dt.id AS defending_id,
        dt.name AS defending_name
      FROM type_efficacy te
      JOIN type at ON at.id = te.attacking_type_id
      JOIN type dt ON dt.id = te.defending_type_id
      WHERE te.defending_type_id IN (
        SELECT type_id FROM pokemon_type WHERE pokemon_id = ?
      )
      ORDER BY at.name, dt.name
      ''',
      variables: [Variable.withInt(id)],
    ).get();

    PokemonDetailStats? detailStats;
    if (stats.isNotEmpty) {
      final stat = stats.first;
      detailStats = PokemonDetailStats(
        hp: stat.read<int>('hp'),
        attack: stat.read<int>('attack'),
        defense: stat.read<int>('defense'),
        specialAttack: stat.read<int>('special_attack'),
        specialDefense: stat.read<int>('special_defense'),
        speed: stat.read<int>('speed'),
      );
    }

    return PokemonDetail(
      id: row.read<int>('id'),
      number: row.read<int>('number'),
      name: row.read<String>('name'),
      isDefault: row.read<bool>('is_default'),
      imageUrl: row.readNullable<String>('image_url'),
      spriteUrl: row.readNullable<String>('sprite_url'),
      shinyArtworkUrl: row.readNullable<String>('shiny_artwork_url'),
      shinySpriteUrl: row.readNullable<String>('shiny_sprite_url'),
      heightDecimeters: row.readNullable<int>('height_decimeters') ?? 0,
      weightHectograms: row.readNullable<int>('weight_hectograms') ?? 0,
      species: PokemonSpeciesInfo(
        id: speciesId,
        name: row.read<String>('species_name'),
        generationId: row.readNullable<int>('species_generation_id'),
        evolutionChainId: row.readNullable<int>('evolution_chain_id'),
        eggGroups: _decodeEggGroups(row.readNullable<String>('egg_groups_json')),
      ),
      types: types
          .map(
            (type) => PokemonType(
              id: type.read<int>('id'),
              name: type.read<String>('name'),
            ),
          )
          .toList(growable: false),
      stats: detailStats,
      abilities: abilities
          .map(
            (ability) => PokemonAbility(
              id: ability.read<int>('id'),
              name: ability.read<String>('name'),
              effectSummary: ability.readNullable<String>('effect_summary'),
              isHidden: ability.read<bool>('is_hidden'),
              slot: ability.read<int>('slot'),
            ),
          )
          .toList(growable: false),
      moves: moves
          .map(
            (move) => PokemonMove(
              id: move.read<int>('id'),
              name: move.read<String>('name'),
              versionGroup: move.read<String>('version_group'),
              learnMethod: move.read<String>('learn_method'),
              levelLearned: move.read<int>('level_learned'),
            ),
          )
          .toList(growable: false),
      variants: variants
          .map(
            (variant) => PokemonVariant(
              id: variant.read<int>('id'),
              name: variant.read<String>('name'),
              isDefault: variant.read<bool>('is_default'),
            ),
          )
          .toList(growable: false),
      evolutions: evolutions
          .map(
            (evolution) => PokemonEvolution(
              fromSpeciesId: evolution.read<int>('from_species_id'),
              toSpeciesId: evolution.read<int>('to_species_id'),
              trigger: evolution.read<String>('trigger'),
              triggerDetail: evolution.readNullable<String>('trigger_detail'),
              fromSpeciesName: evolution.readNullable<String>('from_name'),
              toSpeciesName: evolution.readNullable<String>('to_name'),
            ),
          )
          .toList(growable: false),
      typeEfficacies: efficacies
          .map(
            (efficacy) => TypeEfficacy(
              attackingTypeId: efficacy.read<int>('attacking_id'),
              attackingTypeName: efficacy.read<String>('attacking_name'),
              defendingTypeId: efficacy.read<int>('defending_id'),
              defendingTypeName: efficacy.read<String>('defending_name'),
              damageFactor: efficacy.read<int>('damage_factor'),
            ),
          )
          .toList(growable: false),
    );
  }

  List<String> _decodeEggGroups(String? json) {
    if (json == null || json.isEmpty) {
      return const [];
    }

    try {
      final decoded = jsonDecode(json);
      if (decoded is List) {
        return decoded.map((value) => value.toString()).toList(growable: false);
      }
    } catch (_) {
      // Un valor corrupto no debe impedir leer el resto del detalle.
    }

    return const [];
  }
}
