import 'package:flutter_test/flutter_test.dart';
import 'package:pokedex/features/pokemon/data/dto/pokemon_catalog_dto.dart';
import 'package:pokedex/features/pokemon/data/mappers/pokemon_mapper.dart';

import 'fixtures/pokemon_catalog_fixture.dart';

void main() {
  const mapper = PokemonMapper();

  group('PokemonCatalogDto', () {
    test('normaliza la respuesta GraphQL y ordena los tipos por slot', () {
      final dto = PokemonCatalogDto.fromGraphql(
        buildPokemonCatalogData(),
      );

      expect(dto.totalCount, 1025);
      expect(dto.pokemons, hasLength(1));

      final pokemon = dto.pokemons.single;
      expect(pokemon.id, 6);
      expect(pokemon.name, 'charizard');
      expect(pokemon.types.map((type) => type.name), ['fire', 'flying']);
      expect(pokemon.preferredImageUrl, 'https://img/artwork.png');
    });

    test('usa el sprite frontal cuando no hay artwork', () {
      final dto = PokemonCatalogDto.fromGraphql(
        buildPokemonCatalogData(artwork: ''),
      );

      expect(dto.pokemons.single.preferredImageUrl, 'https://img/front.png');
    });

    test('ignora URLs vacias', () {
      final dto = PokemonCatalogDto.fromGraphql(
        buildPokemonCatalogData(artwork: '   ', front: ''),
      );

      expect(dto.pokemons.single.preferredImageUrl, isNull);
    });
  });

  group('PokemonMapper', () {
    test('convierte el DTO a entidad de dominio', () {
      final dto = PokemonCatalogDto.fromGraphql(
        buildPokemonCatalogData(),
      );

      final pokemon = mapper.toEntity(dto.pokemons.single);

      expect(pokemon.id, 6);
      expect(pokemon.number, 6);
      expect(pokemon.name, 'charizard');
      expect(pokemon.imageUrl, 'https://img/artwork.png');
      expect(pokemon.types.map((type) => type.id), [10, 3]);
      expect(pokemon.types.map((type) => type.name), ['fire', 'flying']);
    });

    test('convierte el DTO a filas de Drift', () {
      final dto = PokemonCatalogDto.fromGraphql(
        buildPokemonCatalogData(),
      );
      final pokemonDto = dto.pokemons.single;

      final pokemonRow = mapper.toPokemonTable(pokemonDto);
      final typeRows = mapper.toTypeTables(pokemonDto);
      final relationRows = mapper.toPokemonTypeTables(pokemonDto);

      expect(pokemonRow.id.value, 6);
      expect(pokemonRow.nationalDexNumber.value, 6);
      expect(pokemonRow.name.value, 'charizard');
      expect(pokemonRow.imageUrl.value, 'https://img/artwork.png');

      expect(typeRows.map((row) => row.id.value), [10, 3]);
      expect(typeRows.map((row) => row.name.value), ['fire', 'flying']);

      expect(relationRows.map((row) => row.pokemonId.value), [6, 6]);
      expect(relationRows.map((row) => row.typeId.value), [10, 3]);
      expect(relationRows.map((row) => row.slot.value), [1, 2]);
    });
  });
}
