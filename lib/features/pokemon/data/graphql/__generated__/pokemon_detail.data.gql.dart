// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:pokedex/graphql/__generated__/schema.schema.gql.dart' as _i2;
import 'package:pokedex/graphql/__generated__/serializers.gql.dart' as _i1;

part 'pokemon_detail.data.gql.g.dart';

abstract class GPokemonDetailData
    implements Built<GPokemonDetailData, GPokemonDetailDataBuilder> {
  GPokemonDetailData._();

  factory GPokemonDetailData(
          [void Function(GPokemonDetailDataBuilder b) updates]) =
      _$GPokemonDetailData;

  static void _initializeBuilder(GPokemonDetailDataBuilder b) =>
      b..G__typename = 'query_root';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  BuiltList<GPokemonDetailData_pokemon> get pokemon;
  BuiltList<GPokemonDetailData_typeEfficacies> get typeEfficacies;
  static Serializer<GPokemonDetailData> get serializer =>
      _$gPokemonDetailDataSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GPokemonDetailData.serializer,
        this,
      ) as Map<String, dynamic>);

  static GPokemonDetailData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GPokemonDetailData.serializer,
        json,
      );
}

abstract class GPokemonDetailData_pokemon
    implements
        Built<GPokemonDetailData_pokemon, GPokemonDetailData_pokemonBuilder> {
  GPokemonDetailData_pokemon._();

  factory GPokemonDetailData_pokemon(
          [void Function(GPokemonDetailData_pokemonBuilder b) updates]) =
      _$GPokemonDetailData_pokemon;

  static void _initializeBuilder(GPokemonDetailData_pokemonBuilder b) =>
      b..G__typename = 'pokemon';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  int get id;
  String get name;
  bool get is_default;
  int? get height;
  int? get weight;
  int? get pokemon_species_id;
  GPokemonDetailData_pokemon_species? get species;
  BuiltList<GPokemonDetailData_pokemon_types> get types;
  BuiltList<GPokemonDetailData_pokemon_sprites> get sprites;
  BuiltList<GPokemonDetailData_pokemon_stats> get stats;
  BuiltList<GPokemonDetailData_pokemon_abilities> get abilities;
  BuiltList<GPokemonDetailData_pokemon_moves> get moves;
  static Serializer<GPokemonDetailData_pokemon> get serializer =>
      _$gPokemonDetailDataPokemonSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GPokemonDetailData_pokemon.serializer,
        this,
      ) as Map<String, dynamic>);

  static GPokemonDetailData_pokemon? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GPokemonDetailData_pokemon.serializer,
        json,
      );
}

abstract class GPokemonDetailData_pokemon_species
    implements
        Built<GPokemonDetailData_pokemon_species,
            GPokemonDetailData_pokemon_speciesBuilder> {
  GPokemonDetailData_pokemon_species._();

  factory GPokemonDetailData_pokemon_species(
      [void Function(GPokemonDetailData_pokemon_speciesBuilder b)
          updates]) = _$GPokemonDetailData_pokemon_species;

  static void _initializeBuilder(GPokemonDetailData_pokemon_speciesBuilder b) =>
      b..G__typename = 'pokemonspecies';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  int get id;
  String get name;
  int? get generation_id;
  int? get evolution_chain_id;
  int? get evolves_from_species_id;
  BuiltList<GPokemonDetailData_pokemon_species_eggGroups> get eggGroups;
  BuiltList<GPokemonDetailData_pokemon_species_variants> get variants;
  GPokemonDetailData_pokemon_species_evolutionChain? get evolutionChain;
  static Serializer<GPokemonDetailData_pokemon_species> get serializer =>
      _$gPokemonDetailDataPokemonSpeciesSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GPokemonDetailData_pokemon_species.serializer,
        this,
      ) as Map<String, dynamic>);

  static GPokemonDetailData_pokemon_species? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GPokemonDetailData_pokemon_species.serializer,
        json,
      );
}

