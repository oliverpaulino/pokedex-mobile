import '../graphql/__generated__/pokemon_catalog.data.gql.dart';

class PokemonCatalogDto {
  final List<PokemonDto> pokemons;
  final int totalCount;

  const PokemonCatalogDto({
    required this.pokemons,
    required this.totalCount,
  });

  factory PokemonCatalogDto.fromGraphql(GPokemonCatalogData data) {
    return PokemonCatalogDto(
      pokemons: data.pokemon
          .map(PokemonDto.fromGraphql)
          .toList(growable: false),
      totalCount:
          data.pokemon_aggregate.aggregate?.count ?? data.pokemon.length,
    );
  }
}

class PokemonDto {
  final int id;
  final String name;
  final List<PokemonTypeDto> types;
  final String? artworkUrl;
  final String? frontUrl;

  const PokemonDto({
    required this.id,
    required this.name,
    required this.types,
    this.artworkUrl,
    this.frontUrl,
  });

  factory PokemonDto.fromGraphql(GPokemonCatalogData_pokemon data) {
    final types = data.pokemontypes
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

    final sprites =
        data.pokemonsprites.isEmpty ? null : data.pokemonsprites.first;

    return PokemonDto(
      id: data.id,
      name: data.name,
      types: List.unmodifiable(types),
      artworkUrl: _cleanUrl(sprites?.artwork.value),
      frontUrl: _cleanUrl(sprites?.front.value),
    );
  }

  String? get preferredImageUrl => artworkUrl ?? frontUrl;

  static String? _cleanUrl(String? value) {
    final trimmed = value?.trim();
    if (trimmed == null || trimmed.isEmpty) {
      return null;
    }

    return trimmed;
  }
}

class PokemonTypeDto {
  final int id;
  final String name;
  final int slot;

  const PokemonTypeDto({
    required this.id,
    required this.name,
    required this.slot,
  });
}
