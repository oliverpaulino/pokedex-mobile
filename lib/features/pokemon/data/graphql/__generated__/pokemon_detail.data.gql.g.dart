// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_detail.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GPokemonDetailData> _$gPokemonDetailDataSerializer =
    _$GPokemonDetailDataSerializer();
Serializer<GPokemonDetailData_pokemon> _$gPokemonDetailDataPokemonSerializer =
    _$GPokemonDetailData_pokemonSerializer();
Serializer<GPokemonDetailData_pokemon_species>
    _$gPokemonDetailDataPokemonSpeciesSerializer =
    _$GPokemonDetailData_pokemon_speciesSerializer();
Serializer<GPokemonDetailData_pokemon_species_eggGroups>
    _$gPokemonDetailDataPokemonSpeciesEggGroupsSerializer =
    _$GPokemonDetailData_pokemon_species_eggGroupsSerializer();
Serializer<GPokemonDetailData_pokemon_species_eggGroups_egggroup>
    _$gPokemonDetailDataPokemonSpeciesEggGroupsEgggroupSerializer =
    _$GPokemonDetailData_pokemon_species_eggGroups_egggroupSerializer();
Serializer<GPokemonDetailData_pokemon_species_variants>
    _$gPokemonDetailDataPokemonSpeciesVariantsSerializer =
    _$GPokemonDetailData_pokemon_species_variantsSerializer();
Serializer<GPokemonDetailData_pokemon_species_evolutionChain>
    _$gPokemonDetailDataPokemonSpeciesEvolutionChainSerializer =
    _$GPokemonDetailData_pokemon_species_evolutionChainSerializer();
Serializer<GPokemonDetailData_pokemon_species_evolutionChain_species>
    _$gPokemonDetailDataPokemonSpeciesEvolutionChainSpeciesSerializer =
    _$GPokemonDetailData_pokemon_species_evolutionChain_speciesSerializer();
Serializer<GPokemonDetailData_pokemon_species_evolutionChain_species_evolutions>
    _$gPokemonDetailDataPokemonSpeciesEvolutionChainSpeciesEvolutionsSerializer =
    _$GPokemonDetailData_pokemon_species_evolutionChain_species_evolutionsSerializer();
Serializer<
        GPokemonDetailData_pokemon_species_evolutionChain_species_evolutions_trigger>
    _$gPokemonDetailDataPokemonSpeciesEvolutionChainSpeciesEvolutionsTriggerSerializer =
    _$GPokemonDetailData_pokemon_species_evolutionChain_species_evolutions_triggerSerializer();
Serializer<GPokemonDetailData_pokemon_types>
    _$gPokemonDetailDataPokemonTypesSerializer =
    _$GPokemonDetailData_pokemon_typesSerializer();
Serializer<GPokemonDetailData_pokemon_types_type>
    _$gPokemonDetailDataPokemonTypesTypeSerializer =
    _$GPokemonDetailData_pokemon_types_typeSerializer();
Serializer<GPokemonDetailData_pokemon_sprites>
    _$gPokemonDetailDataPokemonSpritesSerializer =
    _$GPokemonDetailData_pokemon_spritesSerializer();
Serializer<GPokemonDetailData_pokemon_stats>
    _$gPokemonDetailDataPokemonStatsSerializer =
    _$GPokemonDetailData_pokemon_statsSerializer();
Serializer<GPokemonDetailData_pokemon_stats_stat>
    _$gPokemonDetailDataPokemonStatsStatSerializer =
    _$GPokemonDetailData_pokemon_stats_statSerializer();
Serializer<GPokemonDetailData_pokemon_abilities>
    _$gPokemonDetailDataPokemonAbilitiesSerializer =
    _$GPokemonDetailData_pokemon_abilitiesSerializer();
Serializer<GPokemonDetailData_pokemon_abilities_ability>
    _$gPokemonDetailDataPokemonAbilitiesAbilitySerializer =
    _$GPokemonDetailData_pokemon_abilities_abilitySerializer();
Serializer<GPokemonDetailData_pokemon_abilities_ability_effects>
    _$gPokemonDetailDataPokemonAbilitiesAbilityEffectsSerializer =
    _$GPokemonDetailData_pokemon_abilities_ability_effectsSerializer();
Serializer<GPokemonDetailData_pokemon_moves>
    _$gPokemonDetailDataPokemonMovesSerializer =
    _$GPokemonDetailData_pokemon_movesSerializer();
Serializer<GPokemonDetailData_pokemon_moves_move>
    _$gPokemonDetailDataPokemonMovesMoveSerializer =
    _$GPokemonDetailData_pokemon_moves_moveSerializer();
Serializer<GPokemonDetailData_pokemon_moves_method>
    _$gPokemonDetailDataPokemonMovesMethodSerializer =
    _$GPokemonDetailData_pokemon_moves_methodSerializer();
Serializer<GPokemonDetailData_pokemon_moves_versionGroup>
    _$gPokemonDetailDataPokemonMovesVersionGroupSerializer =
    _$GPokemonDetailData_pokemon_moves_versionGroupSerializer();
Serializer<GPokemonDetailData_typeEfficacies>
    _$gPokemonDetailDataTypeEfficaciesSerializer =
    _$GPokemonDetailData_typeEfficaciesSerializer();
Serializer<GPokemonDetailData_typeEfficacies_attackingType>
    _$gPokemonDetailDataTypeEfficaciesAttackingTypeSerializer =
    _$GPokemonDetailData_typeEfficacies_attackingTypeSerializer();
Serializer<GPokemonDetailData_typeEfficacies_defendingType>
    _$gPokemonDetailDataTypeEfficaciesDefendingTypeSerializer =
    _$GPokemonDetailData_typeEfficacies_defendingTypeSerializer();

class _$GPokemonDetailDataSerializer
    implements StructuredSerializer<GPokemonDetailData> {
  @override
  final Iterable<Type> types = const [GPokemonDetailData, _$GPokemonDetailData];
  @override
  final String wireName = 'GPokemonDetailData';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GPokemonDetailData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'pokemon',
      serializers.serialize(object.pokemon,
          specifiedType: const FullType(
              BuiltList, const [const FullType(GPokemonDetailData_pokemon)])),
      'typeEfficacies',
      serializers.serialize(object.typeEfficacies,
          specifiedType: const FullType(BuiltList,
              const [const FullType(GPokemonDetailData_typeEfficacies)])),
    ];

    return result;
  }

  @override
  GPokemonDetailData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = GPokemonDetailDataBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case '__typename':
          result.G__typename = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'pokemon':
          result.pokemon.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(GPokemonDetailData_pokemon)
              ]))! as BuiltList<Object?>);
          break;
        case 'typeEfficacies':
          result.typeEfficacies.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(GPokemonDetailData_typeEfficacies)
              ]))! as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$GPokemonDetailData_pokemonSerializer
    implements StructuredSerializer<GPokemonDetailData_pokemon> {
  @override
  final Iterable<Type> types = const [
    GPokemonDetailData_pokemon,
    _$GPokemonDetailData_pokemon
  ];
  @override
  final String wireName = 'GPokemonDetailData_pokemon';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GPokemonDetailData_pokemon object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(int)),
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'is_default',
      serializers.serialize(object.is_default,
          specifiedType: const FullType(bool)),
      'types',
      serializers.serialize(object.types,
          specifiedType: const FullType(BuiltList,
              const [const FullType(GPokemonDetailData_pokemon_types)])),
      'sprites',
      serializers.serialize(object.sprites,
          specifiedType: const FullType(BuiltList,
              const [const FullType(GPokemonDetailData_pokemon_sprites)])),
      'stats',
      serializers.serialize(object.stats,
          specifiedType: const FullType(BuiltList,
              const [const FullType(GPokemonDetailData_pokemon_stats)])),
      'abilities',
      serializers.serialize(object.abilities,
          specifiedType: const FullType(BuiltList,
              const [const FullType(GPokemonDetailData_pokemon_abilities)])),
      'moves',
      serializers.serialize(object.moves,
          specifiedType: const FullType(BuiltList,
              const [const FullType(GPokemonDetailData_pokemon_moves)])),
    ];
    Object? value;
    value = object.height;
    if (value != null) {
      result
        ..add('height')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.weight;
    if (value != null) {
      result
        ..add('weight')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.pokemon_species_id;
    if (value != null) {
      result
        ..add('pokemon_species_id')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.species;
    if (value != null) {
      result
        ..add('species')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(GPokemonDetailData_pokemon_species)));
    }
    return result;
  }

  @override
  GPokemonDetailData_pokemon deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = GPokemonDetailData_pokemonBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case '__typename':
          result.G__typename = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'is_default':
          result.is_default = serializers.deserialize(value,
              specifiedType: const FullType(bool))! as bool;
          break;
        case 'height':
          result.height = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'weight':
          result.weight = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'pokemon_species_id':
          result.pokemon_species_id = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'species':
          result.species.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(GPokemonDetailData_pokemon_species))!
              as GPokemonDetailData_pokemon_species);
          break;
        case 'types':
          result.types.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(GPokemonDetailData_pokemon_types)
              ]))! as BuiltList<Object?>);
          break;
        case 'sprites':
          result.sprites.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(GPokemonDetailData_pokemon_sprites)
              ]))! as BuiltList<Object?>);
          break;
        case 'stats':
          result.stats.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(GPokemonDetailData_pokemon_stats)
              ]))! as BuiltList<Object?>);
          break;
        case 'abilities':
          result.abilities.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(GPokemonDetailData_pokemon_abilities)
              ]))! as BuiltList<Object?>);
          break;
        case 'moves':
          result.moves.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(GPokemonDetailData_pokemon_moves)
              ]))! as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$GPokemonDetailData_pokemon_speciesSerializer
    implements StructuredSerializer<GPokemonDetailData_pokemon_species> {
  @override
  final Iterable<Type> types = const [
    GPokemonDetailData_pokemon_species,
    _$GPokemonDetailData_pokemon_species
  ];
  @override
  final String wireName = 'GPokemonDetailData_pokemon_species';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GPokemonDetailData_pokemon_species object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(int)),
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'eggGroups',
      serializers.serialize(object.eggGroups,
          specifiedType: const FullType(BuiltList, const [
            const FullType(GPokemonDetailData_pokemon_species_eggGroups)
          ])),
      'variants',
      serializers.serialize(object.variants,
          specifiedType: const FullType(BuiltList, const [
            const FullType(GPokemonDetailData_pokemon_species_variants)
          ])),
    ];
    Object? value;
    value = object.generation_id;
    if (value != null) {
      result
        ..add('generation_id')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.evolution_chain_id;
    if (value != null) {
      result
        ..add('evolution_chain_id')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.evolves_from_species_id;
    if (value != null) {
      result
        ..add('evolves_from_species_id')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.evolutionChain;
    if (value != null) {
      result
        ..add('evolutionChain')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                GPokemonDetailData_pokemon_species_evolutionChain)));
    }
    return result;
  }

  @override
  GPokemonDetailData_pokemon_species deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = GPokemonDetailData_pokemon_speciesBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case '__typename':
          result.G__typename = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'generation_id':
          result.generation_id = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'evolution_chain_id':
          result.evolution_chain_id = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'evolves_from_species_id':
          result.evolves_from_species_id = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'eggGroups':
          result.eggGroups.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(GPokemonDetailData_pokemon_species_eggGroups)
              ]))! as BuiltList<Object?>);
          break;
        case 'variants':
          result.variants.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(GPokemonDetailData_pokemon_species_variants)
              ]))! as BuiltList<Object?>);
          break;
        case 'evolutionChain':
          result.evolutionChain.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      GPokemonDetailData_pokemon_species_evolutionChain))!
              as GPokemonDetailData_pokemon_species_evolutionChain);
          break;
      }
    }

    return result.build();
  }
}

class _$GPokemonDetailData_pokemon_species_eggGroupsSerializer
    implements
        StructuredSerializer<GPokemonDetailData_pokemon_species_eggGroups> {
  @override
  final Iterable<Type> types = const [
    GPokemonDetailData_pokemon_species_eggGroups,
    _$GPokemonDetailData_pokemon_species_eggGroups
  ];
  @override
  final String wireName = 'GPokemonDetailData_pokemon_species_eggGroups';

  @override
  Iterable<Object?> serialize(Serializers serializers,
      GPokemonDetailData_pokemon_species_eggGroups object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.egggroup;
    if (value != null) {
      result
        ..add('egggroup')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                GPokemonDetailData_pokemon_species_eggGroups_egggroup)));
    }
    return result;
  }

  @override
  GPokemonDetailData_pokemon_species_eggGroups deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = GPokemonDetailData_pokemon_species_eggGroupsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case '__typename':
          result.G__typename = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'egggroup':
          result.egggroup.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      GPokemonDetailData_pokemon_species_eggGroups_egggroup))!
              as GPokemonDetailData_pokemon_species_eggGroups_egggroup);
          break;
      }
    }

    return result.build();
  }
}

class _$GPokemonDetailData_pokemon_species_eggGroups_egggroupSerializer
    implements
        StructuredSerializer<
            GPokemonDetailData_pokemon_species_eggGroups_egggroup> {
  @override
  final Iterable<Type> types = const [
    GPokemonDetailData_pokemon_species_eggGroups_egggroup,
    _$GPokemonDetailData_pokemon_species_eggGroups_egggroup
  ];
  @override
  final String wireName =
      'GPokemonDetailData_pokemon_species_eggGroups_egggroup';

  @override
  Iterable<Object?> serialize(Serializers serializers,
      GPokemonDetailData_pokemon_species_eggGroups_egggroup object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(int)),
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  GPokemonDetailData_pokemon_species_eggGroups_egggroup deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result =
        GPokemonDetailData_pokemon_species_eggGroups_egggroupBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case '__typename':
          result.G__typename = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$GPokemonDetailData_pokemon_species_variantsSerializer
    implements
        StructuredSerializer<GPokemonDetailData_pokemon_species_variants> {
  @override
  final Iterable<Type> types = const [
    GPokemonDetailData_pokemon_species_variants,
    _$GPokemonDetailData_pokemon_species_variants
  ];
  @override
  final String wireName = 'GPokemonDetailData_pokemon_species_variants';

  @override
  Iterable<Object?> serialize(Serializers serializers,
      GPokemonDetailData_pokemon_species_variants object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(int)),
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'is_default',
      serializers.serialize(object.is_default,
          specifiedType: const FullType(bool)),
    ];

    return result;
  }

  @override
  GPokemonDetailData_pokemon_species_variants deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = GPokemonDetailData_pokemon_species_variantsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case '__typename':
          result.G__typename = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'is_default':
          result.is_default = serializers.deserialize(value,
              specifiedType: const FullType(bool))! as bool;
          break;
      }
    }

    return result.build();
  }
}

