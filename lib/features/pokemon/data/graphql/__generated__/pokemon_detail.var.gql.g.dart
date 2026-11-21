// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_detail.var.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GPokemonDetailVars> _$gPokemonDetailVarsSerializer =
    _$GPokemonDetailVarsSerializer();

class _$GPokemonDetailVarsSerializer
    implements StructuredSerializer<GPokemonDetailVars> {
  @override
  final Iterable<Type> types = const [GPokemonDetailVars, _$GPokemonDetailVars];
  @override
  final String wireName = 'GPokemonDetailVars';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GPokemonDetailVars object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(int)),
      'versionGroups',
      serializers.serialize(object.versionGroups,
          specifiedType:
              const FullType(BuiltList, const [const FullType(String)])),
    ];

    return result;
  }

  @override
  GPokemonDetailVars deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = GPokemonDetailVarsBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
        case 'versionGroups':
          result.versionGroups.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$GPokemonDetailVars extends GPokemonDetailVars {
  @override
  final int id;
  @override
  final BuiltList<String> versionGroups;

  factory _$GPokemonDetailVars(
          [void Function(GPokemonDetailVarsBuilder)? updates]) =>
      (GPokemonDetailVarsBuilder()..update(updates))._build();

  _$GPokemonDetailVars._({required this.id, required this.versionGroups})
      : super._();
  @override
  GPokemonDetailVars rebuild(
          void Function(GPokemonDetailVarsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GPokemonDetailVarsBuilder toBuilder() =>
      GPokemonDetailVarsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GPokemonDetailVars &&
        id == other.id &&
        versionGroups == other.versionGroups;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, versionGroups.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GPokemonDetailVars')
          ..add('id', id)
          ..add('versionGroups', versionGroups))
        .toString();
  }
}

class GPokemonDetailVarsBuilder
    implements Builder<GPokemonDetailVars, GPokemonDetailVarsBuilder> {
  _$GPokemonDetailVars? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  ListBuilder<String>? _versionGroups;
  ListBuilder<String> get versionGroups =>
      _$this._versionGroups ??= ListBuilder<String>();
  set versionGroups(ListBuilder<String>? versionGroups) =>
      _$this._versionGroups = versionGroups;

  GPokemonDetailVarsBuilder();

  GPokemonDetailVarsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _versionGroups = $v.versionGroups.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GPokemonDetailVars other) {
    _$v = other as _$GPokemonDetailVars;
  }

  @override
  void update(void Function(GPokemonDetailVarsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GPokemonDetailVars build() => _build();

  _$GPokemonDetailVars _build() {
    _$GPokemonDetailVars _$result;
    try {
      _$result = _$v ??
          _$GPokemonDetailVars._(
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'GPokemonDetailVars', 'id'),
            versionGroups: versionGroups.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'versionGroups';
        versionGroups.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'GPokemonDetailVars', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