abstract class GPokemonDetailData_pokemon_species_eggGroups
    implements
        Built<GPokemonDetailData_pokemon_species_eggGroups,
            GPokemonDetailData_pokemon_species_eggGroupsBuilder> {
  GPokemonDetailData_pokemon_species_eggGroups._();

  factory GPokemonDetailData_pokemon_species_eggGroups(
      [void Function(GPokemonDetailData_pokemon_species_eggGroupsBuilder b)
          updates]) = _$GPokemonDetailData_pokemon_species_eggGroups;

  static void _initializeBuilder(
          GPokemonDetailData_pokemon_species_eggGroupsBuilder b) =>
      b..G__typename = 'pokemonegggroup';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  GPokemonDetailData_pokemon_species_eggGroups_egggroup? get egggroup;
  static Serializer<GPokemonDetailData_pokemon_species_eggGroups>
      get serializer => _$gPokemonDetailDataPokemonSpeciesEggGroupsSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GPokemonDetailData_pokemon_species_eggGroups.serializer,
        this,
      ) as Map<String, dynamic>);

  static GPokemonDetailData_pokemon_species_eggGroups? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GPokemonDetailData_pokemon_species_eggGroups.serializer,
        json,
      );
}

abstract class GPokemonDetailData_pokemon_species_eggGroups_egggroup
    implements
        Built<GPokemonDetailData_pokemon_species_eggGroups_egggroup,
            GPokemonDetailData_pokemon_species_eggGroups_egggroupBuilder> {
  GPokemonDetailData_pokemon_species_eggGroups_egggroup._();

  factory GPokemonDetailData_pokemon_species_eggGroups_egggroup(
      [void Function(
              GPokemonDetailData_pokemon_species_eggGroups_egggroupBuilder b)
          updates]) = _$GPokemonDetailData_pokemon_species_eggGroups_egggroup;

  static void _initializeBuilder(
          GPokemonDetailData_pokemon_species_eggGroups_egggroupBuilder b) =>
      b..G__typename = 'egggroup';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  int get id;
  String get name;
  static Serializer<GPokemonDetailData_pokemon_species_eggGroups_egggroup>
      get serializer =>
          _$gPokemonDetailDataPokemonSpeciesEggGroupsEgggroupSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GPokemonDetailData_pokemon_species_eggGroups_egggroup.serializer,
        this,
      ) as Map<String, dynamic>);

  static GPokemonDetailData_pokemon_species_eggGroups_egggroup? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GPokemonDetailData_pokemon_species_eggGroups_egggroup.serializer,
        json,
      );
}

abstract class GPokemonDetailData_pokemon_species_variants
    implements
        Built<GPokemonDetailData_pokemon_species_variants,
            GPokemonDetailData_pokemon_species_variantsBuilder> {
  GPokemonDetailData_pokemon_species_variants._();

  factory GPokemonDetailData_pokemon_species_variants(
      [void Function(GPokemonDetailData_pokemon_species_variantsBuilder b)
          updates]) = _$GPokemonDetailData_pokemon_species_variants;

  static void _initializeBuilder(
          GPokemonDetailData_pokemon_species_variantsBuilder b) =>
      b..G__typename = 'pokemon';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  int get id;
  String get name;
  bool get is_default;
  static Serializer<GPokemonDetailData_pokemon_species_variants>
      get serializer => _$gPokemonDetailDataPokemonSpeciesVariantsSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GPokemonDetailData_pokemon_species_variants.serializer,
        this,
      ) as Map<String, dynamic>);

  static GPokemonDetailData_pokemon_species_variants? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GPokemonDetailData_pokemon_species_variants.serializer,
        json,
      );
}

abstract class GPokemonDetailData_pokemon_species_evolutionChain
    implements
        Built<GPokemonDetailData_pokemon_species_evolutionChain,
            GPokemonDetailData_pokemon_species_evolutionChainBuilder> {
  GPokemonDetailData_pokemon_species_evolutionChain._();

  factory GPokemonDetailData_pokemon_species_evolutionChain(
      [void Function(GPokemonDetailData_pokemon_species_evolutionChainBuilder b)
          updates]) = _$GPokemonDetailData_pokemon_species_evolutionChain;

  static void _initializeBuilder(
          GPokemonDetailData_pokemon_species_evolutionChainBuilder b) =>
      b..G__typename = 'evolutionchain';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  BuiltList<GPokemonDetailData_pokemon_species_evolutionChain_species>
      get species;
  static Serializer<GPokemonDetailData_pokemon_species_evolutionChain>
      get serializer =>
          _$gPokemonDetailDataPokemonSpeciesEvolutionChainSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GPokemonDetailData_pokemon_species_evolutionChain.serializer,
        this,
      ) as Map<String, dynamic>);

  static GPokemonDetailData_pokemon_species_evolutionChain? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GPokemonDetailData_pokemon_species_evolutionChain.serializer,
        json,
      );
}

