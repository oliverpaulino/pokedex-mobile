import 'entities.dart';

/// Entidad de detalle que consumen los widgets. No contiene DTOs ni Ferry.
class PokemonDetail {
  final int id;
  final int number;
  final String name;
  final bool isDefault;
  final String? imageUrl;
  final String? spriteUrl;
  final String? shinyArtworkUrl;
  final String? shinySpriteUrl;
  final int heightDecimeters;
  final int weightHectograms;
  final PokemonSpeciesInfo species;
  final List<PokemonType> types;
  final PokemonDetailStats? stats;
  final List<PokemonAbility> abilities;
  final List<PokemonMove> moves;
  final List<PokemonVariant> variants;
  final List<PokemonEvolution> evolutions;
  final List<TypeEfficacy> typeEfficacies;

  const PokemonDetail({
    required this.id,
    required this.number,
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
    this.imageUrl,
    this.spriteUrl,
    this.shinyArtworkUrl,
    this.shinySpriteUrl,
  });
}

class PokemonSpeciesInfo {
  final int id;
  final String name;
  final int? generationId;
  final int? evolutionChainId;
  final List<String> eggGroups;

  const PokemonSpeciesInfo({
    required this.id,
    required this.name,
    required this.eggGroups,
    this.generationId,
    this.evolutionChainId,
  });
}

class PokemonDetailStats {
  final int hp;
  final int attack;
  final int defense;
  final int specialAttack;
  final int specialDefense;
  final int speed;

  const PokemonDetailStats({
    required this.hp,
    required this.attack,
    required this.defense,
    required this.specialAttack,
    required this.specialDefense,
    required this.speed,
  });
}

class PokemonAbility {
  final int id;
  final String name;
  final String? effectSummary;
  final bool isHidden;
  final int slot;

  const PokemonAbility({
    required this.id,
    required this.name,
    required this.effectSummary,
    required this.isHidden,
    required this.slot,
  });
}

class PokemonMove {
  final int id;
  final String name;
  final String versionGroup;
  final String learnMethod;
  final int levelLearned;

  const PokemonMove({
    required this.id,
    required this.name,
    required this.versionGroup,
    required this.learnMethod,
    required this.levelLearned,
  });
}

class PokemonVariant {
  final int id;
  final String name;
  final bool isDefault;

  const PokemonVariant({
    required this.id,
    required this.name,
    required this.isDefault,
  });
}

class PokemonEvolution {
  final int fromSpeciesId;
  final int toSpeciesId;
  final String trigger;
  final String? triggerDetail;
  final String? fromSpeciesName;
  final String? toSpeciesName;

  const PokemonEvolution({
    required this.fromSpeciesId,
    required this.toSpeciesId,
    required this.trigger,
    required this.triggerDetail,
    this.fromSpeciesName,
    this.toSpeciesName,
  });
}

class TypeEfficacy {
  final int attackingTypeId;
  final String attackingTypeName;
  final int defendingTypeId;
  final String defendingTypeName;
  final int damageFactor;

  const TypeEfficacy({
    required this.attackingTypeId,
    required this.attackingTypeName,
    required this.defendingTypeId,
    required this.defendingTypeName,
    required this.damageFactor,
  });
}
