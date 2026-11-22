import '../../domain/failures.dart';
import '../graphql/__generated__/pokemon_detail.data.gql.dart';
import 'pokemon_catalog_dto.dart';

/// Respuesta del detalle ya normalizada. No sale de la capa de datos.
class PokemonDetailDto {
  final int id;
  final String name;
  final bool isDefault;
  final int heightDecimeters;
  final int weightHectograms;
  final String? artworkUrl;
  final String? frontUrl;
  final String? shinyArtworkUrl;
  final String? shinyFrontUrl;
  final PokemonSpeciesDto species;
  final List<PokemonTypeDto> types;
  final PokemonStatsDto? stats;
  final List<PokemonAbilityDto> abilities;
  final List<PokemonMoveDto> moves;
  final List<PokemonVariantDto> variants;
  final List<PokemonEvolutionDto> evolutions;
  final List<TypeEfficacyDto> typeEfficacies;

  const PokemonDetailDto({
    required this.id,
    required this.name,
    required this.isDefault,
    required this.heightDecimeters,
    required this.weightHectograms,
    required this.species,
    required this.types,
    required this.abilities,
    required this.moves,
    required this.variants,
    required this.evolutions,
    required this.typeEfficacies,
    this.stats,
    this.artworkUrl,
    this.frontUrl,
    this.shinyArtworkUrl,
    this.shinyFrontUrl,
  });

  factory PokemonDetailDto.fromGraphql(GPokemonDetailData data) {
    final pokemon = data.pokemon.isEmpty ? null : data.pokemon.first;
    if (pokemon == null) {
      throw const ValidationFailure('La respuesta no trae Pokemon');
    }

    final speciesData = pokemon.species;
    if (speciesData == null) {
      throw const ValidationFailure('El Pokemon no tiene especie');
    }

    final sprites = pokemon.sprites.isEmpty ? null : pokemon.sprites.first;

    final types = pokemon.types
        .where((entry) => entry.type != null)
        .map(
          (entry) => PokemonTypeDto(
            id: entry.type!.id,
            name: entry.type!.name,
            slot: entry.slot,
          ),
        )
        .toList();
    types.sort((a, b) => a.slot.compareTo(b.slot));

    final eggGroups = speciesData.eggGroups
        .map((entry) => entry.egggroup)
        .where((group) => group != null)
        .map((group) => group!.name.trim())
        .where((name) => name.isNotEmpty)
        .toList();
    eggGroups.sort();

    final chainSpecies = speciesData.evolutionChain?.species ??
        <GPokemonDetailData_pokemon_species_evolutionChain_species>[];

    final evolutions = <PokemonEvolutionDto>[];
    final evolutionKeys = <String>{};

    // Cada especie con evolves_from_species_id es una arista de la cadena.
    // Varias aristas con el mismo origen forman las ramas (p. ej. Eevee).
    for (final chain in chainSpecies) {
      final from = chain.evolves_from_species_id;
      if (from == null) {
        continue;
      }

      final detail = chain.evolutions.isEmpty ? null : chain.evolutions.first;
      final trigger = detail?.trigger?.name.trim() ?? '';
      final condition = detail?.condition_expression.trim() ?? '';
      final minLevel = detail?.min_level;
      final evolution = PokemonEvolutionDto(
        fromSpeciesId: from,
        toSpeciesId: chain.id,
        trigger: trigger.isEmpty ? 'unknown' : trigger,
        triggerDetail: condition.isNotEmpty
            ? condition
            : minLevel == null
                ? null
                : 'Nivel $minLevel',
      );

      final key = '${evolution.fromSpeciesId}:'
          '${evolution.toSpeciesId}:${evolution.trigger}';
      if (evolutionKeys.add(key)) {
        evolutions.add(evolution);
      }
    }

    final variants = speciesData.variants
        .map(
          (variant) => PokemonVariantDto(
            id: variant.id,
            name: variant.name,
            isDefault: variant.is_default,
          ),
        )
        .toList();
    variants.sort((a, b) => a.id.compareTo(b.id));

    final moves = <PokemonMoveDto>[];
    final moveKeys = <String>{};
    for (final entry in pokemon.moves) {
      final move = entry.move;
      final method = entry.method?.name.trim();
      final versionGroup = entry.versionGroup?.name.trim();
      if (move == null || method == null || versionGroup == null) {
        continue;
      }

      final dto = PokemonMoveDto(
        id: move.id,
        name: move.name,
        versionGroup: versionGroup,
        learnMethod: method,
        levelLearned: entry.level,
      );
      final key = '${dto.id}:${dto.versionGroup}:'
          '${dto.learnMethod}:${dto.levelLearned}';
      if (moveKeys.add(key)) {
        moves.add(dto);
      }
    }

    final efficacies = <TypeEfficacyDto>[];
    final efficacyKeys = <String>{};
    for (final entry in data.typeEfficacies) {
      final attacking = entry.attackingType;
      final defending = entry.defendingType;
      if (attacking == null || defending == null) {
        continue;
      }

      final dto = TypeEfficacyDto(
        attackingTypeId: attacking.id,
        attackingTypeName: attacking.name,
        defendingTypeId: defending.id,
        defendingTypeName: defending.name,
        damageFactor: entry.damage_factor,
      );
      final key = '${dto.attackingTypeId}:${dto.defendingTypeId}';
      if (efficacyKeys.add(key)) {
        efficacies.add(dto);
      }
    }

    return PokemonDetailDto(
      id: pokemon.id,
      name: pokemon.name,
      isDefault: pokemon.is_default,
      heightDecimeters: pokemon.height ?? 0,
      weightHectograms: pokemon.weight ?? 0,
      artworkUrl: _cleanUrl(sprites?.artwork.value),
      frontUrl: _cleanUrl(sprites?.front.value),
      shinyArtworkUrl: _cleanUrl(sprites?.shinyArtwork.value),
      shinyFrontUrl: _cleanUrl(sprites?.shinyFront.value),
      species: PokemonSpeciesDto(
        id: speciesData.id,
        name: speciesData.name,
        generationId: speciesData.generation_id,
        evolutionChainId: speciesData.evolution_chain_id,
        eggGroups: List.unmodifiable(eggGroups),
        chainSpecies: chainSpecies
            .map(
              (chain) => PokemonChainSpeciesDto(
                id: chain.id,
                name: chain.name,
              ),
            )
            .toList(growable: false),
      ),
      types: List.unmodifiable(types),
      stats: PokemonStatsDto.fromGraphql(pokemon.stats),
      abilities: pokemon.abilities
          .where((entry) => entry.ability != null)
          .map(
            (entry) => PokemonAbilityDto(
              id: entry.ability!.id,
              name: entry.ability!.name,
              effectSummary: _cleanEffect(entry.ability!.effects),
              isHidden: entry.is_hidden,
              slot: entry.slot,
            ),
          )
          .toList(growable: false),
      moves: List.unmodifiable(moves),
      variants: List.unmodifiable(variants),
      evolutions: List.unmodifiable(evolutions),
      typeEfficacies: List.unmodifiable(efficacies),
    );
  }