class _$GPokemonDetailData_pokemon_species_evolutionChainSerializer
    implements
        StructuredSerializer<
            GPokemonDetailData_pokemon_species_evolutionChain> {
  @override
  final Iterable<Type> types = const [
    GPokemonDetailData_pokemon_species_evolutionChain,
    _$GPokemonDetailData_pokemon_species_evolutionChain
  ];
  @override
  final String wireName = 'GPokemonDetailData_pokemon_species_evolutionChain';

  @override
  Iterable<Object?> serialize(Serializers serializers,
      GPokemonDetailData_pokemon_species_evolutionChain object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'species',
      serializers.serialize(object.species,
          specifiedType: const FullType(BuiltList, const [
            const FullType(
                GPokemonDetailData_pokemon_species_evolutionChain_species)
          ])),
    ];

    return result;
  }

  @override
  GPokemonDetailData_pokemon_species_evolutionChain deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = GPokemonDetailData_pokemon_species_evolutionChainBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case '__typename':
          result.G__typename = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'species':
          result.species.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(
                    GPokemonDetailData_pokemon_species_evolutionChain_species)
              ]))! as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$GPokemonDetailData_pokemon_species_evolutionChain_speciesSerializer
    implements
        StructuredSerializer<
            GPokemonDetailData_pokemon_species_evolutionChain_species> {
  @override
  final Iterable<Type> types = const [
    GPokemonDetailData_pokemon_species_evolutionChain_species,
    _$GPokemonDetailData_pokemon_species_evolutionChain_species
  ];
  @override
  final String wireName =
      'GPokemonDetailData_pokemon_species_evolutionChain_species';

  @override
  Iterable<Object?> serialize(Serializers serializers,
      GPokemonDetailData_pokemon_species_evolutionChain_species object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(int)),
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'evolutions',
      serializers.serialize(object.evolutions,
          specifiedType: const FullType(BuiltList, const [
            const FullType(
                GPokemonDetailData_pokemon_species_evolutionChain_species_evolutions)
          ])),
    ];
    Object? value;
    value = object.evolves_from_species_id;
    if (value != null) {
      result
        ..add('evolves_from_species_id')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    return result;
  }

  @override
  GPokemonDetailData_pokemon_species_evolutionChain_species deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result =
        GPokemonDetailData_pokemon_species_evolutionChain_speciesBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case '__typename':
          result.G__typename = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'evolves_from_species_id':
          result.evolves_from_species_id = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'evolutions':
          result.evolutions.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(
                    GPokemonDetailData_pokemon_species_evolutionChain_species_evolutions)
              ]))! as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$GPokemonDetailData_pokemon_species_evolutionChain_species_evolutionsSerializer
    implements
        StructuredSerializer<
            GPokemonDetailData_pokemon_species_evolutionChain_species_evolutions> {
  @override
  final Iterable<Type> types = const [
    GPokemonDetailData_pokemon_species_evolutionChain_species_evolutions,
    _$GPokemonDetailData_pokemon_species_evolutionChain_species_evolutions
  ];
  @override
  final String wireName =
      'GPokemonDetailData_pokemon_species_evolutionChain_species_evolutions';

  @override
  Iterable<Object?> serialize(
      Serializers serializers,
      GPokemonDetailData_pokemon_species_evolutionChain_species_evolutions
          object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'condition_expression',
      serializers.serialize(object.condition_expression,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.min_level;
    if (value != null) {
      result
        ..add('min_level')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.trigger;
    if (value != null) {
      result
        ..add('trigger')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                GPokemonDetailData_pokemon_species_evolutionChain_species_evolutions_trigger)));
    }
    return result;
  }

  @override
  GPokemonDetailData_pokemon_species_evolutionChain_species_evolutions
      deserialize(Serializers serializers, Iterable<Object?> serialized,
          {FullType specifiedType = FullType.unspecified}) {
    final result =
        GPokemonDetailData_pokemon_species_evolutionChain_species_evolutionsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case '__typename':
          result.G__typename = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'min_level':
          result.min_level = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'condition_expression':
          result.condition_expression = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'trigger':
          result.trigger.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      GPokemonDetailData_pokemon_species_evolutionChain_species_evolutions_trigger))!
              as GPokemonDetailData_pokemon_species_evolutionChain_species_evolutions_trigger);
          break;
      }
    }

    return result.build();
  }
}

class _$GPokemonDetailData_pokemon_species_evolutionChain_species_evolutions_triggerSerializer
    implements
        StructuredSerializer<
            GPokemonDetailData_pokemon_species_evolutionChain_species_evolutions_trigger> {
  @override
  final Iterable<Type> types = const [
    GPokemonDetailData_pokemon_species_evolutionChain_species_evolutions_trigger,
    _$GPokemonDetailData_pokemon_species_evolutionChain_species_evolutions_trigger
  ];
  @override
  final String wireName =
      'GPokemonDetailData_pokemon_species_evolutionChain_species_evolutions_trigger';

  @override
  Iterable<Object?> serialize(
      Serializers serializers,
      GPokemonDetailData_pokemon_species_evolutionChain_species_evolutions_trigger
          object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  GPokemonDetailData_pokemon_species_evolutionChain_species_evolutions_trigger
      deserialize(Serializers serializers, Iterable<Object?> serialized,
          {FullType specifiedType = FullType.unspecified}) {
    final result =
        GPokemonDetailData_pokemon_species_evolutionChain_species_evolutions_triggerBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case '__typename':
          result.G__typename = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$GPokemonDetailData_pokemon_typesSerializer
    implements StructuredSerializer<GPokemonDetailData_pokemon_types> {
  @override
  final Iterable<Type> types = const [
    GPokemonDetailData_pokemon_types,
    _$GPokemonDetailData_pokemon_types
  ];
  @override
  final String wireName = 'GPokemonDetailData_pokemon_types';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GPokemonDetailData_pokemon_types object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'slot',
      serializers.serialize(object.slot, specifiedType: const FullType(int)),
    ];
    Object? value;
    value = object.type;
    if (value != null) {
      result
        ..add('type')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(GPokemonDetailData_pokemon_types_type)));
    }
    return result;
  }

  @override
  GPokemonDetailData_pokemon_types deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = GPokemonDetailData_pokemon_typesBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case '__typename':
          result.G__typename = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'slot':
          result.slot = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'type':
          result.type.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(GPokemonDetailData_pokemon_types_type))!
              as GPokemonDetailData_pokemon_types_type);
          break;
      }
    }

    return result.build();
  }
}

class _$GPokemonDetailData_pokemon_types_typeSerializer
    implements StructuredSerializer<GPokemonDetailData_pokemon_types_type> {
  @override
  final Iterable<Type> types = const [
    GPokemonDetailData_pokemon_types_type,
    _$GPokemonDetailData_pokemon_types_type
  ];
  @override
  final String wireName = 'GPokemonDetailData_pokemon_types_type';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GPokemonDetailData_pokemon_types_type object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(int)),
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  GPokemonDetailData_pokemon_types_type deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = GPokemonDetailData_pokemon_types_typeBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case '__typename':
          result.G__typename = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$GPokemonDetailData_pokemon_spritesSerializer
    implements StructuredSerializer<GPokemonDetailData_pokemon_sprites> {
  @override
  final Iterable<Type> types = const [
    GPokemonDetailData_pokemon_sprites,
    _$GPokemonDetailData_pokemon_sprites
  ];
  @override
  final String wireName = 'GPokemonDetailData_pokemon_sprites';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GPokemonDetailData_pokemon_sprites object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'artwork',
      serializers.serialize(object.artwork,
          specifiedType: const FullType(_i2.Gjsonb)),
      'front',
      serializers.serialize(object.front,
          specifiedType: const FullType(_i2.Gjsonb)),
      'shinyArtwork',
      serializers.serialize(object.shinyArtwork,
          specifiedType: const FullType(_i2.Gjsonb)),
      'shinyFront',
      serializers.serialize(object.shinyFront,
          specifiedType: const FullType(_i2.Gjsonb)),
    ];

    return result;
  }

  @override
  GPokemonDetailData_pokemon_sprites deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = GPokemonDetailData_pokemon_spritesBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case '__typename':
          result.G__typename = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'artwork':
          result.artwork.replace(serializers.deserialize(value,
              specifiedType: const FullType(_i2.Gjsonb))! as _i2.Gjsonb);
          break;
        case 'front':
          result.front.replace(serializers.deserialize(value,
              specifiedType: const FullType(_i2.Gjsonb))! as _i2.Gjsonb);
          break;
        case 'shinyArtwork':
          result.shinyArtwork.replace(serializers.deserialize(value,
              specifiedType: const FullType(_i2.Gjsonb))! as _i2.Gjsonb);
          break;
        case 'shinyFront':
          result.shinyFront.replace(serializers.deserialize(value,
              specifiedType: const FullType(_i2.Gjsonb))! as _i2.Gjsonb);
          break;
      }
    }

    return result.build();
  }
}

class _$GPokemonDetailData_pokemon_statsSerializer
    implements StructuredSerializer<GPokemonDetailData_pokemon_stats> {
  @override
  final Iterable<Type> types = const [
    GPokemonDetailData_pokemon_stats,
    _$GPokemonDetailData_pokemon_stats
  ];
  @override
  final String wireName = 'GPokemonDetailData_pokemon_stats';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GPokemonDetailData_pokemon_stats object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'base_stat',
      serializers.serialize(object.base_stat,
          specifiedType: const FullType(int)),
    ];
    Object? value;
    value = object.stat;
    if (value != null) {
      result
        ..add('stat')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(GPokemonDetailData_pokemon_stats_stat)));
    }
    return result;
  }

  @override
  GPokemonDetailData_pokemon_stats deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = GPokemonDetailData_pokemon_statsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case '__typename':
          result.G__typename = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'base_stat':
          result.base_stat = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'stat':
          result.stat.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(GPokemonDetailData_pokemon_stats_stat))!
              as GPokemonDetailData_pokemon_stats_stat);
          break;
      }
    }

    return result.build();
  }
}

class _$GPokemonDetailData_pokemon_stats_statSerializer
    implements StructuredSerializer<GPokemonDetailData_pokemon_stats_stat> {
  @override
  final Iterable<Type> types = const [
    GPokemonDetailData_pokemon_stats_stat,
    _$GPokemonDetailData_pokemon_stats_stat
  ];
  @override
  final String wireName = 'GPokemonDetailData_pokemon_stats_stat';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GPokemonDetailData_pokemon_stats_stat object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(int)),
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  GPokemonDetailData_pokemon_stats_stat deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = GPokemonDetailData_pokemon_stats_statBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case '__typename':
          result.G__typename = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$GPokemonDetailData_pokemon_abilitiesSerializer
    implements StructuredSerializer<GPokemonDetailData_pokemon_abilities> {
  @override
  final Iterable<Type> types = const [
    GPokemonDetailData_pokemon_abilities,
    _$GPokemonDetailData_pokemon_abilities
  ];
  @override
  final String wireName = 'GPokemonDetailData_pokemon_abilities';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GPokemonDetailData_pokemon_abilities object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'slot',
      serializers.serialize(object.slot, specifiedType: const FullType(int)),
      'is_hidden',
      serializers.serialize(object.is_hidden,
          specifiedType: const FullType(bool)),
    ];
    Object? value;
    value = object.ability;
    if (value != null) {
      result
        ..add('ability')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(GPokemonDetailData_pokemon_abilities_ability)));
    }
    return result;
  }

  @override
  GPokemonDetailData_pokemon_abilities deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = GPokemonDetailData_pokemon_abilitiesBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case '__typename':
          result.G__typename = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'slot':
          result.slot = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'is_hidden':
          result.is_hidden = serializers.deserialize(value,
              specifiedType: const FullType(bool))! as bool;
          break;
        case 'ability':
          result.ability.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      GPokemonDetailData_pokemon_abilities_ability))!
              as GPokemonDetailData_pokemon_abilities_ability);
          break;
      }
    }

    return result.build();
  }
}

class _$GPokemonDetailData_pokemon_abilities_abilitySerializer
    implements
        StructuredSerializer<GPokemonDetailData_pokemon_abilities_ability> {
  @override
  final Iterable<Type> types = const [
    GPokemonDetailData_pokemon_abilities_ability,
    _$GPokemonDetailData_pokemon_abilities_ability
  ];
  @override
  final String wireName = 'GPokemonDetailData_pokemon_abilities_ability';

  @override
  Iterable<Object?> serialize(Serializers serializers,
      GPokemonDetailData_pokemon_abilities_ability object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(int)),
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'effects',
      serializers.serialize(object.effects,
          specifiedType: const FullType(BuiltList, const [
            const FullType(GPokemonDetailData_pokemon_abilities_ability_effects)
          ])),
    ];

    return result;
  }

  @override
  GPokemonDetailData_pokemon_abilities_ability deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = GPokemonDetailData_pokemon_abilities_abilityBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case '__typename':
          result.G__typename = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'effects':
          result.effects.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(
                    GPokemonDetailData_pokemon_abilities_ability_effects)
              ]))! as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$GPokemonDetailData_pokemon_abilities_ability_effectsSerializer
    implements
        StructuredSerializer<
            GPokemonDetailData_pokemon_abilities_ability_effects> {
  @override
  final Iterable<Type> types = const [
    GPokemonDetailData_pokemon_abilities_ability_effects,
    _$GPokemonDetailData_pokemon_abilities_ability_effects
  ];
  @override
  final String wireName =
      'GPokemonDetailData_pokemon_abilities_ability_effects';

  @override
  Iterable<Object?> serialize(Serializers serializers,
      GPokemonDetailData_pokemon_abilities_ability_effects object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'effect',
      serializers.serialize(object.effect,
          specifiedType: const FullType(String)),
      'short_effect',
      serializers.serialize(object.short_effect,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  GPokemonDetailData_pokemon_abilities_ability_effects deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result =
        GPokemonDetailData_pokemon_abilities_ability_effectsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case '__typename':
          result.G__typename = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'effect':
          result.effect = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'short_effect':
          result.short_effect = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$GPokemonDetailData_pokemon_movesSerializer
    implements StructuredSerializer<GPokemonDetailData_pokemon_moves> {
  @override
  final Iterable<Type> types = const [
    GPokemonDetailData_pokemon_moves,
    _$GPokemonDetailData_pokemon_moves
  ];
  @override
  final String wireName = 'GPokemonDetailData_pokemon_moves';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GPokemonDetailData_pokemon_moves object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'level',
      serializers.serialize(object.level, specifiedType: const FullType(int)),
    ];
    Object? value;
    value = object.move;
    if (value != null) {
      result
        ..add('move')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(GPokemonDetailData_pokemon_moves_move)));
    }
    value = object.method;
    if (value != null) {
      result
        ..add('method')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(GPokemonDetailData_pokemon_moves_method)));
    }
    value = object.versionGroup;
    if (value != null) {
      result
        ..add('versionGroup')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(GPokemonDetailData_pokemon_moves_versionGroup)));
    }
    return result;
  }

  @override
  GPokemonDetailData_pokemon_moves deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = GPokemonDetailData_pokemon_movesBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case '__typename':
          result.G__typename = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'level':
          result.level = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'move':
          result.move.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(GPokemonDetailData_pokemon_moves_move))!
              as GPokemonDetailData_pokemon_moves_move);
          break;
        case 'method':
          result.method.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(GPokemonDetailData_pokemon_moves_method))!
              as GPokemonDetailData_pokemon_moves_method);
          break;
        case 'versionGroup':
          result.versionGroup.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      GPokemonDetailData_pokemon_moves_versionGroup))!
              as GPokemonDetailData_pokemon_moves_versionGroup);
          break;
      }
    }

    return result.build();
  }
}

