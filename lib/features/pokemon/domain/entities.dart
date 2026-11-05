class PokemonType {
  final int id;
  final String name;

  const PokemonType({required this.id, required this.name});
}

class Pokemon {
  final int id;
  final int number;
  final String name;
  final String? imageUrl;
  final List<PokemonType> types;

  const Pokemon({
    required this.id,
    required this.number,
    required this.name,
    required this.types,
    this.imageUrl,
  });
}
