import 'package:flutter_test/flutter_test.dart';
import 'package:pokedex/features/pokemon/data/dto/pokemon_detail_dto.dart';
import 'package:pokedex/features/pokemon/data/mappers/pokemon_detail_mapper.dart';
import 'package:pokedex/features/pokemon/domain/failures.dart';

import 'fixtures/pokemon_detail_fixture.dart';

void main() {
  const mapper = PokemonDetailMapper();

  test('el DTO normaliza identidad, sprites, stats, efecto y evoluciones', () {
    final dto = PokemonDetailDto.fromGraphql(buildPokemonDetailData());
    dto.validate();

    expect(dto.id, 6);
    expect(dto.name, 'charizard');
    expect(dto.heightDecimeters, 17);
    expect(dto.weightHectograms, 905);
    expect(dto.preferredImageUrl, 'https://img/artwork.png');
    expect(dto.preferredShinyUrl, 'https://img/shiny.png');
    expect(dto.types.map((type) => type.name), ['fire', 'flying']);
    expect(dto.stats!.hp, 78);
    expect(dto.stats!.specialAttack, 109);
    expect(dto.abilities.first.effectSummary, 'Boosts fire moves.');
    expect(dto.abilities.last.isHidden, isTrue);
    expect(dto.moves.single.versionGroup, 'scarlet-violet');
    expect(dto.species.eggGroups, ['dragon', 'monster']);
    expect(dto.variants.map((variant) => variant.id), contains(10034));
    expect(dto.evolutions, hasLength(2));
    expect(dto.evolutions.first.fromSpeciesId, 4);
    expect(dto.evolutions.first.toSpeciesId, 5);
    expect(dto.evolutions.first.trigger, 'level-up');
    expect(dto.evolutions.first.triggerDetail, 'Nivel 16');
    expect(dto.typeEfficacies.single.damageFactor, 50);
  });

  test('la validacion rechaza estadisticas incompletas', () {
    final dto = PokemonDetailDto.fromGraphql(
      buildPokemonDetailData(withStats: false),
    );

    expect(dto.validate, throwsA(isA<ValidationFailure>()));
  });

  test('la validacion rechaza un detalle sin tipos', () {
    final dto = PokemonDetailDto.fromGraphql(
      buildPokemonDetailData(withTypes: false),
    );

    expect(dto.validate, throwsA(isA<ValidationFailure>()));
  });

  test('el mapper produce entidad de dominio y companions de Drift', () {
    final dto = PokemonDetailDto.fromGraphql(buildPokemonDetailData());

    final entity = mapper.toEntity(dto);
    expect(entity.types, hasLength(2));
    expect(entity.stats!.speed, 100);
    expect(entity.abilities, hasLength(2));
    expect(entity.evolutions, hasLength(2));
    expect(entity.typeEfficacies.single.damageFactor, 50);

    expect(mapper.toPokemonTable(dto).id.value, 6);
    expect(mapper.toPokemonTable(dto).speciesId.value, 6);
    expect(mapper.toStatsTable(dto)!.hp.value, 78);
    expect(mapper.toSpeciesTables(dto), hasLength(3));
    expect(mapper.toVariantTables(dto), hasLength(1));
    expect(mapper.toPokemonTypeTables(dto), hasLength(2));
    expect(mapper.toPokemonAbilityTables(dto), hasLength(2));
    expect(mapper.toPokemonMoveTables(dto), hasLength(1));
    expect(mapper.toEvolutionTables(dto), hasLength(2));
    expect(mapper.toEfficacyTypeTables(dto).length, greaterThanOrEqualTo(2));
    expect(mapper.toTypeEfficacyTables(dto), hasLength(1));
  });
}