class _$GPokemonDetailData_pokemon_moves_moveSerializer
    implements StructuredSerializer<GPokemonDetailData_pokemon_moves_move> {
  @override
  final Iterable<Type> types = const [
    GPokemonDetailData_pokemon_moves_move,
    _$GPokemonDetailData_pokemon_moves_move
  ];
  @override
  final String wireName = 'GPokemonDetailData_pokemon_moves_move';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GPokemonDetailData_pokemon_moves_move object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(int)),
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  GPokemonDetailData_pokemon_moves_move deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = GPokemonDetailData_pokemon_moves_moveBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case '__typename':
          result.G__typename = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$GPokemonDetailData_pokemon_moves_methodSerializer
    implements StructuredSerializer<GPokemonDetailData_pokemon_moves_method> {
  @override
  final Iterable<Type> types = const [
    GPokemonDetailData_pokemon_moves_method,
    _$GPokemonDetailData_pokemon_moves_method
  ];
  @override
  final String wireName = 'GPokemonDetailData_pokemon_moves_method';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GPokemonDetailData_pokemon_moves_method object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  GPokemonDetailData_pokemon_moves_method deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = GPokemonDetailData_pokemon_moves_methodBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case '__typename':
          result.G__typename = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$GPokemonDetailData_pokemon_moves_versionGroupSerializer
    implements
        StructuredSerializer<GPokemonDetailData_pokemon_moves_versionGroup> {
  @override
  final Iterable<Type> types = const [
    GPokemonDetailData_pokemon_moves_versionGroup,
    _$GPokemonDetailData_pokemon_moves_versionGroup
  ];
  @override
  final String wireName = 'GPokemonDetailData_pokemon_moves_versionGroup';

  @override
  Iterable<Object?> serialize(Serializers serializers,
      GPokemonDetailData_pokemon_moves_versionGroup object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  GPokemonDetailData_pokemon_moves_versionGroup deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = GPokemonDetailData_pokemon_moves_versionGroupBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case '__typename':
          result.G__typename = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$GPokemonDetailData_typeEfficaciesSerializer
    implements StructuredSerializer<GPokemonDetailData_typeEfficacies> {
  @override
  final Iterable<Type> types = const [
    GPokemonDetailData_typeEfficacies,
    _$GPokemonDetailData_typeEfficacies
  ];
  @override
  final String wireName = 'GPokemonDetailData_typeEfficacies';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GPokemonDetailData_typeEfficacies object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'damage_factor',
      serializers.serialize(object.damage_factor,
          specifiedType: const FullType(int)),
    ];
    Object? value;
    value = object.attackingType;
    if (value != null) {
      result
        ..add('attackingType')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                GPokemonDetailData_typeEfficacies_attackingType)));
    }
    value = object.defendingType;
    if (value != null) {
      result
        ..add('defendingType')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                GPokemonDetailData_typeEfficacies_defendingType)));
    }
    return result;
  }

  @override
  GPokemonDetailData_typeEfficacies deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = GPokemonDetailData_typeEfficaciesBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case '__typename':
          result.G__typename = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'damage_factor':
          result.damage_factor = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'attackingType':
          result.attackingType.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      GPokemonDetailData_typeEfficacies_attackingType))!
              as GPokemonDetailData_typeEfficacies_attackingType);
          break;
        case 'defendingType':
          result.defendingType.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      GPokemonDetailData_typeEfficacies_defendingType))!
              as GPokemonDetailData_typeEfficacies_defendingType);
          break;
      }
    }

    return result.build();
  }
}

