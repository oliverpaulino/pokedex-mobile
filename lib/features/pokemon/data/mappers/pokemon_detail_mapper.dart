import 'dart:convert';

import 'package:drift/drift.dart';

import '../../../../core/database/app_database.dart'
    hide Pokemon, PokemonType, PokemonAbility, PokemonMove, TypeEfficacy;
import '../../domain/entities.dart';
import '../../domain/pokemon_detail.dart';
import '../dto/pokemon_detail_dto.dart';

/// DTO -> entidad de dominio y DTO -> filas Drift.
class PokemonDetailMapper {
  const PokemonDetailMapper();

  PokemonDetail toEntity(PokemonDetailDto dto) {
    final stats = dto.stats;

    return PokemonDetail(
      id: dto.id,
      number: dto.id,
      name: dto.name,
      isDefault: dto.isDefault,
      imageUrl: dto.preferredImageUrl,
      spriteUrl: dto.frontUrl,
      shinyArtworkUrl: dto.shinyArtworkUrl,
      shinySpriteUrl: dto.shinyFrontUrl,
      heightDecimeters: dto.heightDecimeters,
      weightHectograms: dto.weightHectograms,
      species: PokemonSpeciesInfo(
        id: dto.species.id,
        name: dto.species.name,
        generationId: dto.species.generationId,
        evolutionChainId: dto.species.evolutionChainId,
        eggGroups: dto.species.eggGroups,
      ),
      types: dto.types
          .map((type) => PokemonType(id: type.id, name: type.name))
          .toList(growable: false),
      stats: stats == null
          ? null
          : PokemonDetailStats(
              hp: stats.hp,
              attack: stats.attack,
              defense: stats.defense,
              specialAttack: stats.specialAttack,
              specialDefense: stats.specialDefense,
              speed: stats.speed,
            ),
      abilities: dto.abilities
          .map(
            (ability) => PokemonAbility(
              id: ability.id,
              name: ability.name,
              effectSummary: ability.effectSummary,
              isHidden: ability.isHidden,
              slot: ability.slot,
            ),
          )
          .toList(growable: false),
      moves: dto.moves
          .map(
            (move) => PokemonMove(
              id: move.id,
              name: move.name,
              versionGroup: move.versionGroup,
              learnMethod: move.learnMethod,
              levelLearned: move.levelLearned,
            ),
          )
          .toList(growable: false),
      variants: dto.variants
          .map(
            (variant) => PokemonVariant(
              id: variant.id,
              name: variant.name,
              isDefault: variant.isDefault,
            ),
          )
          .toList(growable: false),
      evolutions: dto.evolutions
          .map(
            (evolution) => PokemonEvolution(
              fromSpeciesId: evolution.fromSpeciesId,
              toSpeciesId: evolution.toSpeciesId,
              trigger: evolution.trigger,
              triggerDetail: evolution.triggerDetail,
            ),
          )
          .toList(growable: false),
      typeEfficacies: dto.typeEfficacies
          .map(
            (efficacy) => TypeEfficacy(
              attackingTypeId: efficacy.attackingTypeId,
              attackingTypeName: efficacy.attackingTypeName,
              defendingTypeId: efficacy.defendingTypeId,
              defendingTypeName: efficacy.defendingTypeName,
              damageFactor: efficacy.damageFactor,
            ),
          )
          .toList(growable: false),
    );
  }

  PokemonsCompanion toPokemonTable(
    PokemonDetailDto dto, {
    DateTime? updatedAt,
  }) {
    return PokemonsCompanion.insert(
      id: Value(dto.id),
      nationalDexNumber: dto.id,
      name: dto.name,
      speciesId: Value(dto.species.id),
      isDefault: Value(dto.isDefault),
      imageUrl: Value(dto.preferredImageUrl),
      spriteUrl: Value(dto.frontUrl),
      shinyArtworkUrl: Value(dto.shinyArtworkUrl),
      shinySpriteUrl: Value(dto.shinyFrontUrl),
      heightDecimeters: Value(dto.heightDecimeters),
      weightHectograms: Value(dto.weightHectograms),
      updatedAt: Value(updatedAt ?? DateTime.now()),
    );
  }

  /// Variantes = otras filas de `pokemon` de la misma especie. Se insertan
  /// solo con su identidad para no sobrescribir un detalle ya descargado.
  List<PokemonsCompanion> toVariantTables(PokemonDetailDto dto) {
    return dto.variants
        .where((variant) => variant.id != dto.id)
        .map(
          (variant) => PokemonsCompanion.insert(
            id: Value(variant.id),
            nationalDexNumber: dto.id,
            name: variant.name,
            speciesId: Value(dto.species.id),
            isDefault: Value(variant.isDefault),
          ),
        )
        .toList(growable: false);
  }

