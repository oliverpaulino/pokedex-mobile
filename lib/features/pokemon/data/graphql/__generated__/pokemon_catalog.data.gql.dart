// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:pokedex/graphql/__generated__/schema.schema.gql.dart' as _i2;
import 'package:pokedex/graphql/__generated__/serializers.gql.dart' as _i1;

part 'pokemon_catalog.data.gql.g.dart';

abstract class GPokemonCatalogData
    implements Built<GPokemonCatalogData, GPokemonCatalogDataBuilder> {
  GPokemonCatalogData._();

  factory GPokemonCatalogData(
          [void Function(GPokemonCatalogDataBuilder b) updates]) =
      _$GPokemonCatalogData;

  static void _initializeBuilder(GPokemonCatalogDataBuilder b) =>
      b..G__typename = 'query_root';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  BuiltList<GPokemonCatalogData_pokemon> get pokemon;
  GPokemonCatalogData_pokemon_aggregate get pokemon_aggregate;
  static Serializer<GPokemonCatalogData> get serializer =>
      _$gPokemonCatalogDataSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GPokemonCatalogData.serializer,
        this,
      ) as Map<String, dynamic>);

  static GPokemonCatalogData? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GPokemonCatalogData.serializer,
        json,
      );
}

abstract class GPokemonCatalogData_pokemon
    implements
        Built<GPokemonCatalogData_pokemon, GPokemonCatalogData_pokemonBuilder> {
  GPokemonCatalogData_pokemon._();

  factory GPokemonCatalogData_pokemon(
          [void Function(GPokemonCatalogData_pokemonBuilder b) updates]) =
      _$GPokemonCatalogData_pokemon;

  static void _initializeBuilder(GPokemonCatalogData_pokemonBuilder b) =>
      b..G__typename = 'pokemon';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  int get id;
  String get name;
  BuiltList<GPokemonCatalogData_pokemon_pokemontypes> get pokemontypes;
  BuiltList<GPokemonCatalogData_pokemon_pokemonsprites> get pokemonsprites;
  static Serializer<GPokemonCatalogData_pokemon> get serializer =>
      _$gPokemonCatalogDataPokemonSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GPokemonCatalogData_pokemon.serializer,
        this,
      ) as Map<String, dynamic>);

  static GPokemonCatalogData_pokemon? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GPokemonCatalogData_pokemon.serializer,
        json,
      );
}

abstract class GPokemonCatalogData_pokemon_pokemontypes
    implements
        Built<GPokemonCatalogData_pokemon_pokemontypes,
            GPokemonCatalogData_pokemon_pokemontypesBuilder> {
  GPokemonCatalogData_pokemon_pokemontypes._();

  factory GPokemonCatalogData_pokemon_pokemontypes(
      [void Function(GPokemonCatalogData_pokemon_pokemontypesBuilder b)
          updates]) = _$GPokemonCatalogData_pokemon_pokemontypes;

  static void _initializeBuilder(
          GPokemonCatalogData_pokemon_pokemontypesBuilder b) =>
      b..G__typename = 'pokemontype';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  int get slot;
  GPokemonCatalogData_pokemon_pokemontypes_type? get type;
  static Serializer<GPokemonCatalogData_pokemon_pokemontypes> get serializer =>
      _$gPokemonCatalogDataPokemonPokemontypesSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GPokemonCatalogData_pokemon_pokemontypes.serializer,
        this,
      ) as Map<String, dynamic>);

  static GPokemonCatalogData_pokemon_pokemontypes? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GPokemonCatalogData_pokemon_pokemontypes.serializer,
        json,
      );
}

abstract class GPokemonCatalogData_pokemon_pokemontypes_type
    implements
        Built<GPokemonCatalogData_pokemon_pokemontypes_type,
            GPokemonCatalogData_pokemon_pokemontypes_typeBuilder> {
  GPokemonCatalogData_pokemon_pokemontypes_type._();

  factory GPokemonCatalogData_pokemon_pokemontypes_type(
      [void Function(GPokemonCatalogData_pokemon_pokemontypes_typeBuilder b)
          updates]) = _$GPokemonCatalogData_pokemon_pokemontypes_type;

  static void _initializeBuilder(
          GPokemonCatalogData_pokemon_pokemontypes_typeBuilder b) =>
      b..G__typename = 'type';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  int get id;
  String get name;
  static Serializer<GPokemonCatalogData_pokemon_pokemontypes_type>
      get serializer => _$gPokemonCatalogDataPokemonPokemontypesTypeSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GPokemonCatalogData_pokemon_pokemontypes_type.serializer,
        this,
      ) as Map<String, dynamic>);

  static GPokemonCatalogData_pokemon_pokemontypes_type? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GPokemonCatalogData_pokemon_pokemontypes_type.serializer,
        json,
      );
}