  String? get preferredImageUrl => artworkUrl ?? frontUrl;

  String? get preferredShinyUrl => shinyArtworkUrl ?? shinyFrontUrl;

  /// Validacion de la respuesta antes de escribir en Drift.
  void validate() {
    if (id <= 0 || name.trim().isEmpty) {
      throw const ValidationFailure('Identidad del Pokemon invalida');
    }
    if (species.id <= 0 || species.name.trim().isEmpty) {
      throw const ValidationFailure('Especie del Pokemon invalida');
    }
    if (heightDecimeters < 0 || weightHectograms < 0) {
      throw const ValidationFailure('Altura o peso invalidos');
    }
    if (types.isEmpty || types.length > 2) {
      throw const ValidationFailure('Los tipos del Pokemon no son validos');
    }

    final typeIds = <int>{};
    final typeSlots = <int>{};
    for (final type in types) {
      if (type.id <= 0 ||
          type.name.trim().isEmpty ||
          !typeIds.add(type.id) ||
          !typeSlots.add(type.slot)) {
        throw const ValidationFailure('Los tipos del Pokemon no son validos');
      }
    }

    final stats = this.stats;
    if (stats == null || !stats.isValid) {
      throw const ValidationFailure('Las estadisticas no estan completas');
    }

    final abilitySlots = <int>{};
    for (final ability in abilities) {
      if (ability.id <= 0 ||
          ability.name.trim().isEmpty ||
          ability.slot <= 0 ||
          !abilitySlots.add(ability.slot)) {
        throw const ValidationFailure('Las habilidades no son validas');
      }
    }

    for (final move in moves) {
      if (move.id <= 0 ||
          move.name.trim().isEmpty ||
          move.versionGroup.isEmpty ||
          move.learnMethod.isEmpty ||
          move.levelLearned < 0) {
        throw const ValidationFailure('Los movimientos no son validos');
      }
    }

    for (final evolution in evolutions) {
      if (evolution.fromSpeciesId <= 0 ||
          evolution.toSpeciesId <= 0 ||
          evolution.trigger.isEmpty) {
        throw const ValidationFailure('Las evoluciones no son validas');
      }
    }

    for (final efficacy in typeEfficacies) {
      if (efficacy.attackingTypeId <= 0 ||
          efficacy.defendingTypeId <= 0 ||
          efficacy.damageFactor < 0) {
        throw const ValidationFailure('La eficacia de tipos no es valida');
      }
    }
  }

