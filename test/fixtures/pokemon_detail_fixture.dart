import 'package:pokedex/features/pokemon/data/graphql/__generated__/pokemon_detail.data.gql.dart';
import 'package:pokedex/graphql/__generated__/schema.schema.gql.dart';

/// Respuesta GraphQL de detalle construida con los tipos generados por Ferry.
/// No depende de la red.
GPokemonDetailData buildPokemonDetailData({
  int id = 6,
  String name = 'charizard',
  bool withStats = true,
  bool withTypes = true,
}) {
  final fire = GPokemonDetailData_pokemon_types_type((b) => b
    ..id = 10
    ..name = 'fire');
  final flying = GPokemonDetailData_pokemon_types_type((b) => b
    ..id = 3
    ..name = 'flying');

  final monster = GPokemonDetailData_pokemon_species_eggGroups_egggroup((b) => b
    ..id = 1
    ..name = 'monster');
  final dragon = GPokemonDetailData_pokemon_species_eggGroups_egggroup((b) => b
    ..id = 2
    ..name = 'dragon');

  final mega = GPokemonDetailData_pokemon_species_variants((b) => b
    ..id = 10034
    ..name = 'charizard-mega-x'
    ..is_default = false);

  final levelUp = GPokemonDetailData_pokemon_species_evolutionChain_species_evolutions_trigger(
    (b) => b..name = 'level-up',
  );

  GPokemonDetailData_pokemon_species_evolutionChain_species chainSpecies({
    required int speciesId,
    required String speciesName,
    int? evolvesFrom,
    int? minLevel,
  }) {
    return GPokemonDetailData_pokemon_species_evolutionChain_species((b) {
      b
        ..id = speciesId
        ..name = speciesName;
      if (evolvesFrom != null) {
        b.evolves_from_species_id = evolvesFrom;
        b.evolutions.add(
          GPokemonDetailData_pokemon_species_evolutionChain_species_evolutions(
            (e) => e
              ..min_level = minLevel
              ..condition_expression = ''
              ..trigger.replace(levelUp),
          ),
        );
      }
    });
  }

  final chain = GPokemonDetailData_pokemon_species_evolutionChain((b) => b
    ..species.addAll([
      chainSpecies(speciesId: 4, speciesName: 'charmander'),
      chainSpecies(
        speciesId: 5,
        speciesName: 'charmeleon',
        evolvesFrom: 4,
        minLevel: 16,
      ),
      chainSpecies(
        speciesId: 6,
        speciesName: 'charizard',
        evolvesFrom: 5,
        minLevel: 36,
      ),
    ]));

  final species = GPokemonDetailData_pokemon_species((b) => b
    ..id = 6
    ..name = 'charizard'
    ..generation_id = 1
    ..evolution_chain_id = 2
    ..eggGroups.addAll([
      GPokemonDetailData_pokemon_species_eggGroups(
        (e) => e..egggroup.replace(monster),
      ),
      GPokemonDetailData_pokemon_species_eggGroups(
        (e) => e..egggroup.replace(dragon),
      ),
    ])
    ..variants.add(mega)
    ..evolutionChain.replace(chain));

  final sprites = GPokemonDetailData_pokemon_sprites((b) => b
    ..artwork.replace(Gjsonb('https://img/artwork.png'))
    ..front.replace(Gjsonb('https://img/front.png'))
    ..shinyArtwork.replace(Gjsonb('https://img/shiny.png'))
    ..shinyFront.replace(Gjsonb('')));

  final blazeEffect = GPokemonDetailData_pokemon_abilities_ability_effects(
    (b) => b
      ..effect = 'Powers up fire-type moves.'
      ..short_effect = 'Boosts fire moves.',
  );
  final blaze = GPokemonDetailData_pokemon_abilities_ability((b) => b
    ..id = 66
    ..name = 'blaze'
    ..effects.add(blazeEffect));
  final solarPower = GPokemonDetailData_pokemon_abilities_ability((b) => b
    ..id = 94
    ..name = 'solar-power');

  final flamethrower = GPokemonDetailData_pokemon_moves_move((b) => b
    ..id = 53
    ..name = 'flamethrower');
  final levelMethod = GPokemonDetailData_pokemon_moves_method(
    (b) => b..name = 'level-up',
  );
  final scarlet = GPokemonDetailData_pokemon_moves_versionGroup(
    (b) => b..name = 'scarlet-violet',
  );

  final stats = <GPokemonDetailData_pokemon_stats>[];
  if (withStats) {
    final values = {
      'hp': 78,
      'attack': 84,
      'defense': 78,
      'special-attack': 109,
      'special-defense': 85,
      'speed': 100,
    };
    var statId = 1;
    for (final entry in values.entries) {
      final stat = GPokemonDetailData_pokemon_stats_stat((b) => b
        ..id = statId++
        ..name = entry.key);
      stats.add(
        GPokemonDetailData_pokemon_stats((s) => s
          ..base_stat = entry.value
          ..stat.replace(stat)),
      );
    }
  }

  final pokemon = GPokemonDetailData_pokemon((b) {
    b
      ..id = id
      ..name = name
      ..is_default = true
      ..height = 17
      ..weight = 905
      ..pokemon_species_id = 6
      ..species.replace(species)
      ..sprites.add(sprites)
      ..stats.addAll(stats)
      ..abilities.addAll([
        GPokemonDetailData_pokemon_abilities((a) => a
          ..slot = 1
          ..is_hidden = false
          ..ability.replace(blaze)),
        GPokemonDetailData_pokemon_abilities((a) => a
          ..slot = 2
          ..is_hidden = true
          ..ability.replace(solarPower)),
      ])
      ..moves.add(
        GPokemonDetailData_pokemon_moves((m) => m
          ..level = 16
          ..move.replace(flamethrower)
          ..method.replace(levelMethod)
          ..versionGroup.replace(scarlet)),
      );
    if (withTypes) {
      b.types.addAll([
        GPokemonDetailData_pokemon_types((t) => t
          ..slot = 1
          ..type.replace(fire)),
        GPokemonDetailData_pokemon_types((t) => t
          ..slot = 2
          ..type.replace(flying)),
      ]);
    }
  });

  final grass = GPokemonDetailData_typeEfficacies_attackingType((b) => b
    ..id = 12
    ..name = 'grass');
  final defendingFire = GPokemonDetailData_typeEfficacies_defendingType((b) => b
    ..id = 10
    ..name = 'fire');

  return GPokemonDetailData((b) => b
    ..pokemon.add(pokemon)
    ..typeEfficacies.add(
      GPokemonDetailData_typeEfficacies((e) => e
        ..damage_factor = 50
        ..attackingType.replace(grass)
        ..defendingType.replace(defendingFire)),
    ));
}