abstract class GPokemonCatalogData_pokemon_pokemonsprites
    implements
        Built<GPokemonCatalogData_pokemon_pokemonsprites,
            GPokemonCatalogData_pokemon_pokemonspritesBuilder> {
  GPokemonCatalogData_pokemon_pokemonsprites._();

  factory GPokemonCatalogData_pokemon_pokemonsprites(
      [void Function(GPokemonCatalogData_pokemon_pokemonspritesBuilder b)
          updates]) = _$GPokemonCatalogData_pokemon_pokemonsprites;

  static void _initializeBuilder(
          GPokemonCatalogData_pokemon_pokemonspritesBuilder b) =>
      b..G__typename = 'pokemonsprites';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  _i2.Gjsonb get artwork;
  _i2.Gjsonb get front;
  static Serializer<GPokemonCatalogData_pokemon_pokemonsprites>
      get serializer => _$gPokemonCatalogDataPokemonPokemonspritesSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GPokemonCatalogData_pokemon_pokemonsprites.serializer,
        this,
      ) as Map<String, dynamic>);

  static GPokemonCatalogData_pokemon_pokemonsprites? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GPokemonCatalogData_pokemon_pokemonsprites.serializer,
        json,
      );
}

abstract class GPokemonCatalogData_pokemon_aggregate
    implements
        Built<GPokemonCatalogData_pokemon_aggregate,
            GPokemonCatalogData_pokemon_aggregateBuilder> {
  GPokemonCatalogData_pokemon_aggregate._();

  factory GPokemonCatalogData_pokemon_aggregate(
      [void Function(GPokemonCatalogData_pokemon_aggregateBuilder b)
          updates]) = _$GPokemonCatalogData_pokemon_aggregate;

  static void _initializeBuilder(
          GPokemonCatalogData_pokemon_aggregateBuilder b) =>
      b..G__typename = 'pokemon_aggregate';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  GPokemonCatalogData_pokemon_aggregate_aggregate? get aggregate;
  static Serializer<GPokemonCatalogData_pokemon_aggregate> get serializer =>
      _$gPokemonCatalogDataPokemonAggregateSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GPokemonCatalogData_pokemon_aggregate.serializer,
        this,
      ) as Map<String, dynamic>);

  static GPokemonCatalogData_pokemon_aggregate? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GPokemonCatalogData_pokemon_aggregate.serializer,
        json,
      );
}

abstract class GPokemonCatalogData_pokemon_aggregate_aggregate
    implements
        Built<GPokemonCatalogData_pokemon_aggregate_aggregate,
            GPokemonCatalogData_pokemon_aggregate_aggregateBuilder> {
  GPokemonCatalogData_pokemon_aggregate_aggregate._();

  factory GPokemonCatalogData_pokemon_aggregate_aggregate(
      [void Function(GPokemonCatalogData_pokemon_aggregate_aggregateBuilder b)
          updates]) = _$GPokemonCatalogData_pokemon_aggregate_aggregate;

  static void _initializeBuilder(
          GPokemonCatalogData_pokemon_aggregate_aggregateBuilder b) =>
      b..G__typename = 'pokemon_aggregate_fields';

  @BuiltValueField(wireName: '__typename')
  String get G__typename;
  int get count;
  static Serializer<GPokemonCatalogData_pokemon_aggregate_aggregate>
      get serializer =>
          _$gPokemonCatalogDataPokemonAggregateAggregateSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GPokemonCatalogData_pokemon_aggregate_aggregate.serializer,
        this,
      ) as Map<String, dynamic>);

  static GPokemonCatalogData_pokemon_aggregate_aggregate? fromJson(
          Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GPokemonCatalogData_pokemon_aggregate_aggregate.serializer,
        json,
      );
}