abstract class GPokemonDetailData_pokemon_species_evolutionChain_species
    implements
        Built<GPokemonDetailData_pokemon_species_evolutionChain_species,
            GPokemonDetailData_pokemon_species_evolutionChain_speciesBuilder> {
  GPokemonDetailData_pokemon_species_evolutionChain_species._();

  factory GPokemonDetailData_pokemon_species_evolutionChain_species(
      [void Function(
              GPokemonDetailData_pokemon_species_evolutionChain_speciesBuilder
                  b)
          updates]) = _$GPokemonDetailData_pokemon_species_evolutionChain_species;

  static void _initializeBuilder(
          GPokemonDetailData_pokemon_species_evolutionChain_speciesBuilder b) =>
      b..G__typename = 'pokemonspecies';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  int get id;
  String get name;
  int? get evolves_from_species_id;
  BuiltList<
          GPokemonDetailData_pokemon_species_evolutionChain_species_evolutions>
      get evolutions;
  static Serializer<GPokemonDetailData_pokemon_species_evolutionChain_species>
      get serializer =>
          _$gPokemonDetailDataPokemonSpeciesEvolutionChainSpeciesSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GPokemonDetailData_pokemon_species_evolutionChain_species.serializer,
        this,
      ) as Map<String, dynamic>);

  static GPokemonDetailData_pokemon_species_evolutionChain_species? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GPokemonDetailData_pokemon_species_evolutionChain_species.serializer,
        json,
      );
}

abstract class GPokemonDetailData_pokemon_species_evolutionChain_species_evolutions
    implements
        Built<
            GPokemonDetailData_pokemon_species_evolutionChain_species_evolutions,
            GPokemonDetailData_pokemon_species_evolutionChain_species_evolutionsBuilder> {
  GPokemonDetailData_pokemon_species_evolutionChain_species_evolutions._();

  factory GPokemonDetailData_pokemon_species_evolutionChain_species_evolutions(
          [void Function(
                  GPokemonDetailData_pokemon_species_evolutionChain_species_evolutionsBuilder
                      b)
              updates]) =
      _$GPokemonDetailData_pokemon_species_evolutionChain_species_evolutions;

  static void _initializeBuilder(
          GPokemonDetailData_pokemon_species_evolutionChain_species_evolutionsBuilder
              b) =>
      b..G__typename = 'pokemonevolution';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  int? get min_level;
  String get condition_expression;
  GPokemonDetailData_pokemon_species_evolutionChain_species_evolutions_trigger?
      get trigger;
  static Serializer<
          GPokemonDetailData_pokemon_species_evolutionChain_species_evolutions>
      get serializer =>
          _$gPokemonDetailDataPokemonSpeciesEvolutionChainSpeciesEvolutionsSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GPokemonDetailData_pokemon_species_evolutionChain_species_evolutions
            .serializer,
        this,
      ) as Map<String, dynamic>);

  static GPokemonDetailData_pokemon_species_evolutionChain_species_evolutions?
      fromJson(Map<String, dynamic> json) => _i1.serializers.deserializeWith(
            GPokemonDetailData_pokemon_species_evolutionChain_species_evolutions
                .serializer,
            json,
          );
}

abstract class GPokemonDetailData_pokemon_species_evolutionChain_species_evolutions_trigger
    implements
        Built<
            GPokemonDetailData_pokemon_species_evolutionChain_species_evolutions_trigger,
            GPokemonDetailData_pokemon_species_evolutionChain_species_evolutions_triggerBuilder> {
  GPokemonDetailData_pokemon_species_evolutionChain_species_evolutions_trigger._();

  factory GPokemonDetailData_pokemon_species_evolutionChain_species_evolutions_trigger(
          [void Function(
                  GPokemonDetailData_pokemon_species_evolutionChain_species_evolutions_triggerBuilder
                      b)
              updates]) =
      _$GPokemonDetailData_pokemon_species_evolutionChain_species_evolutions_trigger;

  static void _initializeBuilder(
          GPokemonDetailData_pokemon_species_evolutionChain_species_evolutions_triggerBuilder
              b) =>
      b..G__typename = 'evolutiontrigger';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String get name;
  static Serializer<
          GPokemonDetailData_pokemon_species_evolutionChain_species_evolutions_trigger>
      get serializer =>
          _$gPokemonDetailDataPokemonSpeciesEvolutionChainSpeciesEvolutionsTriggerSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GPokemonDetailData_pokemon_species_evolutionChain_species_evolutions_trigger
            .serializer,
        this,
      ) as Map<String, dynamic>);

  static GPokemonDetailData_pokemon_species_evolutionChain_species_evolutions_trigger?
      fromJson(Map<String, dynamic> json) => _i1.serializers.deserializeWith(
            GPokemonDetailData_pokemon_species_evolutionChain_species_evolutions_trigger
                .serializer,
            json,
          );
}

