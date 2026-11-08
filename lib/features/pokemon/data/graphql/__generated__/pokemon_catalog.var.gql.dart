// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:pokedex/graphql/__generated__/serializers.gql.dart' as _i1;

part 'pokemon_catalog.var.gql.g.dart';

abstract class GPokemonCatalogVars
    implements Built<GPokemonCatalogVars, GPokemonCatalogVarsBuilder> {
  GPokemonCatalogVars._();

  factory GPokemonCatalogVars(
          [void Function(GPokemonCatalogVarsBuilder b) updates]) =
      _$GPokemonCatalogVars;

  int get limit;
  int get offset;
  static Serializer<GPokemonCatalogVars> get serializer =>
      _$gPokemonCatalogVarsSerializer;

  Map<String, dynamic> toJson() => (_i1.serializers.serializeWith(
        GPokemonCatalogVars.serializer,
        this,
      ) as Map<String, dynamic>);

  static GPokemonCatalogVars? fromJson(Map<String, dynamic> json) =>
      _i1.serializers.deserializeWith(
        GPokemonCatalogVars.serializer,
        json,
      );
}
