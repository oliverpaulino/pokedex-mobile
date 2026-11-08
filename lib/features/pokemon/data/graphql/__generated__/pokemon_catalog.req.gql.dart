// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:ferry_exec/ferry_exec.dart' as _i1;
import 'package:gql_exec/gql_exec.dart' as _i4;
import 'package:pokedex/features/pokemon/data/graphql/__generated__/pokemon_catalog.ast.gql.dart'
    as _i5;
import 'package:pokedex/features/pokemon/data/graphql/__generated__/pokemon_catalog.data.gql.dart'
    as _i2;
import 'package:pokedex/features/pokemon/data/graphql/__generated__/pokemon_catalog.var.gql.dart'
    as _i3;
import 'package:pokedex/graphql/__generated__/serializers.gql.dart' as _i6;

part 'pokemon_catalog.req.gql.g.dart';

abstract class GPokemonCatalogReq
    implements
        Built<GPokemonCatalogReq, GPokemonCatalogReqBuilder>,
        _i1.OperationRequest<_i2.GPokemonCatalogData, _i3.GPokemonCatalogVars> {
  GPokemonCatalogReq._();

  factory GPokemonCatalogReq(
          [void Function(GPokemonCatalogReqBuilder b) updates]) =
      _$GPokemonCatalogReq;

  static void _initializeBuilder(GPokemonCatalogReqBuilder b) => b
    ..operation = _i4.Operation(
      document: _i5.document,
      operationName: 'PokemonCatalog',
    )
    ..executeOnListen = true;

  @override
  _i3.GPokemonCatalogVars get vars;
  @override
  _i4.Operation get operation;
  @override
  _i4.Request get execRequest => _i4.Request(
        operation: operation,
        variables: vars.toJson(),
        context: context ?? const _i4.Context(),
      );

  @override
  String? get requestId;
  @override
  @BuiltValueField(serialize: false)
  _i2.GPokemonCatalogData? Function(
    _i2.GPokemonCatalogData?,
    _i2.GPokemonCatalogData?,
  )? get updateResult;
  @override
  _i2.GPokemonCatalogData? get optimisticResponse;
  @override
  String? get updateCacheHandlerKey;
  @override
  Map<String, dynamic>? get updateCacheHandlerContext;
  @override
  _i1.FetchPolicy? get fetchPolicy;
  @override
  bool get executeOnListen;
  @override
  @BuiltValueField(serialize: false)
  _i4.Context? get context;
  @override
  _i2.GPokemonCatalogData? parseData(Map<String, dynamic> json) =>
      _i2.GPokemonCatalogData.fromJson(json);

  @override
  Map<String, dynamic> varsToJson() => vars.toJson();

  @override
  Map<String, dynamic> dataToJson(_i2.GPokemonCatalogData data) =>
      data.toJson();

  @override
  _i1.OperationRequest<_i2.GPokemonCatalogData, _i3.GPokemonCatalogVars>
      transformOperation(_i4.Operation Function(_i4.Operation) transform) =>
          this.rebuild((b) => b..operation = transform(operation));

  static Serializer<GPokemonCatalogReq> get serializer =>
      _$gPokemonCatalogReqSerializer;

  Map<String, dynamic> toJson() => (_i6.serializers.serializeWith(
        GPokemonCatalogReq.serializer,
        this,
      ) as Map<String, dynamic>);

  static GPokemonCatalogReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(
        GPokemonCatalogReq.serializer,
        json,
      );
}