abstract class GPokemonDetailData_pokemon_types
    implements
        Built<GPokemonDetailData_pokemon_types,
            GPokemonDetailData_pokemon_typesBuilder> {
  GPokemonDetailData_pokemon_types._();

  factory GPokemonDetailData_pokemon_types(
          [void Function(GPokemonDetailData_pokemon_typesBuilder b) updates]) =
      _$GPokemonDetailData_pokemon_types;

  static void _initializeBuilder(GPokemonDetailData_pokemon_typesBuilder b) =>
      b..G__typename = 'pokemontype';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  int get slot;
  GPokemonDetailData_pokemon_types_type? get type;
  static Serializer<GPokemonDetailData_pokemon_types> get serializer =>
      _$gPokemonDetailDataPokemonTypesSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GPokemonDetailData_pokemon_types.serializer,
        this,
      ) as Map<String, dynamic>);

  static GPokemonDetailData_pokemon_types? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GPokemonDetailData_pokemon_types.serializer,
        json,
      );
}

abstract class GPokemonDetailData_pokemon_types_type
    implements
        Built<GPokemonDetailData_pokemon_types_type,
            GPokemonDetailData_pokemon_types_typeBuilder> {
  GPokemonDetailData_pokemon_types_type._();

  factory GPokemonDetailData_pokemon_types_type(
      [void Function(GPokemonDetailData_pokemon_types_typeBuilder b)
          updates]) = _$GPokemonDetailData_pokemon_types_type;

  static void _initializeBuilder(
          GPokemonDetailData_pokemon_types_typeBuilder b) =>
      b..G__typename = 'type';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  int get id;
  String get name;
  static Serializer<GPokemonDetailData_pokemon_types_type> get serializer =>
      _$gPokemonDetailDataPokemonTypesTypeSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GPokemonDetailData_pokemon_types_type.serializer,
        this,
      ) as Map<String, dynamic>);

  static GPokemonDetailData_pokemon_types_type? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GPokemonDetailData_pokemon_types_type.serializer,
        json,
      );
}

abstract class GPokemonDetailData_pokemon_sprites
    implements
        Built<GPokemonDetailData_pokemon_sprites,
            GPokemonDetailData_pokemon_spritesBuilder> {
  GPokemonDetailData_pokemon_sprites._();

  factory GPokemonDetailData_pokemon_sprites(
      [void Function(GPokemonDetailData_pokemon_spritesBuilder b)
          updates]) = _$GPokemonDetailData_pokemon_sprites;

  static void _initializeBuilder(GPokemonDetailData_pokemon_spritesBuilder b) =>
      b..G__typename = 'pokemonsprites';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  _i2.Gjsonb get artwork;
  _i2.Gjsonb get front;
  _i2.Gjsonb get shinyArtwork;
  _i2.Gjsonb get shinyFront;
  static Serializer<GPokemonDetailData_pokemon_sprites> get serializer =>
      _$gPokemonDetailDataPokemonSpritesSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GPokemonDetailData_pokemon_sprites.serializer,
        this,
      ) as Map<String, dynamic>);

  static GPokemonDetailData_pokemon_sprites? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GPokemonDetailData_pokemon_sprites.serializer,
        json,
      );
}

abstract class GPokemonDetailData_pokemon_stats
    implements
        Built<GPokemonDetailData_pokemon_stats,
            GPokemonDetailData_pokemon_statsBuilder> {
  GPokemonDetailData_pokemon_stats._();

  factory GPokemonDetailData_pokemon_stats(
          [void Function(GPokemonDetailData_pokemon_statsBuilder b) updates]) =
      _$GPokemonDetailData_pokemon_stats;

  static void _initializeBuilder(GPokemonDetailData_pokemon_statsBuilder b) =>
      b..G__typename = 'pokemonstat';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  int get base_stat;
  GPokemonDetailData_pokemon_stats_stat? get stat;
  static Serializer<GPokemonDetailData_pokemon_stats> get serializer =>
      _$gPokemonDetailDataPokemonStatsSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GPokemonDetailData_pokemon_stats.serializer,
        this,
      ) as Map<String, dynamic>);

  static GPokemonDetailData_pokemon_stats? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GPokemonDetailData_pokemon_stats.serializer,
        json,
      );
}

