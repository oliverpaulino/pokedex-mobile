import 'package:pokedex/features/pokemon/data/graphql/__generated__/pokemon_catalog.data.gql.dart';
import 'package:pokedex/graphql/__generated__/schema.schema.gql.dart';

/// Construye una respuesta GraphQL de catalogo con un solo Pokemon. Se usa en las pruebas para no depender de la red ni del codegen de Ferry.
GPokemonCatalogData buildPokemonCatalogData({
  String artwork = 'https://img/artwork.png',
  String front = 'https://img/front.png',
  int totalCount = 1025,
}) {
  final fire = GPokemonCatalogData_pokemon_pokemontypes_type(
    (b) => b
      ..id = 10
      ..name = 'fire',
  );
  final flying = GPokemonCatalogData_pokemon_pokemontypes_type(
    (b) => b
      ..id = 3
      ..name = 'flying',
  );

  final pokemon = GPokemonCatalogData_pokemon(
    (b) => b
      ..id = 6
      ..name = 'charizard'
      ..pokemontypes.add(
        GPokemonCatalogData_pokemon_pokemontypes(
          (t) => t
            ..slot = 2
            ..type.replace(flying),
        ),
      )
      ..pokemontypes.add(
        GPokemonCatalogData_pokemon_pokemontypes(
          (t) => t
            ..slot = 1
            ..type.replace(fire),
        ),
      )
      ..pokemonsprites.add(
        GPokemonCatalogData_pokemon_pokemonsprites(
          (s) => s
            ..artwork.replace(Gjsonb(artwork))
            ..front.replace(Gjsonb(front)),
        ),
      ),
  );

  return GPokemonCatalogData(
    (b) => b
      ..pokemon.add(pokemon)
      ..pokemon_aggregate.aggregate.count = totalCount,
  );
}
