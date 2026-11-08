// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_catalog.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GPokemonCatalogVars> _$gPokemonCatalogVarsSerializer =
    _$GPokemonCatalogVarsSerializer();

class _$GPokemonCatalogVarsSerializer
    implements StructuredSerializer<GPokemonCatalogVars> {
  @override
  final Iterable<Type> types = const [
    GPokemonCatalogVars,
    _$GPokemonCatalogVars
  ];
  @override
  final String wireName = 'GPokemonCatalogVars';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GPokemonCatalogVars object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'limit',
      serializers.serialize(object.limit, specifiedType: const FullType(int)),
      'offset',
      serializers.serialize(object.offset, specifiedType: const FullType(int)),
    ];

    return result;
  }

  @override
  GPokemonCatalogVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = GPokemonCatalogVarsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'limit':
          result.limit = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'offset':
          result.offset = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
      }
    }

    return result.build();
  }
}

class _$GPokemonCatalogVars extends GPokemonCatalogVars {
  @override
  final int limit;
  @override
  final int offset;

  factory _$GPokemonCatalogVars(
          [void Function(GPokemonCatalogVarsBuilder)? updates]) =>
      (GPokemonCatalogVarsBuilder()..update(updates))._build();

  _$GPokemonCatalogVars._({required this.limit, required this.offset})
      : super._();
  @override
  GPokemonCatalogVars rebuild(
          void Function(GPokemonCatalogVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GPokemonCatalogVarsBuilder toBuilder() =>
      GPokemonCatalogVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GPokemonCatalogVars &&
        limit == other.limit &&
        offset == other.offset;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, limit.hashCode);
    _$hash = $jc(_$hash, offset.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GPokemonCatalogVars')
          ..add('limit', limit)
          ..add('offset', offset))
        .toString();
  }
}

class GPokemonCatalogVarsBuilder
    implements Builder<GPokemonCatalogVars, GPokemonCatalogVarsBuilder> {
  _$GPokemonCatalogVars? _$v;

  int? _limit;
  int? get limit => _$this._limit;
  set limit(int? limit) => _$this._limit = limit;

  int? _offset;
  int? get offset => _$this._offset;
  set offset(int? offset) => _$this._offset = offset;

  GPokemonCatalogVarsBuilder();

  GPokemonCatalogVarsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _limit = $v.limit;
      _offset = $v.offset;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GPokemonCatalogVars other) {
    _$v = other as _$GPokemonCatalogVars;
  }

  @override
  void update(void Function(GPokemonCatalogVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GPokemonCatalogVars build() => _build();

  _$GPokemonCatalogVars _build() {
    final _$result = _$v ??
        _$GPokemonCatalogVars._(
          limit: BuiltValueNullFieldError.checkNotNull(
              limit, r'GPokemonCatalogVars', 'limit'),
          offset: BuiltValueNullFieldError.checkNotNull(
              offset, r'GPokemonCatalogVars', 'offset'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