abstract class GPokemonDetailData_pokemon_stats_stat
    implements
        Built<GPokemonDetailData_pokemon_stats_stat,
            GPokemonDetailData_pokemon_stats_statBuilder> {
  GPokemonDetailData_pokemon_stats_stat._();

  factory GPokemonDetailData_pokemon_stats_stat(
      [void Function(GPokemonDetailData_pokemon_stats_statBuilder b)
          updates]) = _$GPokemonDetailData_pokemon_stats_stat;

  static void _initializeBuilder(
          GPokemonDetailData_pokemon_stats_statBuilder b) =>
      b..G__typename = 'stat';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  int get id;
  String get name;
  static Serializer<GPokemonDetailData_pokemon_stats_stat> get serializer =>
      _$gPokemonDetailDataPokemonStatsStatSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GPokemonDetailData_pokemon_stats_stat.serializer,
        this,
      ) as Map<String, dynamic>);

  static GPokemonDetailData_pokemon_stats_stat? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GPokemonDetailData_pokemon_stats_stat.serializer,
        json,
      );
}

abstract class GPokemonDetailData_pokemon_abilities
    implements
        Built<GPokemonDetailData_pokemon_abilities,
            GPokemonDetailData_pokemon_abilitiesBuilder> {
  GPokemonDetailData_pokemon_abilities._();

  factory GPokemonDetailData_pokemon_abilities(
      [void Function(GPokemonDetailData_pokemon_abilitiesBuilder b)
          updates]) = _$GPokemonDetailData_pokemon_abilities;

  static void _initializeBuilder(
          GPokemonDetailData_pokemon_abilitiesBuilder b) =>
      b..G__typename = 'pokemonability';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  int get slot;
  bool get is_hidden;
  GPokemonDetailData_pokemon_abilities_ability? get ability;
  static Serializer<GPokemonDetailData_pokemon_abilities> get serializer =>
      _$gPokemonDetailDataPokemonAbilitiesSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GPokemonDetailData_pokemon_abilities.serializer,
        this,
      ) as Map<String, dynamic>);

  static GPokemonDetailData_pokemon_abilities? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GPokemonDetailData_pokemon_abilities.serializer,
        json,
      );
}

abstract class GPokemonDetailData_pokemon_abilities_ability
    implements
        Built<GPokemonDetailData_pokemon_abilities_ability,
            GPokemonDetailData_pokemon_abilities_abilityBuilder> {
  GPokemonDetailData_pokemon_abilities_ability._();

  factory GPokemonDetailData_pokemon_abilities_ability(
      [void Function(GPokemonDetailData_pokemon_abilities_abilityBuilder b)
          updates]) = _$GPokemonDetailData_pokemon_abilities_ability;

  static void _initializeBuilder(
          GPokemonDetailData_pokemon_abilities_abilityBuilder b) =>
      b..G__typename = 'ability';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  int get id;
  String get name;
  BuiltList<GPokemonDetailData_pokemon_abilities_ability_effects> get effects;
  static Serializer<GPokemonDetailData_pokemon_abilities_ability>
      get serializer => _$gPokemonDetailDataPokemonAbilitiesAbilitySerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GPokemonDetailData_pokemon_abilities_ability.serializer,
        this,
      ) as Map<String, dynamic>);

  static GPokemonDetailData_pokemon_abilities_ability? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GPokemonDetailData_pokemon_abilities_ability.serializer,
        json,
      );
}

