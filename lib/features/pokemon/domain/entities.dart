class PokemonType {
  final int id;
  final String name;

  const PokemonType({required this.id, required this.name});
}

class PokemonBaseStats {
  final int hp;
  final int attack;
  final int defense;
  final int specialAttack;
  final int specialDefense;
  final int speed;

  const PokemonBaseStats({
    required this.hp,
    required this.attack,
    required this.defense,
    required this.specialAttack,
    required this.specialDefense,
    required this.speed,
  });
}

class Pokemon {
  final int id;
  final int number;
  final String name;
  final String? imageUrl;
  final List<PokemonType> types;
  final PokemonBaseStats? baseStats;
  final int? speciesId;
  final String? speciesName;
  final int? generationId;

  const Pokemon({
    required this.id,
    required this.number,
    required this.name,
    required this.types,
    this.imageUrl,
    this.baseStats,
    this.speciesId,
    this.speciesName,
    this.generationId,
  });
}