  List<PokemonSpeciesCompanion> toSpeciesTables(PokemonDetailDto dto) {
    final species = dto.species;
    final companions = <PokemonSpeciesCompanion>[
      PokemonSpeciesCompanion.insert(
        id: Value(species.id),
        name: species.name,
        generationId: Value(species.generationId),
        evolutionChainId: Value(species.evolutionChainId),
        eggGroupsJson: Value(jsonEncode(species.eggGroups)),
      ),
    ];

    for (final chainSpecies in species.chainSpecies) {
      if (chainSpecies.id == species.id) {
        continue;
      }
      companions.add(
        PokemonSpeciesCompanion.insert(
          id: Value(chainSpecies.id),
          name: chainSpecies.name,
          evolutionChainId: Value(species.evolutionChainId),
        ),
      );
    }

    return List.unmodifiable(companions);
  }

  List<TypesCompanion> toTypeTables(PokemonDetailDto dto) {
    return dto.types
        .map(
          (type) => TypesCompanion.insert(
            id: Value(type.id),
            name: type.name,
          ),
        )
        .toList(growable: false);
  }

  List<PokemonTypesCompanion> toPokemonTypeTables(PokemonDetailDto dto) {
    return dto.types
        .map(
          (type) => PokemonTypesCompanion.insert(
            pokemonId: dto.id,
            typeId: type.id,
            slot: type.slot,
          ),
        )
        .toList(growable: false);
  }

  PokemonStatsCompanion? toStatsTable(PokemonDetailDto dto) {
    final stats = dto.stats;
    if (stats == null) {
      return null;
    }

    return PokemonStatsCompanion.insert(
      pokemonId: Value(dto.id),
      hp: stats.hp,
      attack: stats.attack,
      defense: stats.defense,
      specialAttack: stats.specialAttack,
      specialDefense: stats.specialDefense,
      speed: stats.speed,
    );
  }

  List<AbilitiesCompanion> toAbilityTables(PokemonDetailDto dto) {
    return dto.abilities
        .map(
          (ability) => AbilitiesCompanion.insert(
            id: Value(ability.id),
            name: ability.name,
            effectSummary: Value(ability.effectSummary),
          ),
        )
        .toList(growable: false);
  }

  List<PokemonAbilitiesCompanion> toPokemonAbilityTables(
    PokemonDetailDto dto,
  ) {
    return dto.abilities
        .map(
          (ability) => PokemonAbilitiesCompanion.insert(
            pokemonId: dto.id,
            abilityId: ability.id,
            isHidden: ability.isHidden,
            slot: ability.slot,
          ),
        )
        .toList(growable: false);
  }

  List<MovesCompanion> toMoveTables(PokemonDetailDto dto) {
    final moves = <int, String>{};
    for (final move in dto.moves) {
      moves.putIfAbsent(move.id, () => move.name);
    }

    return moves.entries
        .map(
          (entry) => MovesCompanion.insert(
            id: Value(entry.key),
            name: entry.value,
          ),
        )
        .toList(growable: false);
  }

  List<PokemonMovesCompanion> toPokemonMoveTables(PokemonDetailDto dto) {
    return dto.moves
        .map(
          (move) => PokemonMovesCompanion.insert(
            pokemonId: dto.id,
            moveId: move.id,
            versionGroup: move.versionGroup,
            learnMethod: move.learnMethod,
            levelLearned: Value(move.levelLearned),
          ),
        )
        .toList(growable: false);
  }

  List<EvolutionsCompanion> toEvolutionTables(PokemonDetailDto dto) {
    return dto.evolutions
        .map(
          (evolution) => EvolutionsCompanion.insert(
            fromSpeciesId: evolution.fromSpeciesId,
            toSpeciesId: evolution.toSpeciesId,
            trigger: evolution.trigger,
            triggerDetail: Value(evolution.triggerDetail),
          ),
        )
        .toList(growable: false);
  }

  /// La tabla de eficacias cubre los 18 tipos, no solo los del Pokemon.
  /// Estos tipos deben existir antes por la foreign key.
  List<TypesCompanion> toEfficacyTypeTables(PokemonDetailDto dto) {
    final tipos = <int, String>{};
    for (final efficacy in dto.typeEfficacies) {
      tipos.putIfAbsent(efficacy.attackingTypeId, () => efficacy.attackingTypeName);
      tipos.putIfAbsent(efficacy.defendingTypeId, () => efficacy.defendingTypeName);
    }

    return tipos.entries
        .map(
          (entry) => TypesCompanion.insert(
            id: Value(entry.key),
            name: entry.value,
          ),
        )
        .toList(growable: false);
  }

  List<TypeEfficaciesCompanion> toTypeEfficacyTables(PokemonDetailDto dto) {
    return dto.typeEfficacies
        .map(
          (efficacy) => TypeEfficaciesCompanion.insert(
            attackingTypeId: efficacy.attackingTypeId,
            defendingTypeId: efficacy.defendingTypeId,
            damageFactor: efficacy.damageFactor,
          ),
        )
        .toList(growable: false);
  }
}