abstract class GPokemonDetailData_pokemon_abilities_ability_effects
    implements
        Built<GPokemonDetailData_pokemon_abilities_ability_effects,
            GPokemonDetailData_pokemon_abilities_ability_effectsBuilder> {
  GPokemonDetailData_pokemon_abilities_ability_effects._();

  factory GPokemonDetailData_pokemon_abilities_ability_effects(
      [void Function(
              GPokemonDetailData_pokemon_abilities_ability_effectsBuilder b)
          updates]) = _$GPokemonDetailData_pokemon_abilities_ability_effects;

  static void _initializeBuilder(
          GPokemonDetailData_pokemon_abilities_ability_effectsBuilder b) =>
      b..G__typename = 'abilityeffecttext';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String get effect;
  String get short_effect;
  static Serializer<GPokemonDetailData_pokemon_abilities_ability_effects>
      get serializer =>
          _$gPokemonDetailDataPokemonAbilitiesAbilityEffectsSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GPokemonDetailData_pokemon_abilities_ability_effects.serializer,
        this,
      ) as Map<String, dynamic>);

  static GPokemonDetailData_pokemon_abilities_ability_effects? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GPokemonDetailData_pokemon_abilities_ability_effects.serializer,
        json,
      );
}

abstract class GPokemonDetailData_pokemon_moves
    implements
        Built<GPokemonDetailData_pokemon_moves,
            GPokemonDetailData_pokemon_movesBuilder> {
  GPokemonDetailData_pokemon_moves._();

  factory GPokemonDetailData_pokemon_moves(
          [void Function(GPokemonDetailData_pokemon_movesBuilder b) updates]) =
      _$GPokemonDetailData_pokemon_moves;

  static void _initializeBuilder(GPokemonDetailData_pokemon_movesBuilder b) =>
      b..G__typename = 'pokemonmove';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  int get level;
  GPokemonDetailData_pokemon_moves_move? get move;
  GPokemonDetailData_pokemon_moves_method? get method;
  GPokemonDetailData_pokemon_moves_versionGroup? get versionGroup;
  static Serializer<GPokemonDetailData_pokemon_moves> get serializer =>
      _$gPokemonDetailDataPokemonMovesSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GPokemonDetailData_pokemon_moves.serializer,
        this,
      ) as Map<String, dynamic>);

  static GPokemonDetailData_pokemon_moves? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GPokemonDetailData_pokemon_moves.serializer,
        json,
      );
}

abstract class GPokemonDetailData_pokemon_moves_move
    implements
        Built<GPokemonDetailData_pokemon_moves_move,
            GPokemonDetailData_pokemon_moves_moveBuilder> {
  GPokemonDetailData_pokemon_moves_move._();

  factory GPokemonDetailData_pokemon_moves_move(
      [void Function(GPokemonDetailData_pokemon_moves_moveBuilder b)
          updates]) = _$GPokemonDetailData_pokemon_moves_move;

  static void _initializeBuilder(
          GPokemonDetailData_pokemon_moves_moveBuilder b) =>
      b..G__typename = 'move';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  int get id;
  String get name;
  static Serializer<GPokemonDetailData_pokemon_moves_move> get serializer =>
      _$gPokemonDetailDataPokemonMovesMoveSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GPokemonDetailData_pokemon_moves_move.serializer,
        this,
      ) as Map<String, dynamic>);

  static GPokemonDetailData_pokemon_moves_move? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GPokemonDetailData_pokemon_moves_move.serializer,
        json,
      );
}

abstract class GPokemonDetailData_pokemon_moves_method
    implements
        Built<GPokemonDetailData_pokemon_moves_method,
            GPokemonDetailData_pokemon_moves_methodBuilder> {
  GPokemonDetailData_pokemon_moves_method._();

  factory GPokemonDetailData_pokemon_moves_method(
      [void Function(GPokemonDetailData_pokemon_moves_methodBuilder b)
          updates]) = _$GPokemonDetailData_pokemon_moves_method;

  static void _initializeBuilder(
          GPokemonDetailData_pokemon_moves_methodBuilder b) =>
      b..G__typename = 'movelearnmethod';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String get name;
  static Serializer<GPokemonDetailData_pokemon_moves_method> get serializer =>
      _$gPokemonDetailDataPokemonMovesMethodSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GPokemonDetailData_pokemon_moves_method.serializer,
        this,
      ) as Map<String, dynamic>);

  static GPokemonDetailData_pokemon_moves_method? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GPokemonDetailData_pokemon_moves_method.serializer,
        json,
      );
}