class _$GPokemonDetailData_typeEfficacies_attackingTypeSerializer
    implements
        StructuredSerializer<GPokemonDetailData_typeEfficacies_attackingType> {
  @override
  final Iterable<Type> types = const [
    GPokemonDetailData_typeEfficacies_attackingType,
    _$GPokemonDetailData_typeEfficacies_attackingType
  ];
  @override
  final String wireName = 'GPokemonDetailData_typeEfficacies_attackingType';

  @override
  Iterable<Object?> serialize(Serializers serializers,
      GPokemonDetailData_typeEfficacies_attackingType object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(int)),
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  GPokemonDetailData_typeEfficacies_attackingType deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = GPokemonDetailData_typeEfficacies_attackingTypeBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case '__typename':
          result.G__typename = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$GPokemonDetailData_typeEfficacies_defendingTypeSerializer
    implements
        StructuredSerializer<GPokemonDetailData_typeEfficacies_defendingType> {
  @override
  final Iterable<Type> types = const [
    GPokemonDetailData_typeEfficacies_defendingType,
    _$GPokemonDetailData_typeEfficacies_defendingType
  ];
  @override
  final String wireName = 'GPokemonDetailData_typeEfficacies_defendingType';

  @override
  Iterable<Object?> serialize(Serializers serializers,
      GPokemonDetailData_typeEfficacies_defendingType object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(int)),
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  GPokemonDetailData_typeEfficacies_defendingType deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = GPokemonDetailData_typeEfficacies_defendingTypeBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case '__typename':
          result.G__typename = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$GPokemonDetailData extends GPokemonDetailData {
  @override
  final String G__typename;
  @override
  final BuiltList<GPokemonDetailData_pokemon> pokemon;
  @override
  final BuiltList<GPokemonDetailData_typeEfficacies> typeEfficacies;

  factory _$GPokemonDetailData(
          [void Function(GPokemonDetailDataBuilder)? updates]) =>
      (GPokemonDetailDataBuilder()..update(updates))._build();

  _$GPokemonDetailData._(
      {required this.G__typename,
      required this.pokemon,
      required this.typeEfficacies})
      : super._();
  @override
  GPokemonDetailData rebuild(
          void Function(GPokemonDetailDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GPokemonDetailDataBuilder toBuilder() =>
      GPokemonDetailDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GPokemonDetailData &&
        G__typename == other.G__typename &&
        pokemon == other.pokemon &&
        typeEfficacies == other.typeEfficacies;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, pokemon.hashCode);
    _$hash = $jc(_$hash, typeEfficacies.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GPokemonDetailData')
          ..add('G__typename', G__typename)
          ..add('pokemon', pokemon)
          ..add('typeEfficacies', typeEfficacies))
        .toString();
  }
}

class GPokemonDetailDataBuilder
    implements Builder<GPokemonDetailData, GPokemonDetailDataBuilder> {
  _$GPokemonDetailData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  ListBuilder<GPokemonDetailData_pokemon>? _pokemon;
  ListBuilder<GPokemonDetailData_pokemon> get pokemon =>
      _$this._pokemon ??= ListBuilder<GPokemonDetailData_pokemon>();
  set pokemon(ListBuilder<GPokemonDetailData_pokemon>? pokemon) =>
      _$this._pokemon = pokemon;

  ListBuilder<GPokemonDetailData_typeEfficacies>? _typeEfficacies;
  ListBuilder<GPokemonDetailData_typeEfficacies> get typeEfficacies =>
      _$this._typeEfficacies ??=
          ListBuilder<GPokemonDetailData_typeEfficacies>();
  set typeEfficacies(
          ListBuilder<GPokemonDetailData_typeEfficacies>? typeEfficacies) =>
      _$this._typeEfficacies = typeEfficacies;

  GPokemonDetailDataBuilder() {
    GPokemonDetailData._initializeBuilder(this);
  }

  GPokemonDetailDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _pokemon = $v.pokemon.toBuilder();
      _typeEfficacies = $v.typeEfficacies.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GPokemonDetailData other) {
    _$v = other as _$GPokemonDetailData;
  }

  @override
  void update(void Function(GPokemonDetailDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GPokemonDetailData build() => _build();

  _$GPokemonDetailData _build() {
    _$GPokemonDetailData _$result;
    try {
      _$result = _$v ??
          _$GPokemonDetailData._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename, r'GPokemonDetailData', 'G__typename'),
            pokemon: pokemon.build(),
            typeEfficacies: typeEfficacies.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'pokemon';
        pokemon.build();
        _$failedField = 'typeEfficacies';
        typeEfficacies.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'GPokemonDetailData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GPokemonDetailData_pokemon extends GPokemonDetailData_pokemon {
  @override
  final String G__typename;
  @override
  final int id;
  @override
  final String name;
  @override
  final bool is_default;
  @override
  final int? height;
  @override
  final int? weight;
  @override
  final int? pokemon_species_id;
  @override
  final GPokemonDetailData_pokemon_species? species;
  @override
  final BuiltList<GPokemonDetailData_pokemon_types> types;
  @override
  final BuiltList<GPokemonDetailData_pokemon_sprites> sprites;
  @override
  final BuiltList<GPokemonDetailData_pokemon_stats> stats;
  @override
  final BuiltList<GPokemonDetailData_pokemon_abilities> abilities;
  @override
  final BuiltList<GPokemonDetailData_pokemon_moves> moves;

  factory _$GPokemonDetailData_pokemon(
          [void Function(GPokemonDetailData_pokemonBuilder)? updates]) =>
      (GPokemonDetailData_pokemonBuilder()..update(updates))._build();

  _$GPokemonDetailData_pokemon._(
      {required this.G__typename,
      required this.id,
      required this.name,
      required this.is_default,
      this.height,
      this.weight,
      this.pokemon_species_id,
      this.species,
      required this.types,
      required this.sprites,
      required this.stats,
      required this.abilities,
      required this.moves})
      : super._();
  @override
  GPokemonDetailData_pokemon rebuild(
          void Function(GPokemonDetailData_pokemonBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GPokemonDetailData_pokemonBuilder toBuilder() =>
      GPokemonDetailData_pokemonBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GPokemonDetailData_pokemon &&
        G__typename == other.G__typename &&
        id == other.id &&
        name == other.name &&
        is_default == other.is_default &&
        height == other.height &&
        weight == other.weight &&
        pokemon_species_id == other.pokemon_species_id &&
        species == other.species &&
        types == other.types &&
        sprites == other.sprites &&
        stats == other.stats &&
        abilities == other.abilities &&
        moves == other.moves;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, is_default.hashCode);
    _$hash = $jc(_$hash, height.hashCode);
    _$hash = $jc(_$hash, weight.hashCode);
    _$hash = $jc(_$hash, pokemon_species_id.hashCode);
    _$hash = $jc(_$hash, species.hashCode);
    _$hash = $jc(_$hash, types.hashCode);
    _$hash = $jc(_$hash, sprites.hashCode);
    _$hash = $jc(_$hash, stats.hashCode);
    _$hash = $jc(_$hash, abilities.hashCode);
    _$hash = $jc(_$hash, moves.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GPokemonDetailData_pokemon')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('name', name)
          ..add('is_default', is_default)
          ..add('height', height)
          ..add('weight', weight)
          ..add('pokemon_species_id', pokemon_species_id)
          ..add('species', species)
          ..add('types', types)
          ..add('sprites', sprites)
          ..add('stats', stats)
          ..add('abilities', abilities)
          ..add('moves', moves))
        .toString();
  }
}

class GPokemonDetailData_pokemonBuilder
    implements
        Builder<GPokemonDetailData_pokemon, GPokemonDetailData_pokemonBuilder> {
  _$GPokemonDetailData_pokemon? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  bool? _is_default;
  bool? get is_default => _$this._is_default;
  set is_default(bool? is_default) => _$this._is_default = is_default;

  int? _height;
  int? get height => _$this._height;
  set height(int? height) => _$this._height = height;

  int? _weight;
  int? get weight => _$this._weight;
  set weight(int? weight) => _$this._weight = weight;

  int? _pokemon_species_id;
  int? get pokemon_species_id => _$this._pokemon_species_id;
  set pokemon_species_id(int? pokemon_species_id) =>
      _$this._pokemon_species_id = pokemon_species_id;

  GPokemonDetailData_pokemon_speciesBuilder? _species;
  GPokemonDetailData_pokemon_speciesBuilder get species =>
      _$this._species ??= GPokemonDetailData_pokemon_speciesBuilder();
  set species(GPokemonDetailData_pokemon_speciesBuilder? species) =>
      _$this._species = species;

  ListBuilder<GPokemonDetailData_pokemon_types>? _types;
  ListBuilder<GPokemonDetailData_pokemon_types> get types =>
      _$this._types ??= ListBuilder<GPokemonDetailData_pokemon_types>();
  set types(ListBuilder<GPokemonDetailData_pokemon_types>? types) =>
      _$this._types = types;

  ListBuilder<GPokemonDetailData_pokemon_sprites>? _sprites;
  ListBuilder<GPokemonDetailData_pokemon_sprites> get sprites =>
      _$this._sprites ??= ListBuilder<GPokemonDetailData_pokemon_sprites>();
  set sprites(ListBuilder<GPokemonDetailData_pokemon_sprites>? sprites) =>
      _$this._sprites = sprites;

  ListBuilder<GPokemonDetailData_pokemon_stats>? _stats;
  ListBuilder<GPokemonDetailData_pokemon_stats> get stats =>
      _$this._stats ??= ListBuilder<GPokemonDetailData_pokemon_stats>();
  set stats(ListBuilder<GPokemonDetailData_pokemon_stats>? stats) =>
      _$this._stats = stats;

  ListBuilder<GPokemonDetailData_pokemon_abilities>? _abilities;
  ListBuilder<GPokemonDetailData_pokemon_abilities> get abilities =>
      _$this._abilities ??= ListBuilder<GPokemonDetailData_pokemon_abilities>();
  set abilities(ListBuilder<GPokemonDetailData_pokemon_abilities>? abilities) =>
      _$this._abilities = abilities;

  ListBuilder<GPokemonDetailData_pokemon_moves>? _moves;
  ListBuilder<GPokemonDetailData_pokemon_moves> get moves =>
      _$this._moves ??= ListBuilder<GPokemonDetailData_pokemon_moves>();
  set moves(ListBuilder<GPokemonDetailData_pokemon_moves>? moves) =>
      _$this._moves = moves;

  GPokemonDetailData_pokemonBuilder() {
    GPokemonDetailData_pokemon._initializeBuilder(this);
  }

  GPokemonDetailData_pokemonBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _id = $v.id;
      _name = $v.name;
      _is_default = $v.is_default;
      _height = $v.height;
      _weight = $v.weight;
      _pokemon_species_id = $v.pokemon_species_id;
      _species = $v.species?.toBuilder();
      _types = $v.types.toBuilder();
      _sprites = $v.sprites.toBuilder();
      _stats = $v.stats.toBuilder();
      _abilities = $v.abilities.toBuilder();
      _moves = $v.moves.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GPokemonDetailData_pokemon other) {
    _$v = other as _$GPokemonDetailData_pokemon;
  }

  @override
  void update(void Function(GPokemonDetailData_pokemonBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GPokemonDetailData_pokemon build() => _build();

  _$GPokemonDetailData_pokemon _build() {
    _$GPokemonDetailData_pokemon _$result;
    try {
      _$result = _$v ??
          _$GPokemonDetailData_pokemon._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename, r'GPokemonDetailData_pokemon', 'G__typename'),
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'GPokemonDetailData_pokemon', 'id'),
            name: BuiltValueNullFieldError.checkNotNull(
                name, r'GPokemonDetailData_pokemon', 'name'),
            is_default: BuiltValueNullFieldError.checkNotNull(
                is_default, r'GPokemonDetailData_pokemon', 'is_default'),
            height: height,
            weight: weight,
            pokemon_species_id: pokemon_species_id,
            species: _species?.build(),
            types: types.build(),
            sprites: sprites.build(),
            stats: stats.build(),
            abilities: abilities.build(),
            moves: moves.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'species';
        _species?.build();
        _$failedField = 'types';
        types.build();
        _$failedField = 'sprites';
        sprites.build();
        _$failedField = 'stats';
        stats.build();
        _$failedField = 'abilities';
        abilities.build();
        _$failedField = 'moves';
        moves.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'GPokemonDetailData_pokemon', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GPokemonDetailData_pokemon_species
    extends GPokemonDetailData_pokemon_species {
  @override
  final String G__typename;
  @override
  final int id;
  @override
  final String name;
  @override
  final int? generation_id;
  @override
  final int? evolution_chain_id;
  @override
  final int? evolves_from_species_id;
  @override
  final BuiltList<GPokemonDetailData_pokemon_species_eggGroups> eggGroups;
  @override
  final BuiltList<GPokemonDetailData_pokemon_species_variants> variants;
  @override
  final GPokemonDetailData_pokemon_species_evolutionChain? evolutionChain;

  factory _$GPokemonDetailData_pokemon_species(
          [void Function(GPokemonDetailData_pokemon_speciesBuilder)?
              updates]) =>
      (GPokemonDetailData_pokemon_speciesBuilder()..update(updates))._build();

  _$GPokemonDetailData_pokemon_species._(
      {required this.G__typename,
      required this.id,
      required this.name,
      this.generation_id,
      this.evolution_chain_id,
      this.evolves_from_species_id,
      required this.eggGroups,
      required this.variants,
      this.evolutionChain})
      : super._();
  @override
  GPokemonDetailData_pokemon_species rebuild(
          void Function(GPokemonDetailData_pokemon_speciesBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GPokemonDetailData_pokemon_speciesBuilder toBuilder() =>
      GPokemonDetailData_pokemon_speciesBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GPokemonDetailData_pokemon_species &&
        G__typename == other.G__typename &&
        id == other.id &&
        name == other.name &&
        generation_id == other.generation_id &&
        evolution_chain_id == other.evolution_chain_id &&
        evolves_from_species_id == other.evolves_from_species_id &&
        eggGroups == other.eggGroups &&
        variants == other.variants &&
        evolutionChain == other.evolutionChain;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, generation_id.hashCode);
    _$hash = $jc(_$hash, evolution_chain_id.hashCode);
    _$hash = $jc(_$hash, evolves_from_species_id.hashCode);
    _$hash = $jc(_$hash, eggGroups.hashCode);
    _$hash = $jc(_$hash, variants.hashCode);
    _$hash = $jc(_$hash, evolutionChain.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GPokemonDetailData_pokemon_species')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('name', name)
          ..add('generation_id', generation_id)
          ..add('evolution_chain_id', evolution_chain_id)
          ..add('evolves_from_species_id', evolves_from_species_id)
          ..add('eggGroups', eggGroups)
          ..add('variants', variants)
          ..add('evolutionChain', evolutionChain))
        .toString();
  }
}

class GPokemonDetailData_pokemon_speciesBuilder
    implements
        Builder<GPokemonDetailData_pokemon_species,
            GPokemonDetailData_pokemon_speciesBuilder> {
  _$GPokemonDetailData_pokemon_species? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  int? _generation_id;
  int? get generation_id => _$this._generation_id;
  set generation_id(int? generation_id) =>
      _$this._generation_id = generation_id;

  int? _evolution_chain_id;
  int? get evolution_chain_id => _$this._evolution_chain_id;
  set evolution_chain_id(int? evolution_chain_id) =>
      _$this._evolution_chain_id = evolution_chain_id;

  int? _evolves_from_species_id;
  int? get evolves_from_species_id => _$this._evolves_from_species_id;
  set evolves_from_species_id(int? evolves_from_species_id) =>
      _$this._evolves_from_species_id = evolves_from_species_id;

  ListBuilder<GPokemonDetailData_pokemon_species_eggGroups>? _eggGroups;
  ListBuilder<GPokemonDetailData_pokemon_species_eggGroups> get eggGroups =>
      _$this._eggGroups ??=
          ListBuilder<GPokemonDetailData_pokemon_species_eggGroups>();
  set eggGroups(
          ListBuilder<GPokemonDetailData_pokemon_species_eggGroups>?
              eggGroups) =>
      _$this._eggGroups = eggGroups;

  ListBuilder<GPokemonDetailData_pokemon_species_variants>? _variants;
  ListBuilder<GPokemonDetailData_pokemon_species_variants> get variants =>
      _$this._variants ??=
          ListBuilder<GPokemonDetailData_pokemon_species_variants>();
  set variants(
          ListBuilder<GPokemonDetailData_pokemon_species_variants>? variants) =>
      _$this._variants = variants;

  GPokemonDetailData_pokemon_species_evolutionChainBuilder? _evolutionChain;
  GPokemonDetailData_pokemon_species_evolutionChainBuilder get evolutionChain =>
      _$this._evolutionChain ??=
          GPokemonDetailData_pokemon_species_evolutionChainBuilder();
  set evolutionChain(
          GPokemonDetailData_pokemon_species_evolutionChainBuilder?
              evolutionChain) =>
      _$this._evolutionChain = evolutionChain;

  GPokemonDetailData_pokemon_speciesBuilder() {
    GPokemonDetailData_pokemon_species._initializeBuilder(this);
  }

  GPokemonDetailData_pokemon_speciesBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _id = $v.id;
      _name = $v.name;
      _generation_id = $v.generation_id;
      _evolution_chain_id = $v.evolution_chain_id;
      _evolves_from_species_id = $v.evolves_from_species_id;
      _eggGroups = $v.eggGroups.toBuilder();
      _variants = $v.variants.toBuilder();
      _evolutionChain = $v.evolutionChain?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GPokemonDetailData_pokemon_species other) {
    _$v = other as _$GPokemonDetailData_pokemon_species;
  }

  @override
  void update(
      void Function(GPokemonDetailData_pokemon_speciesBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GPokemonDetailData_pokemon_species build() => _build();

  _$GPokemonDetailData_pokemon_species _build() {
    _$GPokemonDetailData_pokemon_species _$result;
    try {
      _$result = _$v ??
          _$GPokemonDetailData_pokemon_species._(
            G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
                r'GPokemonDetailData_pokemon_species', 'G__typename'),
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'GPokemonDetailData_pokemon_species', 'id'),
            name: BuiltValueNullFieldError.checkNotNull(
                name, r'GPokemonDetailData_pokemon_species', 'name'),
            generation_id: generation_id,
            evolution_chain_id: evolution_chain_id,
            evolves_from_species_id: evolves_from_species_id,
            eggGroups: eggGroups.build(),
            variants: variants.build(),
            evolutionChain: _evolutionChain?.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'eggGroups';
        eggGroups.build();
        _$failedField = 'variants';
        variants.build();
        _$failedField = 'evolutionChain';
        _evolutionChain?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'GPokemonDetailData_pokemon_species', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GPokemonDetailData_pokemon_species_eggGroups
    extends GPokemonDetailData_pokemon_species_eggGroups {
  @override
  final String G__typename;
  @override
  final GPokemonDetailData_pokemon_species_eggGroups_egggroup? egggroup;

  factory _$GPokemonDetailData_pokemon_species_eggGroups(
          [void Function(GPokemonDetailData_pokemon_species_eggGroupsBuilder)?
              updates]) =>
      (GPokemonDetailData_pokemon_species_eggGroupsBuilder()..update(updates))
          ._build();

  _$GPokemonDetailData_pokemon_species_eggGroups._(
      {required this.G__typename, this.egggroup})
      : super._();
  @override
  GPokemonDetailData_pokemon_species_eggGroups rebuild(
          void Function(GPokemonDetailData_pokemon_species_eggGroupsBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GPokemonDetailData_pokemon_species_eggGroupsBuilder toBuilder() =>
      GPokemonDetailData_pokemon_species_eggGroupsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GPokemonDetailData_pokemon_species_eggGroups &&
        G__typename == other.G__typename &&
        egggroup == other.egggroup;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, egggroup.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'GPokemonDetailData_pokemon_species_eggGroups')
          ..add('G__typename', G__typename)
          ..add('egggroup', egggroup))
        .toString();
  }
}

class GPokemonDetailData_pokemon_species_eggGroupsBuilder
    implements
        Builder<GPokemonDetailData_pokemon_species_eggGroups,
            GPokemonDetailData_pokemon_species_eggGroupsBuilder> {
  _$GPokemonDetailData_pokemon_species_eggGroups? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  GPokemonDetailData_pokemon_species_eggGroups_egggroupBuilder? _egggroup;
  GPokemonDetailData_pokemon_species_eggGroups_egggroupBuilder get egggroup =>
      _$this._egggroup ??=
          GPokemonDetailData_pokemon_species_eggGroups_egggroupBuilder();
  set egggroup(
          GPokemonDetailData_pokemon_species_eggGroups_egggroupBuilder?
              egggroup) =>
      _$this._egggroup = egggroup;

  GPokemonDetailData_pokemon_species_eggGroupsBuilder() {
    GPokemonDetailData_pokemon_species_eggGroups._initializeBuilder(this);
  }

  GPokemonDetailData_pokemon_species_eggGroupsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _egggroup = $v.egggroup?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GPokemonDetailData_pokemon_species_eggGroups other) {
    _$v = other as _$GPokemonDetailData_pokemon_species_eggGroups;
  }

  @override
  void update(
      void Function(GPokemonDetailData_pokemon_species_eggGroupsBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  GPokemonDetailData_pokemon_species_eggGroups build() => _build();

  _$GPokemonDetailData_pokemon_species_eggGroups _build() {
    _$GPokemonDetailData_pokemon_species_eggGroups _$result;
    try {
      _$result = _$v ??
          _$GPokemonDetailData_pokemon_species_eggGroups._(
            G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
                r'GPokemonDetailData_pokemon_species_eggGroups', 'G__typename'),
            egggroup: _egggroup?.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'egggroup';
        _egggroup?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'GPokemonDetailData_pokemon_species_eggGroups',
            _$failedField,
            e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GPokemonDetailData_pokemon_species_eggGroups_egggroup
    extends GPokemonDetailData_pokemon_species_eggGroups_egggroup {
  @override
  final String G__typename;
  @override
  final int id;
  @override
  final String name;

  factory _$GPokemonDetailData_pokemon_species_eggGroups_egggroup(
          [void Function(
                  GPokemonDetailData_pokemon_species_eggGroups_egggroupBuilder)?
              updates]) =>
      (GPokemonDetailData_pokemon_species_eggGroups_egggroupBuilder()
            ..update(updates))
          ._build();

  _$GPokemonDetailData_pokemon_species_eggGroups_egggroup._(
      {required this.G__typename, required this.id, required this.name})
      : super._();
  @override
  GPokemonDetailData_pokemon_species_eggGroups_egggroup rebuild(
          void Function(
                  GPokemonDetailData_pokemon_species_eggGroups_egggroupBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GPokemonDetailData_pokemon_species_eggGroups_egggroupBuilder toBuilder() =>
      GPokemonDetailData_pokemon_species_eggGroups_egggroupBuilder()
        ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GPokemonDetailData_pokemon_species_eggGroups_egggroup &&
        G__typename == other.G__typename &&
        id == other.id &&
        name == other.name;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'GPokemonDetailData_pokemon_species_eggGroups_egggroup')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('name', name))
        .toString();
  }
}

class GPokemonDetailData_pokemon_species_eggGroups_egggroupBuilder
    implements
        Builder<GPokemonDetailData_pokemon_species_eggGroups_egggroup,
            GPokemonDetailData_pokemon_species_eggGroups_egggroupBuilder> {
  _$GPokemonDetailData_pokemon_species_eggGroups_egggroup? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  GPokemonDetailData_pokemon_species_eggGroups_egggroupBuilder() {
    GPokemonDetailData_pokemon_species_eggGroups_egggroup._initializeBuilder(
        this);
  }

  GPokemonDetailData_pokemon_species_eggGroups_egggroupBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _id = $v.id;
      _name = $v.name;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GPokemonDetailData_pokemon_species_eggGroups_egggroup other) {
    _$v = other as _$GPokemonDetailData_pokemon_species_eggGroups_egggroup;
  }

  @override
  void update(
      void Function(
              GPokemonDetailData_pokemon_species_eggGroups_egggroupBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  GPokemonDetailData_pokemon_species_eggGroups_egggroup build() => _build();

  _$GPokemonDetailData_pokemon_species_eggGroups_egggroup _build() {
    final _$result = _$v ??
        _$GPokemonDetailData_pokemon_species_eggGroups_egggroup._(
          G__typename: BuiltValueNullFieldError.checkNotNull(
              G__typename,
              r'GPokemonDetailData_pokemon_species_eggGroups_egggroup',
              'G__typename'),
          id: BuiltValueNullFieldError.checkNotNull(id,
              r'GPokemonDetailData_pokemon_species_eggGroups_egggroup', 'id'),
          name: BuiltValueNullFieldError.checkNotNull(name,
              r'GPokemonDetailData_pokemon_species_eggGroups_egggroup', 'name'),
        );
    replace(_$result);
    return _$result;
  }
}

class _$GPokemonDetailData_pokemon_species_variants
    extends GPokemonDetailData_pokemon_species_variants {
  @override
  final String G__typename;
  @override
  final int id;
  @override
  final String name;
  @override
  final bool is_default;

  factory _$GPokemonDetailData_pokemon_species_variants(
          [void Function(GPokemonDetailData_pokemon_species_variantsBuilder)?
              updates]) =>
      (GPokemonDetailData_pokemon_species_variantsBuilder()..update(updates))
          ._build();

  _$GPokemonDetailData_pokemon_species_variants._(
      {required this.G__typename,
      required this.id,
      required this.name,
      required this.is_default})
      : super._();
  @override
  GPokemonDetailData_pokemon_species_variants rebuild(
          void Function(GPokemonDetailData_pokemon_species_variantsBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GPokemonDetailData_pokemon_species_variantsBuilder toBuilder() =>
      GPokemonDetailData_pokemon_species_variantsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GPokemonDetailData_pokemon_species_variants &&
        G__typename == other.G__typename &&
        id == other.id &&
        name == other.name &&
        is_default == other.is_default;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, is_default.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'GPokemonDetailData_pokemon_species_variants')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('name', name)
          ..add('is_default', is_default))
        .toString();
  }
}

class GPokemonDetailData_pokemon_species_variantsBuilder
    implements
        Builder<GPokemonDetailData_pokemon_species_variants,
            GPokemonDetailData_pokemon_species_variantsBuilder> {
  _$GPokemonDetailData_pokemon_species_variants? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  bool? _is_default;
  bool? get is_default => _$this._is_default;
  set is_default(bool? is_default) => _$this._is_default = is_default;

  GPokemonDetailData_pokemon_species_variantsBuilder() {
    GPokemonDetailData_pokemon_species_variants._initializeBuilder(this);
  }

  GPokemonDetailData_pokemon_species_variantsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _id = $v.id;
      _name = $v.name;
      _is_default = $v.is_default;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GPokemonDetailData_pokemon_species_variants other) {
    _$v = other as _$GPokemonDetailData_pokemon_species_variants;
  }

  @override
  void update(
      void Function(GPokemonDetailData_pokemon_species_variantsBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  GPokemonDetailData_pokemon_species_variants build() => _build();

  _$GPokemonDetailData_pokemon_species_variants _build() {
    final _$result = _$v ??
        _$GPokemonDetailData_pokemon_species_variants._(
          G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
              r'GPokemonDetailData_pokemon_species_variants', 'G__typename'),
          id: BuiltValueNullFieldError.checkNotNull(
              id, r'GPokemonDetailData_pokemon_species_variants', 'id'),
          name: BuiltValueNullFieldError.checkNotNull(
              name, r'GPokemonDetailData_pokemon_species_variants', 'name'),
          is_default: BuiltValueNullFieldError.checkNotNull(is_default,
              r'GPokemonDetailData_pokemon_species_variants', 'is_default'),
        );
    replace(_$result);
    return _$result;
  }
}

class _$GPokemonDetailData_pokemon_species_evolutionChain
    extends GPokemonDetailData_pokemon_species_evolutionChain {
  @override
  final String G__typename;
  @override
  final BuiltList<GPokemonDetailData_pokemon_species_evolutionChain_species>
      species;

  factory _$GPokemonDetailData_pokemon_species_evolutionChain(
          [void Function(
                  GPokemonDetailData_pokemon_species_evolutionChainBuilder)?
              updates]) =>
      (GPokemonDetailData_pokemon_species_evolutionChainBuilder()
            ..update(updates))
          ._build();

  _$GPokemonDetailData_pokemon_species_evolutionChain._(
      {required this.G__typename, required this.species})
      : super._();
  @override
  GPokemonDetailData_pokemon_species_evolutionChain rebuild(
          void Function(
                  GPokemonDetailData_pokemon_species_evolutionChainBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GPokemonDetailData_pokemon_species_evolutionChainBuilder toBuilder() =>
      GPokemonDetailData_pokemon_species_evolutionChainBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GPokemonDetailData_pokemon_species_evolutionChain &&
        G__typename == other.G__typename &&
        species == other.species;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, species.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'GPokemonDetailData_pokemon_species_evolutionChain')
          ..add('G__typename', G__typename)
          ..add('species', species))
        .toString();
  }
}

class GPokemonDetailData_pokemon_species_evolutionChainBuilder
    implements
        Builder<GPokemonDetailData_pokemon_species_evolutionChain,
            GPokemonDetailData_pokemon_species_evolutionChainBuilder> {
  _$GPokemonDetailData_pokemon_species_evolutionChain? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  ListBuilder<GPokemonDetailData_pokemon_species_evolutionChain_species>?
      _species;
  ListBuilder<GPokemonDetailData_pokemon_species_evolutionChain_species>
      get species => _$this._species ??= ListBuilder<
          GPokemonDetailData_pokemon_species_evolutionChain_species>();
  set species(
          ListBuilder<
                  GPokemonDetailData_pokemon_species_evolutionChain_species>?
              species) =>
      _$this._species = species;

  GPokemonDetailData_pokemon_species_evolutionChainBuilder() {
    GPokemonDetailData_pokemon_species_evolutionChain._initializeBuilder(this);
  }

  GPokemonDetailData_pokemon_species_evolutionChainBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _species = $v.species.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GPokemonDetailData_pokemon_species_evolutionChain other) {
    _$v = other as _$GPokemonDetailData_pokemon_species_evolutionChain;
  }

  @override
  void update(
      void Function(GPokemonDetailData_pokemon_species_evolutionChainBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  GPokemonDetailData_pokemon_species_evolutionChain build() => _build();

  _$GPokemonDetailData_pokemon_species_evolutionChain _build() {
    _$GPokemonDetailData_pokemon_species_evolutionChain _$result;
    try {
      _$result = _$v ??
          _$GPokemonDetailData_pokemon_species_evolutionChain._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename,
                r'GPokemonDetailData_pokemon_species_evolutionChain',
                'G__typename'),
            species: species.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'species';
        species.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'GPokemonDetailData_pokemon_species_evolutionChain',
            _$failedField,
            e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GPokemonDetailData_pokemon_species_evolutionChain_species
    extends GPokemonDetailData_pokemon_species_evolutionChain_species {
  @override
  final String G__typename;
  @override
  final int id;
  @override
  final String name;
  @override
  final int? evolves_from_species_id;
  @override
  final BuiltList<
          GPokemonDetailData_pokemon_species_evolutionChain_species_evolutions>
      evolutions;

  factory _$GPokemonDetailData_pokemon_species_evolutionChain_species(
          [void Function(
                  GPokemonDetailData_pokemon_species_evolutionChain_speciesBuilder)?
              updates]) =>
      (GPokemonDetailData_pokemon_species_evolutionChain_speciesBuilder()
            ..update(updates))
          ._build();

  _$GPokemonDetailData_pokemon_species_evolutionChain_species._(
      {required this.G__typename,
      required this.id,
      required this.name,
      this.evolves_from_species_id,
      required this.evolutions})
      : super._();
  @override
  GPokemonDetailData_pokemon_species_evolutionChain_species rebuild(
          void Function(
                  GPokemonDetailData_pokemon_species_evolutionChain_speciesBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GPokemonDetailData_pokemon_species_evolutionChain_speciesBuilder
      toBuilder() =>
          GPokemonDetailData_pokemon_species_evolutionChain_speciesBuilder()
            ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GPokemonDetailData_pokemon_species_evolutionChain_species &&
        G__typename == other.G__typename &&
        id == other.id &&
        name == other.name &&
        evolves_from_species_id == other.evolves_from_species_id &&
        evolutions == other.evolutions;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, evolves_from_species_id.hashCode);
    _$hash = $jc(_$hash, evolutions.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'GPokemonDetailData_pokemon_species_evolutionChain_species')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('name', name)
          ..add('evolves_from_species_id', evolves_from_species_id)
          ..add('evolutions', evolutions))
        .toString();
  }
}

class GPokemonDetailData_pokemon_species_evolutionChain_speciesBuilder
    implements
        Builder<GPokemonDetailData_pokemon_species_evolutionChain_species,
            GPokemonDetailData_pokemon_species_evolutionChain_speciesBuilder> {
  _$GPokemonDetailData_pokemon_species_evolutionChain_species? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  int? _evolves_from_species_id;
  int? get evolves_from_species_id => _$this._evolves_from_species_id;
  set evolves_from_species_id(int? evolves_from_species_id) =>
      _$this._evolves_from_species_id = evolves_from_species_id;

  ListBuilder<
          GPokemonDetailData_pokemon_species_evolutionChain_species_evolutions>?
      _evolutions;
  ListBuilder<
          GPokemonDetailData_pokemon_species_evolutionChain_species_evolutions>
      get evolutions => _$this._evolutions ??= ListBuilder<
          GPokemonDetailData_pokemon_species_evolutionChain_species_evolutions>();
  set evolutions(
          ListBuilder<
                  GPokemonDetailData_pokemon_species_evolutionChain_species_evolutions>?
              evolutions) =>
      _$this._evolutions = evolutions;

  GPokemonDetailData_pokemon_species_evolutionChain_speciesBuilder() {
    GPokemonDetailData_pokemon_species_evolutionChain_species
        ._initializeBuilder(this);
  }

  GPokemonDetailData_pokemon_species_evolutionChain_speciesBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _id = $v.id;
      _name = $v.name;
      _evolves_from_species_id = $v.evolves_from_species_id;
      _evolutions = $v.evolutions.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(
      GPokemonDetailData_pokemon_species_evolutionChain_species other) {
    _$v = other as _$GPokemonDetailData_pokemon_species_evolutionChain_species;
  }

  @override
  void update(
      void Function(
              GPokemonDetailData_pokemon_species_evolutionChain_speciesBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  GPokemonDetailData_pokemon_species_evolutionChain_species build() => _build();

  _$GPokemonDetailData_pokemon_species_evolutionChain_species _build() {
    _$GPokemonDetailData_pokemon_species_evolutionChain_species _$result;
    try {
      _$result = _$v ??
          _$GPokemonDetailData_pokemon_species_evolutionChain_species._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename,
                r'GPokemonDetailData_pokemon_species_evolutionChain_species',
                'G__typename'),
            id: BuiltValueNullFieldError.checkNotNull(
                id,
                r'GPokemonDetailData_pokemon_species_evolutionChain_species',
                'id'),
            name: BuiltValueNullFieldError.checkNotNull(
                name,
                r'GPokemonDetailData_pokemon_species_evolutionChain_species',
                'name'),
            evolves_from_species_id: evolves_from_species_id,
            evolutions: evolutions.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'evolutions';
        evolutions.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'GPokemonDetailData_pokemon_species_evolutionChain_species',
            _$failedField,
            e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GPokemonDetailData_pokemon_species_evolutionChain_species_evolutions
    extends GPokemonDetailData_pokemon_species_evolutionChain_species_evolutions {
  @override
  final String G__typename;
  @override
  final int? min_level;
  @override
  final String condition_expression;
  @override
  final GPokemonDetailData_pokemon_species_evolutionChain_species_evolutions_trigger?
      trigger;

  factory _$GPokemonDetailData_pokemon_species_evolutionChain_species_evolutions(
          [void Function(
                  GPokemonDetailData_pokemon_species_evolutionChain_species_evolutionsBuilder)?
              updates]) =>
      (GPokemonDetailData_pokemon_species_evolutionChain_species_evolutionsBuilder()
            ..update(updates))
          ._build();

  _$GPokemonDetailData_pokemon_species_evolutionChain_species_evolutions._(
      {required this.G__typename,
      this.min_level,
      required this.condition_expression,
      this.trigger})
      : super._();
  @override
  GPokemonDetailData_pokemon_species_evolutionChain_species_evolutions rebuild(
          void Function(
                  GPokemonDetailData_pokemon_species_evolutionChain_species_evolutionsBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GPokemonDetailData_pokemon_species_evolutionChain_species_evolutionsBuilder
      toBuilder() =>
          GPokemonDetailData_pokemon_species_evolutionChain_species_evolutionsBuilder()
            ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other
            is GPokemonDetailData_pokemon_species_evolutionChain_species_evolutions &&
        G__typename == other.G__typename &&
        min_level == other.min_level &&
        condition_expression == other.condition_expression &&
        trigger == other.trigger;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, min_level.hashCode);
    _$hash = $jc(_$hash, condition_expression.hashCode);
    _$hash = $jc(_$hash, trigger.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'GPokemonDetailData_pokemon_species_evolutionChain_species_evolutions')
          ..add('G__typename', G__typename)
          ..add('min_level', min_level)
          ..add('condition_expression', condition_expression)
          ..add('trigger', trigger))
        .toString();
  }
}

class GPokemonDetailData_pokemon_species_evolutionChain_species_evolutionsBuilder
    implements
        Builder<
            GPokemonDetailData_pokemon_species_evolutionChain_species_evolutions,
            GPokemonDetailData_pokemon_species_evolutionChain_species_evolutionsBuilder> {
  _$GPokemonDetailData_pokemon_species_evolutionChain_species_evolutions? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  int? _min_level;
  int? get min_level => _$this._min_level;
  set min_level(int? min_level) => _$this._min_level = min_level;

  String? _condition_expression;
  String? get condition_expression => _$this._condition_expression;
  set condition_expression(String? condition_expression) =>
      _$this._condition_expression = condition_expression;

  GPokemonDetailData_pokemon_species_evolutionChain_species_evolutions_triggerBuilder?
      _trigger;
  GPokemonDetailData_pokemon_species_evolutionChain_species_evolutions_triggerBuilder
      get trigger => _$this._trigger ??=
          GPokemonDetailData_pokemon_species_evolutionChain_species_evolutions_triggerBuilder();
  set trigger(
          GPokemonDetailData_pokemon_species_evolutionChain_species_evolutions_triggerBuilder?
              trigger) =>
      _$this._trigger = trigger;

  GPokemonDetailData_pokemon_species_evolutionChain_species_evolutionsBuilder() {
    GPokemonDetailData_pokemon_species_evolutionChain_species_evolutions
        ._initializeBuilder(this);
  }

  GPokemonDetailData_pokemon_species_evolutionChain_species_evolutionsBuilder
      get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _min_level = $v.min_level;
      _condition_expression = $v.condition_expression;
      _trigger = $v.trigger?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(
      GPokemonDetailData_pokemon_species_evolutionChain_species_evolutions
          other) {
    _$v = other
        as _$GPokemonDetailData_pokemon_species_evolutionChain_species_evolutions;
  }

  @override
  void update(
      void Function(
              GPokemonDetailData_pokemon_species_evolutionChain_species_evolutionsBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  GPokemonDetailData_pokemon_species_evolutionChain_species_evolutions
      build() => _build();

  _$GPokemonDetailData_pokemon_species_evolutionChain_species_evolutions
      _build() {
    _$GPokemonDetailData_pokemon_species_evolutionChain_species_evolutions
        _$result;
    try {
      _$result = _$v ??
          _$GPokemonDetailData_pokemon_species_evolutionChain_species_evolutions
              ._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename,
                r'GPokemonDetailData_pokemon_species_evolutionChain_species_evolutions',
                'G__typename'),
            min_level: min_level,
            condition_expression: BuiltValueNullFieldError.checkNotNull(
                condition_expression,
                r'GPokemonDetailData_pokemon_species_evolutionChain_species_evolutions',
                'condition_expression'),
            trigger: _trigger?.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'trigger';
        _trigger?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'GPokemonDetailData_pokemon_species_evolutionChain_species_evolutions',
            _$failedField,
            e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GPokemonDetailData_pokemon_species_evolutionChain_species_evolutions_trigger
    extends GPokemonDetailData_pokemon_species_evolutionChain_species_evolutions_trigger {
  @override
  final String G__typename;
  @override
  final String name;

  factory _$GPokemonDetailData_pokemon_species_evolutionChain_species_evolutions_trigger(
          [void Function(
                  GPokemonDetailData_pokemon_species_evolutionChain_species_evolutions_triggerBuilder)?
              updates]) =>
      (GPokemonDetailData_pokemon_species_evolutionChain_species_evolutions_triggerBuilder()
            ..update(updates))
          ._build();

  _$GPokemonDetailData_pokemon_species_evolutionChain_species_evolutions_trigger._(
      {required this.G__typename, required this.name})
      : super._();
  @override
  GPokemonDetailData_pokemon_species_evolutionChain_species_evolutions_trigger
      rebuild(
              void Function(
                      GPokemonDetailData_pokemon_species_evolutionChain_species_evolutions_triggerBuilder)
                  updates) =>
          (toBuilder()..update(updates)).build();

  @override
  GPokemonDetailData_pokemon_species_evolutionChain_species_evolutions_triggerBuilder
      toBuilder() =>
          GPokemonDetailData_pokemon_species_evolutionChain_species_evolutions_triggerBuilder()
            ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other
            is GPokemonDetailData_pokemon_species_evolutionChain_species_evolutions_trigger &&
        G__typename == other.G__typename &&
        name == other.name;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'GPokemonDetailData_pokemon_species_evolutionChain_species_evolutions_trigger')
          ..add('G__typename', G__typename)
          ..add('name', name))
        .toString();
  }
}

class GPokemonDetailData_pokemon_species_evolutionChain_species_evolutions_triggerBuilder
    implements
        Builder<
            GPokemonDetailData_pokemon_species_evolutionChain_species_evolutions_trigger,
            GPokemonDetailData_pokemon_species_evolutionChain_species_evolutions_triggerBuilder> {
  _$GPokemonDetailData_pokemon_species_evolutionChain_species_evolutions_trigger?
      _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  GPokemonDetailData_pokemon_species_evolutionChain_species_evolutions_triggerBuilder() {
    GPokemonDetailData_pokemon_species_evolutionChain_species_evolutions_trigger
        ._initializeBuilder(this);
  }

  GPokemonDetailData_pokemon_species_evolutionChain_species_evolutions_triggerBuilder
      get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _name = $v.name;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(
      GPokemonDetailData_pokemon_species_evolutionChain_species_evolutions_trigger
          other) {
    _$v = other
        as _$GPokemonDetailData_pokemon_species_evolutionChain_species_evolutions_trigger;
  }

  @override
  void update(
      void Function(
              GPokemonDetailData_pokemon_species_evolutionChain_species_evolutions_triggerBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  GPokemonDetailData_pokemon_species_evolutionChain_species_evolutions_trigger
      build() => _build();

  _$GPokemonDetailData_pokemon_species_evolutionChain_species_evolutions_trigger
      _build() {
    final _$result = _$v ??
        _$GPokemonDetailData_pokemon_species_evolutionChain_species_evolutions_trigger
            ._(
          G__typename: BuiltValueNullFieldError.checkNotNull(
              G__typename,
              r'GPokemonDetailData_pokemon_species_evolutionChain_species_evolutions_trigger',
              'G__typename'),
          name: BuiltValueNullFieldError.checkNotNull(
              name,
              r'GPokemonDetailData_pokemon_species_evolutionChain_species_evolutions_trigger',
              'name'),
        );
    replace(_$result);
    return _$result;
  }
}

class _$GPokemonDetailData_pokemon_types
    extends GPokemonDetailData_pokemon_types {
  @override
  final String G__typename;
  @override
  final int slot;
  @override
  final GPokemonDetailData_pokemon_types_type? type;

  factory _$GPokemonDetailData_pokemon_types(
          [void Function(GPokemonDetailData_pokemon_typesBuilder)? updates]) =>
      (GPokemonDetailData_pokemon_typesBuilder()..update(updates))._build();

  _$GPokemonDetailData_pokemon_types._(
      {required this.G__typename, required this.slot, this.type})
      : super._();
  @override
  GPokemonDetailData_pokemon_types rebuild(
          void Function(GPokemonDetailData_pokemon_typesBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GPokemonDetailData_pokemon_typesBuilder toBuilder() =>
      GPokemonDetailData_pokemon_typesBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GPokemonDetailData_pokemon_types &&
        G__typename == other.G__typename &&
        slot == other.slot &&
        type == other.type;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, slot.hashCode);
    _$hash = $jc(_$hash, type.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GPokemonDetailData_pokemon_types')
          ..add('G__typename', G__typename)
          ..add('slot', slot)
          ..add('type', type))
        .toString();
  }
}

class GPokemonDetailData_pokemon_typesBuilder
    implements
        Builder<GPokemonDetailData_pokemon_types,
            GPokemonDetailData_pokemon_typesBuilder> {
  _$GPokemonDetailData_pokemon_types? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  int? _slot;
  int? get slot => _$this._slot;
  set slot(int? slot) => _$this._slot = slot;

  GPokemonDetailData_pokemon_types_typeBuilder? _type;
  GPokemonDetailData_pokemon_types_typeBuilder get type =>
      _$this._type ??= GPokemonDetailData_pokemon_types_typeBuilder();
  set type(GPokemonDetailData_pokemon_types_typeBuilder? type) =>
      _$this._type = type;

  GPokemonDetailData_pokemon_typesBuilder() {
    GPokemonDetailData_pokemon_types._initializeBuilder(this);
  }

  GPokemonDetailData_pokemon_typesBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _slot = $v.slot;
      _type = $v.type?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GPokemonDetailData_pokemon_types other) {
    _$v = other as _$GPokemonDetailData_pokemon_types;
  }

  @override
  void update(void Function(GPokemonDetailData_pokemon_typesBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GPokemonDetailData_pokemon_types build() => _build();

  _$GPokemonDetailData_pokemon_types _build() {
    _$GPokemonDetailData_pokemon_types _$result;
    try {
      _$result = _$v ??
          _$GPokemonDetailData_pokemon_types._(
            G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
                r'GPokemonDetailData_pokemon_types', 'G__typename'),
            slot: BuiltValueNullFieldError.checkNotNull(
                slot, r'GPokemonDetailData_pokemon_types', 'slot'),
            type: _type?.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'type';
        _type?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'GPokemonDetailData_pokemon_types', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GPokemonDetailData_pokemon_types_type
    extends GPokemonDetailData_pokemon_types_type {
  @override
  final String G__typename;
  @override
  final int id;
  @override
  final String name;

  factory _$GPokemonDetailData_pokemon_types_type(
          [void Function(GPokemonDetailData_pokemon_types_typeBuilder)?
              updates]) =>
      (GPokemonDetailData_pokemon_types_typeBuilder()..update(updates))
          ._build();

  _$GPokemonDetailData_pokemon_types_type._(
      {required this.G__typename, required this.id, required this.name})
      : super._();
  @override
  GPokemonDetailData_pokemon_types_type rebuild(
          void Function(GPokemonDetailData_pokemon_types_typeBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GPokemonDetailData_pokemon_types_typeBuilder toBuilder() =>
      GPokemonDetailData_pokemon_types_typeBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GPokemonDetailData_pokemon_types_type &&
        G__typename == other.G__typename &&
        id == other.id &&
        name == other.name;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'GPokemonDetailData_pokemon_types_type')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('name', name))
        .toString();
  }
}

class GPokemonDetailData_pokemon_types_typeBuilder
    implements
        Builder<GPokemonDetailData_pokemon_types_type,
            GPokemonDetailData_pokemon_types_typeBuilder> {
  _$GPokemonDetailData_pokemon_types_type? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  GPokemonDetailData_pokemon_types_typeBuilder() {
    GPokemonDetailData_pokemon_types_type._initializeBuilder(this);
  }

  GPokemonDetailData_pokemon_types_typeBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _id = $v.id;
      _name = $v.name;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GPokemonDetailData_pokemon_types_type other) {
    _$v = other as _$GPokemonDetailData_pokemon_types_type;
  }

  @override
  void update(
      void Function(GPokemonDetailData_pokemon_types_typeBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GPokemonDetailData_pokemon_types_type build() => _build();

  _$GPokemonDetailData_pokemon_types_type _build() {
    final _$result = _$v ??
        _$GPokemonDetailData_pokemon_types_type._(
          G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
              r'GPokemonDetailData_pokemon_types_type', 'G__typename'),
          id: BuiltValueNullFieldError.checkNotNull(
              id, r'GPokemonDetailData_pokemon_types_type', 'id'),
          name: BuiltValueNullFieldError.checkNotNull(
              name, r'GPokemonDetailData_pokemon_types_type', 'name'),
        );
    replace(_$result);
    return _$result;
  }
}

class _$GPokemonDetailData_pokemon_sprites
    extends GPokemonDetailData_pokemon_sprites {
  @override
  final String G__typename;
  @override
  final _i2.Gjsonb artwork;
  @override
  final _i2.Gjsonb front;
  @override
  final _i2.Gjsonb shinyArtwork;
  @override
  final _i2.Gjsonb shinyFront;

  factory _$GPokemonDetailData_pokemon_sprites(
          [void Function(GPokemonDetailData_pokemon_spritesBuilder)?
              updates]) =>
      (GPokemonDetailData_pokemon_spritesBuilder()..update(updates))._build();

  _$GPokemonDetailData_pokemon_sprites._(
      {required this.G__typename,
      required this.artwork,
      required this.front,
      required this.shinyArtwork,
      required this.shinyFront})
      : super._();
  @override
  GPokemonDetailData_pokemon_sprites rebuild(
          void Function(GPokemonDetailData_pokemon_spritesBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GPokemonDetailData_pokemon_spritesBuilder toBuilder() =>
      GPokemonDetailData_pokemon_spritesBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GPokemonDetailData_pokemon_sprites &&
        G__typename == other.G__typename &&
        artwork == other.artwork &&
        front == other.front &&
        shinyArtwork == other.shinyArtwork &&
        shinyFront == other.shinyFront;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, artwork.hashCode);
    _$hash = $jc(_$hash, front.hashCode);
    _$hash = $jc(_$hash, shinyArtwork.hashCode);
    _$hash = $jc(_$hash, shinyFront.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GPokemonDetailData_pokemon_sprites')
          ..add('G__typename', G__typename)
          ..add('artwork', artwork)
          ..add('front', front)
          ..add('shinyArtwork', shinyArtwork)
          ..add('shinyFront', shinyFront))
        .toString();
  }
}

class GPokemonDetailData_pokemon_spritesBuilder
    implements
        Builder<GPokemonDetailData_pokemon_sprites,
            GPokemonDetailData_pokemon_spritesBuilder> {
  _$GPokemonDetailData_pokemon_sprites? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  _i2.GjsonbBuilder? _artwork;
  _i2.GjsonbBuilder get artwork => _$this._artwork ??= _i2.GjsonbBuilder();
  set artwork(_i2.GjsonbBuilder? artwork) => _$this._artwork = artwork;

  _i2.GjsonbBuilder? _front;
  _i2.GjsonbBuilder get front => _$this._front ??= _i2.GjsonbBuilder();
  set front(_i2.GjsonbBuilder? front) => _$this._front = front;

  _i2.GjsonbBuilder? _shinyArtwork;
  _i2.GjsonbBuilder get shinyArtwork =>
      _$this._shinyArtwork ??= _i2.GjsonbBuilder();
  set shinyArtwork(_i2.GjsonbBuilder? shinyArtwork) =>
      _$this._shinyArtwork = shinyArtwork;

  _i2.GjsonbBuilder? _shinyFront;
  _i2.GjsonbBuilder get shinyFront =>
      _$this._shinyFront ??= _i2.GjsonbBuilder();
  set shinyFront(_i2.GjsonbBuilder? shinyFront) =>
      _$this._shinyFront = shinyFront;

  GPokemonDetailData_pokemon_spritesBuilder() {
    GPokemonDetailData_pokemon_sprites._initializeBuilder(this);
  }

  GPokemonDetailData_pokemon_spritesBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _artwork = $v.artwork.toBuilder();
      _front = $v.front.toBuilder();
      _shinyArtwork = $v.shinyArtwork.toBuilder();
      _shinyFront = $v.shinyFront.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GPokemonDetailData_pokemon_sprites other) {
    _$v = other as _$GPokemonDetailData_pokemon_sprites;
  }

  @override
  void update(
      void Function(GPokemonDetailData_pokemon_spritesBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GPokemonDetailData_pokemon_sprites build() => _build();

  _$GPokemonDetailData_pokemon_sprites _build() {
    _$GPokemonDetailData_pokemon_sprites _$result;
    try {
      _$result = _$v ??
          _$GPokemonDetailData_pokemon_sprites._(
            G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
                r'GPokemonDetailData_pokemon_sprites', 'G__typename'),
            artwork: artwork.build(),
            front: front.build(),
            shinyArtwork: shinyArtwork.build(),
            shinyFront: shinyFront.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'artwork';
        artwork.build();
        _$failedField = 'front';
        front.build();
        _$failedField = 'shinyArtwork';
        shinyArtwork.build();
        _$failedField = 'shinyFront';
        shinyFront.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'GPokemonDetailData_pokemon_sprites', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GPokemonDetailData_pokemon_stats
    extends GPokemonDetailData_pokemon_stats {
  @override
  final String G__typename;
  @override
  final int base_stat;
  @override
  final GPokemonDetailData_pokemon_stats_stat? stat;

  factory _$GPokemonDetailData_pokemon_stats(
          [void Function(GPokemonDetailData_pokemon_statsBuilder)? updates]) =>
      (GPokemonDetailData_pokemon_statsBuilder()..update(updates))._build();

  _$GPokemonDetailData_pokemon_stats._(
      {required this.G__typename, required this.base_stat, this.stat})
      : super._();
  @override
  GPokemonDetailData_pokemon_stats rebuild(
          void Function(GPokemonDetailData_pokemon_statsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GPokemonDetailData_pokemon_statsBuilder toBuilder() =>
      GPokemonDetailData_pokemon_statsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GPokemonDetailData_pokemon_stats &&
        G__typename == other.G__typename &&
        base_stat == other.base_stat &&
        stat == other.stat;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, base_stat.hashCode);
    _$hash = $jc(_$hash, stat.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GPokemonDetailData_pokemon_stats')
          ..add('G__typename', G__typename)
          ..add('base_stat', base_stat)
          ..add('stat', stat))
        .toString();
  }
}

class GPokemonDetailData_pokemon_statsBuilder
    implements
        Builder<GPokemonDetailData_pokemon_stats,
            GPokemonDetailData_pokemon_statsBuilder> {
  _$GPokemonDetailData_pokemon_stats? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  int? _base_stat;
  int? get base_stat => _$this._base_stat;
  set base_stat(int? base_stat) => _$this._base_stat = base_stat;

  GPokemonDetailData_pokemon_stats_statBuilder? _stat;
  GPokemonDetailData_pokemon_stats_statBuilder get stat =>
      _$this._stat ??= GPokemonDetailData_pokemon_stats_statBuilder();
  set stat(GPokemonDetailData_pokemon_stats_statBuilder? stat) =>
      _$this._stat = stat;

  GPokemonDetailData_pokemon_statsBuilder() {
    GPokemonDetailData_pokemon_stats._initializeBuilder(this);
  }

  GPokemonDetailData_pokemon_statsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _base_stat = $v.base_stat;
      _stat = $v.stat?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GPokemonDetailData_pokemon_stats other) {
    _$v = other as _$GPokemonDetailData_pokemon_stats;
  }

  @override
  void update(void Function(GPokemonDetailData_pokemon_statsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GPokemonDetailData_pokemon_stats build() => _build();

  _$GPokemonDetailData_pokemon_stats _build() {
    _$GPokemonDetailData_pokemon_stats _$result;
    try {
      _$result = _$v ??
          _$GPokemonDetailData_pokemon_stats._(
            G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
                r'GPokemonDetailData_pokemon_stats', 'G__typename'),
            base_stat: BuiltValueNullFieldError.checkNotNull(
                base_stat, r'GPokemonDetailData_pokemon_stats', 'base_stat'),
            stat: _stat?.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'stat';
        _stat?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'GPokemonDetailData_pokemon_stats', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GPokemonDetailData_pokemon_stats_stat
    extends GPokemonDetailData_pokemon_stats_stat {
  @override
  final String G__typename;
  @override
  final int id;
  @override
  final String name;

  factory _$GPokemonDetailData_pokemon_stats_stat(
          [void Function(GPokemonDetailData_pokemon_stats_statBuilder)?
              updates]) =>
      (GPokemonDetailData_pokemon_stats_statBuilder()..update(updates))
          ._build();

  _$GPokemonDetailData_pokemon_stats_stat._(
      {required this.G__typename, required this.id, required this.name})
      : super._();
  @override
  GPokemonDetailData_pokemon_stats_stat rebuild(
          void Function(GPokemonDetailData_pokemon_stats_statBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GPokemonDetailData_pokemon_stats_statBuilder toBuilder() =>
      GPokemonDetailData_pokemon_stats_statBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GPokemonDetailData_pokemon_stats_stat &&
        G__typename == other.G__typename &&
        id == other.id &&
        name == other.name;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'GPokemonDetailData_pokemon_stats_stat')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('name', name))
        .toString();
  }
}

class GPokemonDetailData_pokemon_stats_statBuilder
    implements
        Builder<GPokemonDetailData_pokemon_stats_stat,
            GPokemonDetailData_pokemon_stats_statBuilder> {
  _$GPokemonDetailData_pokemon_stats_stat? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  GPokemonDetailData_pokemon_stats_statBuilder() {
    GPokemonDetailData_pokemon_stats_stat._initializeBuilder(this);
  }

  GPokemonDetailData_pokemon_stats_statBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _id = $v.id;
      _name = $v.name;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GPokemonDetailData_pokemon_stats_stat other) {
    _$v = other as _$GPokemonDetailData_pokemon_stats_stat;
  }

  @override
  void update(
      void Function(GPokemonDetailData_pokemon_stats_statBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GPokemonDetailData_pokemon_stats_stat build() => _build();

  _$GPokemonDetailData_pokemon_stats_stat _build() {
    final _$result = _$v ??
        _$GPokemonDetailData_pokemon_stats_stat._(
          G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
              r'GPokemonDetailData_pokemon_stats_stat', 'G__typename'),
          id: BuiltValueNullFieldError.checkNotNull(
              id, r'GPokemonDetailData_pokemon_stats_stat', 'id'),
          name: BuiltValueNullFieldError.checkNotNull(
              name, r'GPokemonDetailData_pokemon_stats_stat', 'name'),
        );
    replace(_$result);
    return _$result;
  }
}

class _$GPokemonDetailData_pokemon_abilities
    extends GPokemonDetailData_pokemon_abilities {
  @override
  final String G__typename;
  @override
  final int slot;
  @override
  final bool is_hidden;
  @override
  final GPokemonDetailData_pokemon_abilities_ability? ability;

  factory _$GPokemonDetailData_pokemon_abilities(
          [void Function(GPokemonDetailData_pokemon_abilitiesBuilder)?
              updates]) =>
      (GPokemonDetailData_pokemon_abilitiesBuilder()..update(updates))._build();

  _$GPokemonDetailData_pokemon_abilities._(
      {required this.G__typename,
      required this.slot,
      required this.is_hidden,
      this.ability})
      : super._();
  @override
  GPokemonDetailData_pokemon_abilities rebuild(
          void Function(GPokemonDetailData_pokemon_abilitiesBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GPokemonDetailData_pokemon_abilitiesBuilder toBuilder() =>
      GPokemonDetailData_pokemon_abilitiesBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GPokemonDetailData_pokemon_abilities &&
        G__typename == other.G__typename &&
        slot == other.slot &&
        is_hidden == other.is_hidden &&
        ability == other.ability;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, slot.hashCode);
    _$hash = $jc(_$hash, is_hidden.hashCode);
    _$hash = $jc(_$hash, ability.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GPokemonDetailData_pokemon_abilities')
          ..add('G__typename', G__typename)
          ..add('slot', slot)
          ..add('is_hidden', is_hidden)
          ..add('ability', ability))
        .toString();
  }
}

class GPokemonDetailData_pokemon_abilitiesBuilder
    implements
        Builder<GPokemonDetailData_pokemon_abilities,
            GPokemonDetailData_pokemon_abilitiesBuilder> {
  _$GPokemonDetailData_pokemon_abilities? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  int? _slot;
  int? get slot => _$this._slot;
  set slot(int? slot) => _$this._slot = slot;

  bool? _is_hidden;
  bool? get is_hidden => _$this._is_hidden;
  set is_hidden(bool? is_hidden) => _$this._is_hidden = is_hidden;

  GPokemonDetailData_pokemon_abilities_abilityBuilder? _ability;
  GPokemonDetailData_pokemon_abilities_abilityBuilder get ability =>
      _$this._ability ??= GPokemonDetailData_pokemon_abilities_abilityBuilder();
  set ability(GPokemonDetailData_pokemon_abilities_abilityBuilder? ability) =>
      _$this._ability = ability;

  GPokemonDetailData_pokemon_abilitiesBuilder() {
    GPokemonDetailData_pokemon_abilities._initializeBuilder(this);
  }

  GPokemonDetailData_pokemon_abilitiesBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _slot = $v.slot;
      _is_hidden = $v.is_hidden;
      _ability = $v.ability?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GPokemonDetailData_pokemon_abilities other) {
    _$v = other as _$GPokemonDetailData_pokemon_abilities;
  }

  @override
  void update(
      void Function(GPokemonDetailData_pokemon_abilitiesBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GPokemonDetailData_pokemon_abilities build() => _build();

  _$GPokemonDetailData_pokemon_abilities _build() {
    _$GPokemonDetailData_pokemon_abilities _$result;
    try {
      _$result = _$v ??
          _$GPokemonDetailData_pokemon_abilities._(
            G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
                r'GPokemonDetailData_pokemon_abilities', 'G__typename'),
            slot: BuiltValueNullFieldError.checkNotNull(
                slot, r'GPokemonDetailData_pokemon_abilities', 'slot'),
            is_hidden: BuiltValueNullFieldError.checkNotNull(is_hidden,
                r'GPokemonDetailData_pokemon_abilities', 'is_hidden'),
            ability: _ability?.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'ability';
        _ability?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'GPokemonDetailData_pokemon_abilities',
            _$failedField,
            e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GPokemonDetailData_pokemon_abilities_ability
    extends GPokemonDetailData_pokemon_abilities_ability {
  @override
  final String G__typename;
  @override
  final int id;
  @override
  final String name;
  @override
  final BuiltList<GPokemonDetailData_pokemon_abilities_ability_effects> effects;

  factory _$GPokemonDetailData_pokemon_abilities_ability(
          [void Function(GPokemonDetailData_pokemon_abilities_abilityBuilder)?
              updates]) =>
      (GPokemonDetailData_pokemon_abilities_abilityBuilder()..update(updates))
          ._build();

  _$GPokemonDetailData_pokemon_abilities_ability._(
      {required this.G__typename,
      required this.id,
      required this.name,
      required this.effects})
      : super._();
  @override
  GPokemonDetailData_pokemon_abilities_ability rebuild(
          void Function(GPokemonDetailData_pokemon_abilities_abilityBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GPokemonDetailData_pokemon_abilities_abilityBuilder toBuilder() =>
      GPokemonDetailData_pokemon_abilities_abilityBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GPokemonDetailData_pokemon_abilities_ability &&
        G__typename == other.G__typename &&
        id == other.id &&
        name == other.name &&
        effects == other.effects;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, effects.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'GPokemonDetailData_pokemon_abilities_ability')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('name', name)
          ..add('effects', effects))
        .toString();
  }
}

class GPokemonDetailData_pokemon_abilities_abilityBuilder
    implements
        Builder<GPokemonDetailData_pokemon_abilities_ability,
            GPokemonDetailData_pokemon_abilities_abilityBuilder> {
  _$GPokemonDetailData_pokemon_abilities_ability? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  ListBuilder<GPokemonDetailData_pokemon_abilities_ability_effects>? _effects;
  ListBuilder<GPokemonDetailData_pokemon_abilities_ability_effects>
      get effects => _$this._effects ??=
          ListBuilder<GPokemonDetailData_pokemon_abilities_ability_effects>();
  set effects(
          ListBuilder<GPokemonDetailData_pokemon_abilities_ability_effects>?
              effects) =>
      _$this._effects = effects;

  GPokemonDetailData_pokemon_abilities_abilityBuilder() {
    GPokemonDetailData_pokemon_abilities_ability._initializeBuilder(this);
  }

  GPokemonDetailData_pokemon_abilities_abilityBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _id = $v.id;
      _name = $v.name;
      _effects = $v.effects.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GPokemonDetailData_pokemon_abilities_ability other) {
    _$v = other as _$GPokemonDetailData_pokemon_abilities_ability;
  }

  @override
  void update(
      void Function(GPokemonDetailData_pokemon_abilities_abilityBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  GPokemonDetailData_pokemon_abilities_ability build() => _build();

  _$GPokemonDetailData_pokemon_abilities_ability _build() {
    _$GPokemonDetailData_pokemon_abilities_ability _$result;
    try {
      _$result = _$v ??
          _$GPokemonDetailData_pokemon_abilities_ability._(
            G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
                r'GPokemonDetailData_pokemon_abilities_ability', 'G__typename'),
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'GPokemonDetailData_pokemon_abilities_ability', 'id'),
            name: BuiltValueNullFieldError.checkNotNull(
                name, r'GPokemonDetailData_pokemon_abilities_ability', 'name'),
            effects: effects.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'effects';
        effects.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'GPokemonDetailData_pokemon_abilities_ability',
            _$failedField,
            e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GPokemonDetailData_pokemon_abilities_ability_effects
    extends GPokemonDetailData_pokemon_abilities_ability_effects {
  @override
  final String G__typename;
  @override
  final String effect;
  @override
  final String short_effect;

  factory _$GPokemonDetailData_pokemon_abilities_ability_effects(
          [void Function(
                  GPokemonDetailData_pokemon_abilities_ability_effectsBuilder)?
              updates]) =>
      (GPokemonDetailData_pokemon_abilities_ability_effectsBuilder()
            ..update(updates))
          ._build();

  _$GPokemonDetailData_pokemon_abilities_ability_effects._(
      {required this.G__typename,
      required this.effect,
      required this.short_effect})
      : super._();
  @override
  GPokemonDetailData_pokemon_abilities_ability_effects rebuild(
          void Function(
                  GPokemonDetailData_pokemon_abilities_ability_effectsBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GPokemonDetailData_pokemon_abilities_ability_effectsBuilder toBuilder() =>
      GPokemonDetailData_pokemon_abilities_ability_effectsBuilder()
        ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GPokemonDetailData_pokemon_abilities_ability_effects &&
        G__typename == other.G__typename &&
        effect == other.effect &&
        short_effect == other.short_effect;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, effect.hashCode);
    _$hash = $jc(_$hash, short_effect.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'GPokemonDetailData_pokemon_abilities_ability_effects')
          ..add('G__typename', G__typename)
          ..add('effect', effect)
          ..add('short_effect', short_effect))
        .toString();
  }
}

class GPokemonDetailData_pokemon_abilities_ability_effectsBuilder
    implements
        Builder<GPokemonDetailData_pokemon_abilities_ability_effects,
            GPokemonDetailData_pokemon_abilities_ability_effectsBuilder> {
  _$GPokemonDetailData_pokemon_abilities_ability_effects? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _effect;
  String? get effect => _$this._effect;
  set effect(String? effect) => _$this._effect = effect;

  String? _short_effect;
  String? get short_effect => _$this._short_effect;
  set short_effect(String? short_effect) => _$this._short_effect = short_effect;

  GPokemonDetailData_pokemon_abilities_ability_effectsBuilder() {
    GPokemonDetailData_pokemon_abilities_ability_effects._initializeBuilder(
        this);
  }

  GPokemonDetailData_pokemon_abilities_ability_effectsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _effect = $v.effect;
      _short_effect = $v.short_effect;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GPokemonDetailData_pokemon_abilities_ability_effects other) {
    _$v = other as _$GPokemonDetailData_pokemon_abilities_ability_effects;
  }

  @override
  void update(
      void Function(
              GPokemonDetailData_pokemon_abilities_ability_effectsBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  GPokemonDetailData_pokemon_abilities_ability_effects build() => _build();

  _$GPokemonDetailData_pokemon_abilities_ability_effects _build() {
    final _$result = _$v ??
        _$GPokemonDetailData_pokemon_abilities_ability_effects._(
          G__typename: BuiltValueNullFieldError.checkNotNull(
              G__typename,
              r'GPokemonDetailData_pokemon_abilities_ability_effects',
              'G__typename'),
          effect: BuiltValueNullFieldError.checkNotNull(
              effect,
              r'GPokemonDetailData_pokemon_abilities_ability_effects',
              'effect'),
          short_effect: BuiltValueNullFieldError.checkNotNull(
              short_effect,
              r'GPokemonDetailData_pokemon_abilities_ability_effects',
              'short_effect'),
        );
    replace(_$result);
    return _$result;
  }
}

class _$GPokemonDetailData_pokemon_moves
    extends GPokemonDetailData_pokemon_moves {
  @override
  final String G__typename;
  @override
  final int level;
  @override
  final GPokemonDetailData_pokemon_moves_move? move;
  @override
  final GPokemonDetailData_pokemon_moves_method? method;
  @override
  final GPokemonDetailData_pokemon_moves_versionGroup? versionGroup;

  factory _$GPokemonDetailData_pokemon_moves(
          [void Function(GPokemonDetailData_pokemon_movesBuilder)? updates]) =>
      (GPokemonDetailData_pokemon_movesBuilder()..update(updates))._build();

  _$GPokemonDetailData_pokemon_moves._(
      {required this.G__typename,
      required this.level,
      this.move,
      this.method,
      this.versionGroup})
      : super._();
  @override
  GPokemonDetailData_pokemon_moves rebuild(
          void Function(GPokemonDetailData_pokemon_movesBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GPokemonDetailData_pokemon_movesBuilder toBuilder() =>
      GPokemonDetailData_pokemon_movesBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GPokemonDetailData_pokemon_moves &&
        G__typename == other.G__typename &&
        level == other.level &&
        move == other.move &&
        method == other.method &&
        versionGroup == other.versionGroup;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, level.hashCode);
    _$hash = $jc(_$hash, move.hashCode);
    _$hash = $jc(_$hash, method.hashCode);
    _$hash = $jc(_$hash, versionGroup.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GPokemonDetailData_pokemon_moves')
          ..add('G__typename', G__typename)
          ..add('level', level)
          ..add('move', move)
          ..add('method', method)
          ..add('versionGroup', versionGroup))
        .toString();
  }
}

class GPokemonDetailData_pokemon_movesBuilder
    implements
        Builder<GPokemonDetailData_pokemon_moves,
            GPokemonDetailData_pokemon_movesBuilder> {
  _$GPokemonDetailData_pokemon_moves? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  int? _level;
  int? get level => _$this._level;
  set level(int? level) => _$this._level = level;

  GPokemonDetailData_pokemon_moves_moveBuilder? _move;
  GPokemonDetailData_pokemon_moves_moveBuilder get move =>
      _$this._move ??= GPokemonDetailData_pokemon_moves_moveBuilder();
  set move(GPokemonDetailData_pokemon_moves_moveBuilder? move) =>
      _$this._move = move;

  GPokemonDetailData_pokemon_moves_methodBuilder? _method;
  GPokemonDetailData_pokemon_moves_methodBuilder get method =>
      _$this._method ??= GPokemonDetailData_pokemon_moves_methodBuilder();
  set method(GPokemonDetailData_pokemon_moves_methodBuilder? method) =>
      _$this._method = method;

  GPokemonDetailData_pokemon_moves_versionGroupBuilder? _versionGroup;
  GPokemonDetailData_pokemon_moves_versionGroupBuilder get versionGroup =>
      _$this._versionGroup ??=
          GPokemonDetailData_pokemon_moves_versionGroupBuilder();
  set versionGroup(
          GPokemonDetailData_pokemon_moves_versionGroupBuilder? versionGroup) =>
      _$this._versionGroup = versionGroup;

  GPokemonDetailData_pokemon_movesBuilder() {
    GPokemonDetailData_pokemon_moves._initializeBuilder(this);
  }

  GPokemonDetailData_pokemon_movesBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _level = $v.level;
      _move = $v.move?.toBuilder();
      _method = $v.method?.toBuilder();
      _versionGroup = $v.versionGroup?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GPokemonDetailData_pokemon_moves other) {
    _$v = other as _$GPokemonDetailData_pokemon_moves;
  }

  @override
  void update(void Function(GPokemonDetailData_pokemon_movesBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GPokemonDetailData_pokemon_moves build() => _build();

  _$GPokemonDetailData_pokemon_moves _build() {
    _$GPokemonDetailData_pokemon_moves _$result;
    try {
      _$result = _$v ??
          _$GPokemonDetailData_pokemon_moves._(
            G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
                r'GPokemonDetailData_pokemon_moves', 'G__typename'),
            level: BuiltValueNullFieldError.checkNotNull(
                level, r'GPokemonDetailData_pokemon_moves', 'level'),
            move: _move?.build(),
            method: _method?.build(),
            versionGroup: _versionGroup?.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'move';
        _move?.build();
        _$failedField = 'method';
        _method?.build();
        _$failedField = 'versionGroup';
        _versionGroup?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'GPokemonDetailData_pokemon_moves', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GPokemonDetailData_pokemon_moves_move
    extends GPokemonDetailData_pokemon_moves_move {
  @override
  final String G__typename;
  @override
  final int id;
  @override
  final String name;

  factory _$GPokemonDetailData_pokemon_moves_move(
          [void Function(GPokemonDetailData_pokemon_moves_moveBuilder)?
              updates]) =>
      (GPokemonDetailData_pokemon_moves_moveBuilder()..update(updates))
          ._build();

  _$GPokemonDetailData_pokemon_moves_move._(
      {required this.G__typename, required this.id, required this.name})
      : super._();
  @override
  GPokemonDetailData_pokemon_moves_move rebuild(
          void Function(GPokemonDetailData_pokemon_moves_moveBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GPokemonDetailData_pokemon_moves_moveBuilder toBuilder() =>
      GPokemonDetailData_pokemon_moves_moveBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GPokemonDetailData_pokemon_moves_move &&
        G__typename == other.G__typename &&
        id == other.id &&
        name == other.name;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'GPokemonDetailData_pokemon_moves_move')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('name', name))
        .toString();
  }
}

class GPokemonDetailData_pokemon_moves_moveBuilder
    implements
        Builder<GPokemonDetailData_pokemon_moves_move,
            GPokemonDetailData_pokemon_moves_moveBuilder> {
  _$GPokemonDetailData_pokemon_moves_move? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  GPokemonDetailData_pokemon_moves_moveBuilder() {
    GPokemonDetailData_pokemon_moves_move._initializeBuilder(this);
  }

  GPokemonDetailData_pokemon_moves_moveBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _id = $v.id;
      _name = $v.name;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GPokemonDetailData_pokemon_moves_move other) {
    _$v = other as _$GPokemonDetailData_pokemon_moves_move;
  }

  @override
  void update(
      void Function(GPokemonDetailData_pokemon_moves_moveBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GPokemonDetailData_pokemon_moves_move build() => _build();

  _$GPokemonDetailData_pokemon_moves_move _build() {
    final _$result = _$v ??
        _$GPokemonDetailData_pokemon_moves_move._(
          G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
              r'GPokemonDetailData_pokemon_moves_move', 'G__typename'),
          id: BuiltValueNullFieldError.checkNotNull(
              id, r'GPokemonDetailData_pokemon_moves_move', 'id'),
          name: BuiltValueNullFieldError.checkNotNull(
              name, r'GPokemonDetailData_pokemon_moves_move', 'name'),
        );
    replace(_$result);
    return _$result;
  }
}

class _$GPokemonDetailData_pokemon_moves_method
    extends GPokemonDetailData_pokemon_moves_method {
  @override
  final String G__typename;
  @override
  final String name;

  factory _$GPokemonDetailData_pokemon_moves_method(
          [void Function(GPokemonDetailData_pokemon_moves_methodBuilder)?
              updates]) =>
      (GPokemonDetailData_pokemon_moves_methodBuilder()..update(updates))
          ._build();

  _$GPokemonDetailData_pokemon_moves_method._(
      {required this.G__typename, required this.name})
      : super._();
  @override
  GPokemonDetailData_pokemon_moves_method rebuild(
          void Function(GPokemonDetailData_pokemon_moves_methodBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GPokemonDetailData_pokemon_moves_methodBuilder toBuilder() =>
      GPokemonDetailData_pokemon_moves_methodBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GPokemonDetailData_pokemon_moves_method &&
        G__typename == other.G__typename &&
        name == other.name;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'GPokemonDetailData_pokemon_moves_method')
          ..add('G__typename', G__typename)
          ..add('name', name))
        .toString();
  }
}

class GPokemonDetailData_pokemon_moves_methodBuilder
    implements
        Builder<GPokemonDetailData_pokemon_moves_method,
            GPokemonDetailData_pokemon_moves_methodBuilder> {
  _$GPokemonDetailData_pokemon_moves_method? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  GPokemonDetailData_pokemon_moves_methodBuilder() {
    GPokemonDetailData_pokemon_moves_method._initializeBuilder(this);
  }

  GPokemonDetailData_pokemon_moves_methodBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _name = $v.name;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GPokemonDetailData_pokemon_moves_method other) {
    _$v = other as _$GPokemonDetailData_pokemon_moves_method;
  }

  @override
  void update(
      void Function(GPokemonDetailData_pokemon_moves_methodBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GPokemonDetailData_pokemon_moves_method build() => _build();

  _$GPokemonDetailData_pokemon_moves_method _build() {
    final _$result = _$v ??
        _$GPokemonDetailData_pokemon_moves_method._(
          G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
              r'GPokemonDetailData_pokemon_moves_method', 'G__typename'),
          name: BuiltValueNullFieldError.checkNotNull(
              name, r'GPokemonDetailData_pokemon_moves_method', 'name'),
        );
    replace(_$result);
    return _$result;
  }
}

class _$GPokemonDetailData_pokemon_moves_versionGroup
    extends GPokemonDetailData_pokemon_moves_versionGroup {
  @override
  final String G__typename;
  @override
  final String name;

  factory _$GPokemonDetailData_pokemon_moves_versionGroup(
          [void Function(GPokemonDetailData_pokemon_moves_versionGroupBuilder)?
              updates]) =>
      (GPokemonDetailData_pokemon_moves_versionGroupBuilder()..update(updates))
          ._build();

  _$GPokemonDetailData_pokemon_moves_versionGroup._(
      {required this.G__typename, required this.name})
      : super._();
  @override
  GPokemonDetailData_pokemon_moves_versionGroup rebuild(
          void Function(GPokemonDetailData_pokemon_moves_versionGroupBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GPokemonDetailData_pokemon_moves_versionGroupBuilder toBuilder() =>
      GPokemonDetailData_pokemon_moves_versionGroupBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GPokemonDetailData_pokemon_moves_versionGroup &&
        G__typename == other.G__typename &&
        name == other.name;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'GPokemonDetailData_pokemon_moves_versionGroup')
          ..add('G__typename', G__typename)
          ..add('name', name))
        .toString();
  }
}

class GPokemonDetailData_pokemon_moves_versionGroupBuilder
    implements
        Builder<GPokemonDetailData_pokemon_moves_versionGroup,
            GPokemonDetailData_pokemon_moves_versionGroupBuilder> {
  _$GPokemonDetailData_pokemon_moves_versionGroup? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  GPokemonDetailData_pokemon_moves_versionGroupBuilder() {
    GPokemonDetailData_pokemon_moves_versionGroup._initializeBuilder(this);
  }

  GPokemonDetailData_pokemon_moves_versionGroupBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _name = $v.name;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GPokemonDetailData_pokemon_moves_versionGroup other) {
    _$v = other as _$GPokemonDetailData_pokemon_moves_versionGroup;
  }

  @override
  void update(
      void Function(GPokemonDetailData_pokemon_moves_versionGroupBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  GPokemonDetailData_pokemon_moves_versionGroup build() => _build();

  _$GPokemonDetailData_pokemon_moves_versionGroup _build() {
    final _$result = _$v ??
        _$GPokemonDetailData_pokemon_moves_versionGroup._(
          G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
              r'GPokemonDetailData_pokemon_moves_versionGroup', 'G__typename'),
          name: BuiltValueNullFieldError.checkNotNull(
              name, r'GPokemonDetailData_pokemon_moves_versionGroup', 'name'),
        );
    replace(_$result);
    return _$result;
  }
}

class _$GPokemonDetailData_typeEfficacies
    extends GPokemonDetailData_typeEfficacies {
  @override
  final String G__typename;
  @override
  final int damage_factor;
  @override
  final GPokemonDetailData_typeEfficacies_attackingType? attackingType;
  @override
  final GPokemonDetailData_typeEfficacies_defendingType? defendingType;

  factory _$GPokemonDetailData_typeEfficacies(
          [void Function(GPokemonDetailData_typeEfficaciesBuilder)? updates]) =>
      (GPokemonDetailData_typeEfficaciesBuilder()..update(updates))._build();

  _$GPokemonDetailData_typeEfficacies._(
      {required this.G__typename,
      required this.damage_factor,
      this.attackingType,
      this.defendingType})
      : super._();
  @override
  GPokemonDetailData_typeEfficacies rebuild(
          void Function(GPokemonDetailData_typeEfficaciesBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GPokemonDetailData_typeEfficaciesBuilder toBuilder() =>
      GPokemonDetailData_typeEfficaciesBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GPokemonDetailData_typeEfficacies &&
        G__typename == other.G__typename &&
        damage_factor == other.damage_factor &&
        attackingType == other.attackingType &&
        defendingType == other.defendingType;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, damage_factor.hashCode);
    _$hash = $jc(_$hash, attackingType.hashCode);
    _$hash = $jc(_$hash, defendingType.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GPokemonDetailData_typeEfficacies')
          ..add('G__typename', G__typename)
          ..add('damage_factor', damage_factor)
          ..add('attackingType', attackingType)
          ..add('defendingType', defendingType))
        .toString();
  }
}

class GPokemonDetailData_typeEfficaciesBuilder
    implements
        Builder<GPokemonDetailData_typeEfficacies,
            GPokemonDetailData_typeEfficaciesBuilder> {
  _$GPokemonDetailData_typeEfficacies? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  int? _damage_factor;
  int? get damage_factor => _$this._damage_factor;
  set damage_factor(int? damage_factor) =>
      _$this._damage_factor = damage_factor;

  GPokemonDetailData_typeEfficacies_attackingTypeBuilder? _attackingType;
  GPokemonDetailData_typeEfficacies_attackingTypeBuilder get attackingType =>
      _$this._attackingType ??=
          GPokemonDetailData_typeEfficacies_attackingTypeBuilder();
  set attackingType(
          GPokemonDetailData_typeEfficacies_attackingTypeBuilder?
              attackingType) =>
      _$this._attackingType = attackingType;

  GPokemonDetailData_typeEfficacies_defendingTypeBuilder? _defendingType;
  GPokemonDetailData_typeEfficacies_defendingTypeBuilder get defendingType =>
      _$this._defendingType ??=
          GPokemonDetailData_typeEfficacies_defendingTypeBuilder();
  set defendingType(
          GPokemonDetailData_typeEfficacies_defendingTypeBuilder?
              defendingType) =>
      _$this._defendingType = defendingType;

  GPokemonDetailData_typeEfficaciesBuilder() {
    GPokemonDetailData_typeEfficacies._initializeBuilder(this);
  }

  GPokemonDetailData_typeEfficaciesBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _damage_factor = $v.damage_factor;
      _attackingType = $v.attackingType?.toBuilder();
      _defendingType = $v.defendingType?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GPokemonDetailData_typeEfficacies other) {
    _$v = other as _$GPokemonDetailData_typeEfficacies;
  }

  @override
  void update(
      void Function(GPokemonDetailData_typeEfficaciesBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GPokemonDetailData_typeEfficacies build() => _build();

  _$GPokemonDetailData_typeEfficacies _build() {
    _$GPokemonDetailData_typeEfficacies _$result;
    try {
      _$result = _$v ??
          _$GPokemonDetailData_typeEfficacies._(
            G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
                r'GPokemonDetailData_typeEfficacies', 'G__typename'),
            damage_factor: BuiltValueNullFieldError.checkNotNull(damage_factor,
                r'GPokemonDetailData_typeEfficacies', 'damage_factor'),
            attackingType: _attackingType?.build(),
            defendingType: _defendingType?.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'attackingType';
        _attackingType?.build();
        _$failedField = 'defendingType';
        _defendingType?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'GPokemonDetailData_typeEfficacies', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GPokemonDetailData_typeEfficacies_attackingType
    extends GPokemonDetailData_typeEfficacies_attackingType {
  @override
  final String G__typename;
  @override
  final int id;
  @override
  final String name;

  factory _$GPokemonDetailData_typeEfficacies_attackingType(
          [void Function(
                  GPokemonDetailData_typeEfficacies_attackingTypeBuilder)?
              updates]) =>
      (GPokemonDetailData_typeEfficacies_attackingTypeBuilder()
            ..update(updates))
          ._build();

  _$GPokemonDetailData_typeEfficacies_attackingType._(
      {required this.G__typename, required this.id, required this.name})
      : super._();
  @override
  GPokemonDetailData_typeEfficacies_attackingType rebuild(
          void Function(GPokemonDetailData_typeEfficacies_attackingTypeBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GPokemonDetailData_typeEfficacies_attackingTypeBuilder toBuilder() =>
      GPokemonDetailData_typeEfficacies_attackingTypeBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GPokemonDetailData_typeEfficacies_attackingType &&
        G__typename == other.G__typename &&
        id == other.id &&
        name == other.name;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'GPokemonDetailData_typeEfficacies_attackingType')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('name', name))
        .toString();
  }
}

class GPokemonDetailData_typeEfficacies_attackingTypeBuilder
    implements
        Builder<GPokemonDetailData_typeEfficacies_attackingType,
            GPokemonDetailData_typeEfficacies_attackingTypeBuilder> {
  _$GPokemonDetailData_typeEfficacies_attackingType? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  GPokemonDetailData_typeEfficacies_attackingTypeBuilder() {
    GPokemonDetailData_typeEfficacies_attackingType._initializeBuilder(this);
  }

  GPokemonDetailData_typeEfficacies_attackingTypeBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _id = $v.id;
      _name = $v.name;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GPokemonDetailData_typeEfficacies_attackingType other) {
    _$v = other as _$GPokemonDetailData_typeEfficacies_attackingType;
  }

  @override
  void update(
      void Function(GPokemonDetailData_typeEfficacies_attackingTypeBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  GPokemonDetailData_typeEfficacies_attackingType build() => _build();

  _$GPokemonDetailData_typeEfficacies_attackingType _build() {
    final _$result = _$v ??
        _$GPokemonDetailData_typeEfficacies_attackingType._(
          G__typename: BuiltValueNullFieldError.checkNotNull(
              G__typename,
              r'GPokemonDetailData_typeEfficacies_attackingType',
              'G__typename'),
          id: BuiltValueNullFieldError.checkNotNull(
              id, r'GPokemonDetailData_typeEfficacies_attackingType', 'id'),
          name: BuiltValueNullFieldError.checkNotNull(
              name, r'GPokemonDetailData_typeEfficacies_attackingType', 'name'),
        );
    replace(_$result);
    return _$result;
  }
}

class _$GPokemonDetailData_typeEfficacies_defendingType
    extends GPokemonDetailData_typeEfficacies_defendingType {
  @override
  final String G__typename;
  @override
  final int id;
  @override
  final String name;

  factory _$GPokemonDetailData_typeEfficacies_defendingType(
          [void Function(
                  GPokemonDetailData_typeEfficacies_defendingTypeBuilder)?
              updates]) =>
      (GPokemonDetailData_typeEfficacies_defendingTypeBuilder()
            ..update(updates))
          ._build();

  _$GPokemonDetailData_typeEfficacies_defendingType._(
      {required this.G__typename, required this.id, required this.name})
      : super._();
  @override
  GPokemonDetailData_typeEfficacies_defendingType rebuild(
          void Function(GPokemonDetailData_typeEfficacies_defendingTypeBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GPokemonDetailData_typeEfficacies_defendingTypeBuilder toBuilder() =>
      GPokemonDetailData_typeEfficacies_defendingTypeBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GPokemonDetailData_typeEfficacies_defendingType &&
        G__typename == other.G__typename &&
        id == other.id &&
        name == other.name;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'GPokemonDetailData_typeEfficacies_defendingType')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('name', name))
        .toString();
  }
}

class GPokemonDetailData_typeEfficacies_defendingTypeBuilder
    implements
        Builder<GPokemonDetailData_typeEfficacies_defendingType,
            GPokemonDetailData_typeEfficacies_defendingTypeBuilder> {
  _$GPokemonDetailData_typeEfficacies_defendingType? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  GPokemonDetailData_typeEfficacies_defendingTypeBuilder() {
    GPokemonDetailData_typeEfficacies_defendingType._initializeBuilder(this);
  }

  GPokemonDetailData_typeEfficacies_defendingTypeBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _id = $v.id;
      _name = $v.name;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GPokemonDetailData_typeEfficacies_defendingType other) {
    _$v = other as _$GPokemonDetailData_typeEfficacies_defendingType;
  }

  @override
  void update(
      void Function(GPokemonDetailData_typeEfficacies_defendingTypeBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  GPokemonDetailData_typeEfficacies_defendingType build() => _build();

  _$GPokemonDetailData_typeEfficacies_defendingType _build() {
    final _$result = _$v ??
        _$GPokemonDetailData_typeEfficacies_defendingType._(
          G__typename: BuiltValueNullFieldError.checkNotNull(
              G__typename,
              r'GPokemonDetailData_typeEfficacies_defendingType',
              'G__typename'),
          id: BuiltValueNullFieldError.checkNotNull(
              id, r'GPokemonDetailData_typeEfficacies_defendingType', 'id'),
          name: BuiltValueNullFieldError.checkNotNull(
              name, r'GPokemonDetailData_typeEfficacies_defendingType', 'name'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