  static String? _cleanUrl(String? value) {
    final trimmed = value?.trim();
    if (trimmed == null || trimmed.isEmpty) {
      return null;
    }
    return trimmed;
  }

  static String? _cleanEffect(
    Iterable<GPokemonDetailData_pokemon_abilities_ability_effects> effects,
  ) {
    for (final effect in effects) {
      final short = _cleanUrl(effect.short_effect);
      if (short != null) {
        return short;
      }
      final full = _cleanUrl(effect.effect);
      if (full != null) {
        return full;
      }
    }
    return null;
  }
}

class PokemonSpeciesDto {
  final int id;
  final String name;
  final int? generationId;
  final int? evolutionChainId;
  final List<String> eggGroups;
  final List<PokemonChainSpeciesDto> chainSpecies;

  const PokemonSpeciesDto({
    required this.id,
    required this.name,
    required this.eggGroups,
    required this.chainSpecies,
    this.generationId,
    this.evolutionChainId,
  });
}

class PokemonChainSpeciesDto {
  final int id;
  final String name;

  const PokemonChainSpeciesDto({required this.id, required this.name});
}

class PokemonStatsDto {
  final int hp;
  final int attack;
  final int defense;
  final int specialAttack;
  final int specialDefense;
  final int speed;

  const PokemonStatsDto({
    required this.hp,
    required this.attack,
    required this.defense,
    required this.specialAttack,
    required this.specialDefense,
    required this.speed,
  });

  factory PokemonStatsDto.fromGraphql(
    Iterable<GPokemonDetailData_pokemon_stats> entries,
  ) {
    final values = <String, int>{};
    for (final entry in entries) {
      final name = entry.stat?.name.trim().replaceAll('_', '-');
      if (name != null) {
        values[name] = entry.base_stat;
      }
    }

    return PokemonStatsDto(
      hp: values['hp'] ?? 0,
      attack: values['attack'] ?? 0,
      defense: values['defense'] ?? 0,
      specialAttack: values['special-attack'] ?? 0,
      specialDefense: values['special-defense'] ?? 0,
      speed: values['speed'] ?? 0,
    );
  }

  bool get isValid =>
      hp > 0 &&
      attack >= 0 &&
      defense >= 0 &&
      specialAttack >= 0 &&
      specialDefense >= 0 &&
      speed >= 0;
}

class PokemonAbilityDto {
  final int id;
  final String name;
  final String? effectSummary;
  final bool isHidden;
  final int slot;

  const PokemonAbilityDto({
    required this.id,
    required this.name,
    required this.effectSummary,
    required this.isHidden,
    required this.slot,
  });
}

class PokemonMoveDto {
  final int id;
  final String name;
  final String versionGroup;
  final String learnMethod;
  final int levelLearned;

  const PokemonMoveDto({
    required this.id,
    required this.name,
    required this.versionGroup,
    required this.learnMethod,
    required this.levelLearned,
  });
}

class PokemonVariantDto {
  final int id;
  final String name;
  final bool isDefault;

  const PokemonVariantDto({
    required this.id,
    required this.name,
    required this.isDefault,
  });
}

class PokemonEvolutionDto {
  final int fromSpeciesId;
  final int toSpeciesId;
  final String trigger;
  final String? triggerDetail;

  const PokemonEvolutionDto({
    required this.fromSpeciesId,
    required this.toSpeciesId,
    required this.trigger,
    required this.triggerDetail,
  });
}

class TypeEfficacyDto {
  final int attackingTypeId;
  final String attackingTypeName;
  final int defendingTypeId;
  final String defendingTypeName;
  final int damageFactor;

  const TypeEfficacyDto({
    required this.attackingTypeId,
    required this.attackingTypeName,
    required this.defendingTypeId,
    required this.defendingTypeName,
    required this.damageFactor,
  });
}