abstract class GPokemonDetailData_pokemon_moves_versionGroup
    implements
        Built<GPokemonDetailData_pokemon_moves_versionGroup,
            GPokemonDetailData_pokemon_moves_versionGroupBuilder> {
  GPokemonDetailData_pokemon_moves_versionGroup._();

  factory GPokemonDetailData_pokemon_moves_versionGroup(
      [void Function(GPokemonDetailData_pokemon_moves_versionGroupBuilder b)
          updates]) = _$GPokemonDetailData_pokemon_moves_versionGroup;

  static void _initializeBuilder(
          GPokemonDetailData_pokemon_moves_versionGroupBuilder b) =>
      b..G__typename = 'versiongroup';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  String get name;
  static Serializer<GPokemonDetailData_pokemon_moves_versionGroup>
      get serializer => _$gPokemonDetailDataPokemonMovesVersionGroupSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GPokemonDetailData_pokemon_moves_versionGroup.serializer,
        this,
      ) as Map<String, dynamic>);

  static GPokemonDetailData_pokemon_moves_versionGroup? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GPokemonDetailData_pokemon_moves_versionGroup.serializer,
        json,
      );
}

abstract class GPokemonDetailData_typeEfficacies
    implements
        Built<GPokemonDetailData_typeEfficacies,
            GPokemonDetailData_typeEfficaciesBuilder> {
  GPokemonDetailData_typeEfficacies._();

  factory GPokemonDetailData_typeEfficacies(
          [void Function(GPokemonDetailData_typeEfficaciesBuilder b) updates]) =
      _$GPokemonDetailData_typeEfficacies;

  static void _initializeBuilder(GPokemonDetailData_typeEfficaciesBuilder b) =>
      b..G__typename = 'typeefficacy';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  int get damage_factor;
  GPokemonDetailData_typeEfficacies_attackingType? get attackingType;
  GPokemonDetailData_typeEfficacies_defendingType? get defendingType;
  static Serializer<GPokemonDetailData_typeEfficacies> get serializer =>
      _$gPokemonDetailDataTypeEfficaciesSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GPokemonDetailData_typeEfficacies.serializer,
        this,
      ) as Map<String, dynamic>);

  static GPokemonDetailData_typeEfficacies? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GPokemonDetailData_typeEfficacies.serializer,
        json,
      );
}

abstract class GPokemonDetailData_typeEfficacies_attackingType
    implements
        Built<GPokemonDetailData_typeEfficacies_attackingType,
            GPokemonDetailData_typeEfficacies_attackingTypeBuilder> {
  GPokemonDetailData_typeEfficacies_attackingType._();

  factory GPokemonDetailData_typeEfficacies_attackingType(
      [void Function(GPokemonDetailData_typeEfficacies_attackingTypeBuilder b)
          updates]) = _$GPokemonDetailData_typeEfficacies_attackingType;

  static void _initializeBuilder(
          GPokemonDetailData_typeEfficacies_attackingTypeBuilder b) =>
      b..G__typename = 'type';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  int get id;
  String get name;
  static Serializer<GPokemonDetailData_typeEfficacies_attackingType>
      get serializer =>
          _$gPokemonDetailDataTypeEfficaciesAttackingTypeSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GPokemonDetailData_typeEfficacies_attackingType.serializer,
        this,
      ) as Map<String, dynamic>);

  static GPokemonDetailData_typeEfficacies_attackingType? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GPokemonDetailData_typeEfficacies_attackingType.serializer,
        json,
      );
}

abstract class GPokemonDetailData_typeEfficacies_defendingType
    implements
        Built<GPokemonDetailData_typeEfficacies_defendingType,
            GPokemonDetailData_typeEfficacies_defendingTypeBuilder> {
  GPokemonDetailData_typeEfficacies_defendingType._();

  factory GPokemonDetailData_typeEfficacies_defendingType(
      [void Function(GPokemonDetailData_typeEfficacies_defendingTypeBuilder b)
          updates]) = _$GPokemonDetailData_typeEfficacies_defendingType;

  static void _initializeBuilder(
          GPokemonDetailData_typeEfficacies_defendingTypeBuilder b) =>
      b..G__typename = 'type';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  int get id;
  String get name;
  static Serializer<GPokemonDetailData_typeEfficacies_defendingType>
      get serializer =>
          _$gPokemonDetailDataTypeEfficaciesDefendingTypeSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GPokemonDetailData_typeEfficacies_defendingType.serializer,
        this,
      ) as Map<String, dynamic>);

  static GPokemonDetailData_typeEfficacies_defendingType? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GPokemonDetailData_typeEfficacies_defendingType.serializer,
        json,
      );
}
