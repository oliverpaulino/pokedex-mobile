// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_catalog.data.gql.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<GPokemonCatalogData> _$gPokemonCatalogDataSerializer =
    _$GPokemonCatalogDataSerializer();
Serializer<GPokemonCatalogData_pokemon> _$gPokemonCatalogDataPokemonSerializer =
    _$GPokemonCatalogData_pokemonSerializer();
Serializer<GPokemonCatalogData_pokemon_pokemontypes>
    _$gPokemonCatalogDataPokemonPokemontypesSerializer =
    _$GPokemonCatalogData_pokemon_pokemontypesSerializer();
Serializer<GPokemonCatalogData_pokemon_pokemontypes_type>
    _$gPokemonCatalogDataPokemonPokemontypesTypeSerializer =
    _$GPokemonCatalogData_pokemon_pokemontypes_typeSerializer();
Serializer<GPokemonCatalogData_pokemon_pokemonsprites>
    _$gPokemonCatalogDataPokemonPokemonspritesSerializer =
    _$GPokemonCatalogData_pokemon_pokemonspritesSerializer();
Serializer<GPokemonCatalogData_pokemon_aggregate>
    _$gPokemonCatalogDataPokemonAggregateSerializer =
    _$GPokemonCatalogData_pokemon_aggregateSerializer();
Serializer<GPokemonCatalogData_pokemon_aggregate_aggregate>
    _$gPokemonCatalogDataPokemonAggregateAggregateSerializer =
    _$GPokemonCatalogData_pokemon_aggregate_aggregateSerializer();

class _$GPokemonCatalogDataSerializer
    implements StructuredSerializer<GPokemonCatalogData> {
  @override
  final Iterable<Type> types = const [
    GPokemonCatalogData,
    _$GPokemonCatalogData
  ];
  @override
  final String wireName = 'GPokemonCatalogData';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GPokemonCatalogData object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'pokemon',
      serializers.serialize(object.pokemon,
          specifiedType: const FullType(
              BuiltList, const [const FullType(GPokemonCatalogData_pokemon)])),
      'pokemon_aggregate',
      serializers.serialize(object.pokemon_aggregate,
          specifiedType: const FullType(GPokemonCatalogData_pokemon_aggregate)),
    ];

    return result;
  }

  @override
  GPokemonCatalogData deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = GPokemonCatalogDataBuilder();

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
                const FullType(GPokemonCatalogData_pokemon)
              ]))! as BuiltList<Object?>);
          break;
        case 'pokemon_aggregate':
          result.pokemon_aggregate.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(GPokemonCatalogData_pokemon_aggregate))!
              as GPokemonCatalogData_pokemon_aggregate);
          break;
      }
    }

    return result.build();
  }
}

class _$GPokemonCatalogData_pokemonSerializer
    implements StructuredSerializer<GPokemonCatalogData_pokemon> {
  @override
  final Iterable<Type> types = const [
    GPokemonCatalogData_pokemon,
    _$GPokemonCatalogData_pokemon
  ];
  @override
  final String wireName = 'GPokemonCatalogData_pokemon';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GPokemonCatalogData_pokemon object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(int)),
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'pokemontypes',
      serializers.serialize(object.pokemontypes,
          specifiedType: const FullType(BuiltList, const [
            const FullType(GPokemonCatalogData_pokemon_pokemontypes)
          ])),
      'pokemonsprites',
      serializers.serialize(object.pokemonsprites,
          specifiedType: const FullType(BuiltList, const [
            const FullType(GPokemonCatalogData_pokemon_pokemonsprites)
          ])),
    ];

    return result;
  }

  @override
  GPokemonCatalogData_pokemon deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = GPokemonCatalogData_pokemonBuilder();

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
        case 'pokemontypes':
          result.pokemontypes.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(GPokemonCatalogData_pokemon_pokemontypes)
              ]))! as BuiltList<Object?>);
          break;
        case 'pokemonsprites':
          result.pokemonsprites.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(GPokemonCatalogData_pokemon_pokemonsprites)
              ]))! as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$GPokemonCatalogData_pokemon_pokemontypesSerializer
    implements StructuredSerializer<GPokemonCatalogData_pokemon_pokemontypes> {
  @override
  final Iterable<Type> types = const [
    GPokemonCatalogData_pokemon_pokemontypes,
    _$GPokemonCatalogData_pokemon_pokemontypes
  ];
  @override
  final String wireName = 'GPokemonCatalogData_pokemon_pokemontypes';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GPokemonCatalogData_pokemon_pokemontypes object,
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
                const FullType(GPokemonCatalogData_pokemon_pokemontypes_type)));
    }
    return result;
  }

  @override
  GPokemonCatalogData_pokemon_pokemontypes deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = GPokemonCatalogData_pokemon_pokemontypesBuilder();

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
                  specifiedType: const FullType(
                      GPokemonCatalogData_pokemon_pokemontypes_type))!
              as GPokemonCatalogData_pokemon_pokemontypes_type);
          break;
      }
    }

    return result.build();
  }
}

class _$GPokemonCatalogData_pokemon_pokemontypes_typeSerializer
    implements
        StructuredSerializer<GPokemonCatalogData_pokemon_pokemontypes_type> {
  @override
  final Iterable<Type> types = const [
    GPokemonCatalogData_pokemon_pokemontypes_type,
    _$GPokemonCatalogData_pokemon_pokemontypes_type
  ];
  @override
  final String wireName = 'GPokemonCatalogData_pokemon_pokemontypes_type';

  @override
  Iterable<Object?> serialize(Serializers serializers,
      GPokemonCatalogData_pokemon_pokemontypes_type object,
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
  GPokemonCatalogData_pokemon_pokemontypes_type deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = GPokemonCatalogData_pokemon_pokemontypes_typeBuilder();

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

class _$GPokemonCatalogData_pokemon_pokemonspritesSerializer
    implements
        StructuredSerializer<GPokemonCatalogData_pokemon_pokemonsprites> {
  @override
  final Iterable<Type> types = const [
    GPokemonCatalogData_pokemon_pokemonsprites,
    _$GPokemonCatalogData_pokemon_pokemonsprites
  ];
  @override
  final String wireName = 'GPokemonCatalogData_pokemon_pokemonsprites';

  @override
  Iterable<Object?> serialize(Serializers serializers,
      GPokemonCatalogData_pokemon_pokemonsprites object,
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
    ];

    return result;
  }

  @override
  GPokemonCatalogData_pokemon_pokemonsprites deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = GPokemonCatalogData_pokemon_pokemonspritesBuilder();

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
      }
    }

    return result.build();
  }
}

class _$GPokemonCatalogData_pokemon_aggregateSerializer
    implements StructuredSerializer<GPokemonCatalogData_pokemon_aggregate> {
  @override
  final Iterable<Type> types = const [
    GPokemonCatalogData_pokemon_aggregate,
    _$GPokemonCatalogData_pokemon_aggregate
  ];
  @override
  final String wireName = 'GPokemonCatalogData_pokemon_aggregate';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, GPokemonCatalogData_pokemon_aggregate object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.aggregate;
    if (value != null) {
      result
        ..add('aggregate')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                GPokemonCatalogData_pokemon_aggregate_aggregate)));
    }
    return result;
  }

  @override
  GPokemonCatalogData_pokemon_aggregate deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = GPokemonCatalogData_pokemon_aggregateBuilder();

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
        case 'aggregate':
          result.aggregate.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      GPokemonCatalogData_pokemon_aggregate_aggregate))!
              as GPokemonCatalogData_pokemon_aggregate_aggregate);
          break;
      }
    }

    return result.build();
  }
}

class _$GPokemonCatalogData_pokemon_aggregate_aggregateSerializer
    implements
        StructuredSerializer<GPokemonCatalogData_pokemon_aggregate_aggregate> {
  @override
  final Iterable<Type> types = const [
    GPokemonCatalogData_pokemon_aggregate_aggregate,
    _$GPokemonCatalogData_pokemon_aggregate_aggregate
  ];
  @override
  final String wireName = 'GPokemonCatalogData_pokemon_aggregate_aggregate';

  @override
  Iterable<Object?> serialize(Serializers serializers,
      GPokemonCatalogData_pokemon_aggregate_aggregate object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      '__typename',
      serializers.serialize(object.G__typename,
          specifiedType: const FullType(String)),
      'count',
      serializers.serialize(object.count, specifiedType: const FullType(int)),
    ];

    return result;
  }

  @override
  GPokemonCatalogData_pokemon_aggregate_aggregate deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = GPokemonCatalogData_pokemon_aggregate_aggregateBuilder();

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
        case 'count':
          result.count = serializers.deserialize(value,
              specifiedType: const FullType(int))! as int;
          break;
      }
    }

    return result.build();
  }
}

class _$GPokemonCatalogData extends GPokemonCatalogData {
  @override
  final String G__typename;
  @override
  final BuiltList<GPokemonCatalogData_pokemon> pokemon;
  @override
  final GPokemonCatalogData_pokemon_aggregate pokemon_aggregate;

  factory _$GPokemonCatalogData(
          [void Function(GPokemonCatalogDataBuilder)? updates]) =>
      (GPokemonCatalogDataBuilder()..update(updates))._build();

  _$GPokemonCatalogData._(
      {required this.G__typename,
      required this.pokemon,
      required this.pokemon_aggregate})
      : super._();
  @override
  GPokemonCatalogData rebuild(
          void Function(GPokemonCatalogDataBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GPokemonCatalogDataBuilder toBuilder() =>
      GPokemonCatalogDataBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GPokemonCatalogData &&
        G__typename == other.G__typename &&
        pokemon == other.pokemon &&
        pokemon_aggregate == other.pokemon_aggregate;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, pokemon.hashCode);
    _$hash = $jc(_$hash, pokemon_aggregate.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GPokemonCatalogData')
          ..add('G__typename', G__typename)
          ..add('pokemon', pokemon)
          ..add('pokemon_aggregate', pokemon_aggregate))
        .toString();
  }
}

class GPokemonCatalogDataBuilder
    implements Builder<GPokemonCatalogData, GPokemonCatalogDataBuilder> {
  _$GPokemonCatalogData? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  ListBuilder<GPokemonCatalogData_pokemon>? _pokemon;
  ListBuilder<GPokemonCatalogData_pokemon> get pokemon =>
      _$this._pokemon ??= ListBuilder<GPokemonCatalogData_pokemon>();
  set pokemon(ListBuilder<GPokemonCatalogData_pokemon>? pokemon) =>
      _$this._pokemon = pokemon;

  GPokemonCatalogData_pokemon_aggregateBuilder? _pokemon_aggregate;
  GPokemonCatalogData_pokemon_aggregateBuilder get pokemon_aggregate =>
      _$this._pokemon_aggregate ??=
          GPokemonCatalogData_pokemon_aggregateBuilder();
  set pokemon_aggregate(
          GPokemonCatalogData_pokemon_aggregateBuilder? pokemon_aggregate) =>
      _$this._pokemon_aggregate = pokemon_aggregate;

  GPokemonCatalogDataBuilder() {
    GPokemonCatalogData._initializeBuilder(this);
  }

  GPokemonCatalogDataBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _pokemon = $v.pokemon.toBuilder();
      _pokemon_aggregate = $v.pokemon_aggregate.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GPokemonCatalogData other) {
    _$v = other as _$GPokemonCatalogData;
  }

  @override
  void update(void Function(GPokemonCatalogDataBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GPokemonCatalogData build() => _build();

  _$GPokemonCatalogData _build() {
    _$GPokemonCatalogData _$result;
    try {
      _$result = _$v ??
          _$GPokemonCatalogData._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename, r'GPokemonCatalogData', 'G__typename'),
            pokemon: pokemon.build(),
            pokemon_aggregate: pokemon_aggregate.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'pokemon';
        pokemon.build();
        _$failedField = 'pokemon_aggregate';
        pokemon_aggregate.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'GPokemonCatalogData', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GPokemonCatalogData_pokemon extends GPokemonCatalogData_pokemon {
  @override
  final String G__typename;
  @override
  final int id;
  @override
  final String name;
  @override
  final BuiltList<GPokemonCatalogData_pokemon_pokemontypes> pokemontypes;
  @override
  final BuiltList<GPokemonCatalogData_pokemon_pokemonsprites> pokemonsprites;

  factory _$GPokemonCatalogData_pokemon(
          [void Function(GPokemonCatalogData_pokemonBuilder)? updates]) =>
      (GPokemonCatalogData_pokemonBuilder()..update(updates))._build();

  _$GPokemonCatalogData_pokemon._(
      {required this.G__typename,
      required this.id,
      required this.name,
      required this.pokemontypes,
      required this.pokemonsprites})
      : super._();
  @override
  GPokemonCatalogData_pokemon rebuild(
          void Function(GPokemonCatalogData_pokemonBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GPokemonCatalogData_pokemonBuilder toBuilder() =>
      GPokemonCatalogData_pokemonBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GPokemonCatalogData_pokemon &&
        G__typename == other.G__typename &&
        id == other.id &&
        name == other.name &&
        pokemontypes == other.pokemontypes &&
        pokemonsprites == other.pokemonsprites;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, pokemontypes.hashCode);
    _$hash = $jc(_$hash, pokemonsprites.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'GPokemonCatalogData_pokemon')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('name', name)
          ..add('pokemontypes', pokemontypes)
          ..add('pokemonsprites', pokemonsprites))
        .toString();
  }
}

class GPokemonCatalogData_pokemonBuilder
    implements
        Builder<GPokemonCatalogData_pokemon,
            GPokemonCatalogData_pokemonBuilder> {
  _$GPokemonCatalogData_pokemon? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  ListBuilder<GPokemonCatalogData_pokemon_pokemontypes>? _pokemontypes;
  ListBuilder<GPokemonCatalogData_pokemon_pokemontypes> get pokemontypes =>
      _$this._pokemontypes ??=
          ListBuilder<GPokemonCatalogData_pokemon_pokemontypes>();
  set pokemontypes(
          ListBuilder<GPokemonCatalogData_pokemon_pokemontypes>?
              pokemontypes) =>
      _$this._pokemontypes = pokemontypes;

  ListBuilder<GPokemonCatalogData_pokemon_pokemonsprites>? _pokemonsprites;
  ListBuilder<GPokemonCatalogData_pokemon_pokemonsprites> get pokemonsprites =>
      _$this._pokemonsprites ??=
          ListBuilder<GPokemonCatalogData_pokemon_pokemonsprites>();
  set pokemonsprites(
          ListBuilder<GPokemonCatalogData_pokemon_pokemonsprites>?
              pokemonsprites) =>
      _$this._pokemonsprites = pokemonsprites;

  GPokemonCatalogData_pokemonBuilder() {
    GPokemonCatalogData_pokemon._initializeBuilder(this);
  }

  GPokemonCatalogData_pokemonBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _id = $v.id;
      _name = $v.name;
      _pokemontypes = $v.pokemontypes.toBuilder();
      _pokemonsprites = $v.pokemonsprites.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GPokemonCatalogData_pokemon other) {
    _$v = other as _$GPokemonCatalogData_pokemon;
  }

  @override
  void update(void Function(GPokemonCatalogData_pokemonBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GPokemonCatalogData_pokemon build() => _build();

  _$GPokemonCatalogData_pokemon _build() {
    _$GPokemonCatalogData_pokemon _$result;
    try {
      _$result = _$v ??
          _$GPokemonCatalogData_pokemon._(
            G__typename: BuiltValueNullFieldError.checkNotNull(
                G__typename, r'GPokemonCatalogData_pokemon', 'G__typename'),
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'GPokemonCatalogData_pokemon', 'id'),
            name: BuiltValueNullFieldError.checkNotNull(
                name, r'GPokemonCatalogData_pokemon', 'name'),
            pokemontypes: pokemontypes.build(),
            pokemonsprites: pokemonsprites.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'pokemontypes';
        pokemontypes.build();
        _$failedField = 'pokemonsprites';
        pokemonsprites.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'GPokemonCatalogData_pokemon', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GPokemonCatalogData_pokemon_pokemontypes
    extends GPokemonCatalogData_pokemon_pokemontypes {
  @override
  final String G__typename;
  @override
  final int slot;
  @override
  final GPokemonCatalogData_pokemon_pokemontypes_type? type;

  factory _$GPokemonCatalogData_pokemon_pokemontypes(
          [void Function(GPokemonCatalogData_pokemon_pokemontypesBuilder)?
              updates]) =>
      (GPokemonCatalogData_pokemon_pokemontypesBuilder()..update(updates))
          ._build();

  _$GPokemonCatalogData_pokemon_pokemontypes._(
      {required this.G__typename, required this.slot, this.type})
      : super._();
  @override
  GPokemonCatalogData_pokemon_pokemontypes rebuild(
          void Function(GPokemonCatalogData_pokemon_pokemontypesBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GPokemonCatalogData_pokemon_pokemontypesBuilder toBuilder() =>
      GPokemonCatalogData_pokemon_pokemontypesBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GPokemonCatalogData_pokemon_pokemontypes &&
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
    return (newBuiltValueToStringHelper(
            r'GPokemonCatalogData_pokemon_pokemontypes')
          ..add('G__typename', G__typename)
          ..add('slot', slot)
          ..add('type', type))
        .toString();
  }
}

class GPokemonCatalogData_pokemon_pokemontypesBuilder
    implements
        Builder<GPokemonCatalogData_pokemon_pokemontypes,
            GPokemonCatalogData_pokemon_pokemontypesBuilder> {
  _$GPokemonCatalogData_pokemon_pokemontypes? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  int? _slot;
  int? get slot => _$this._slot;
  set slot(int? slot) => _$this._slot = slot;

  GPokemonCatalogData_pokemon_pokemontypes_typeBuilder? _type;
  GPokemonCatalogData_pokemon_pokemontypes_typeBuilder get type =>
      _$this._type ??= GPokemonCatalogData_pokemon_pokemontypes_typeBuilder();
  set type(GPokemonCatalogData_pokemon_pokemontypes_typeBuilder? type) =>
      _$this._type = type;

  GPokemonCatalogData_pokemon_pokemontypesBuilder() {
    GPokemonCatalogData_pokemon_pokemontypes._initializeBuilder(this);
  }

  GPokemonCatalogData_pokemon_pokemontypesBuilder get _$this {
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
  void replace(GPokemonCatalogData_pokemon_pokemontypes other) {
    _$v = other as _$GPokemonCatalogData_pokemon_pokemontypes;
  }

  @override
  void update(
      void Function(GPokemonCatalogData_pokemon_pokemontypesBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GPokemonCatalogData_pokemon_pokemontypes build() => _build();

  _$GPokemonCatalogData_pokemon_pokemontypes _build() {
    _$GPokemonCatalogData_pokemon_pokemontypes _$result;
    try {
      _$result = _$v ??
          _$GPokemonCatalogData_pokemon_pokemontypes._(
            G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
                r'GPokemonCatalogData_pokemon_pokemontypes', 'G__typename'),
            slot: BuiltValueNullFieldError.checkNotNull(
                slot, r'GPokemonCatalogData_pokemon_pokemontypes', 'slot'),
            type: _type?.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'type';
        _type?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'GPokemonCatalogData_pokemon_pokemontypes',
            _$failedField,
            e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GPokemonCatalogData_pokemon_pokemontypes_type
    extends GPokemonCatalogData_pokemon_pokemontypes_type {
  @override
  final String G__typename;
  @override
  final int id;
  @override
  final String name;

  factory _$GPokemonCatalogData_pokemon_pokemontypes_type(
          [void Function(GPokemonCatalogData_pokemon_pokemontypes_typeBuilder)?
              updates]) =>
      (GPokemonCatalogData_pokemon_pokemontypes_typeBuilder()..update(updates))
          ._build();

  _$GPokemonCatalogData_pokemon_pokemontypes_type._(
      {required this.G__typename, required this.id, required this.name})
      : super._();
  @override
  GPokemonCatalogData_pokemon_pokemontypes_type rebuild(
          void Function(GPokemonCatalogData_pokemon_pokemontypes_typeBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GPokemonCatalogData_pokemon_pokemontypes_typeBuilder toBuilder() =>
      GPokemonCatalogData_pokemon_pokemontypes_typeBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GPokemonCatalogData_pokemon_pokemontypes_type &&
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
            r'GPokemonCatalogData_pokemon_pokemontypes_type')
          ..add('G__typename', G__typename)
          ..add('id', id)
          ..add('name', name))
        .toString();
  }
}

class GPokemonCatalogData_pokemon_pokemontypes_typeBuilder
    implements
        Builder<GPokemonCatalogData_pokemon_pokemontypes_type,
            GPokemonCatalogData_pokemon_pokemontypes_typeBuilder> {
  _$GPokemonCatalogData_pokemon_pokemontypes_type? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  GPokemonCatalogData_pokemon_pokemontypes_typeBuilder() {
    GPokemonCatalogData_pokemon_pokemontypes_type._initializeBuilder(this);
  }

  GPokemonCatalogData_pokemon_pokemontypes_typeBuilder get _$this {
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
  void replace(GPokemonCatalogData_pokemon_pokemontypes_type other) {
    _$v = other as _$GPokemonCatalogData_pokemon_pokemontypes_type;
  }

  @override
  void update(
      void Function(GPokemonCatalogData_pokemon_pokemontypes_typeBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  GPokemonCatalogData_pokemon_pokemontypes_type build() => _build();

  _$GPokemonCatalogData_pokemon_pokemontypes_type _build() {
    final _$result = _$v ??
        _$GPokemonCatalogData_pokemon_pokemontypes_type._(
          G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
              r'GPokemonCatalogData_pokemon_pokemontypes_type', 'G__typename'),
          id: BuiltValueNullFieldError.checkNotNull(
              id, r'GPokemonCatalogData_pokemon_pokemontypes_type', 'id'),
          name: BuiltValueNullFieldError.checkNotNull(
              name, r'GPokemonCatalogData_pokemon_pokemontypes_type', 'name'),
        );
    replace(_$result);
    return _$result;
  }
}

class _$GPokemonCatalogData_pokemon_pokemonsprites
    extends GPokemonCatalogData_pokemon_pokemonsprites {
  @override
  final String G__typename;
  @override
  final _i2.Gjsonb artwork;
  @override
  final _i2.Gjsonb front;

  factory _$GPokemonCatalogData_pokemon_pokemonsprites(
          [void Function(GPokemonCatalogData_pokemon_pokemonspritesBuilder)?
              updates]) =>
      (GPokemonCatalogData_pokemon_pokemonspritesBuilder()..update(updates))
          ._build();

  _$GPokemonCatalogData_pokemon_pokemonsprites._(
      {required this.G__typename, required this.artwork, required this.front})
      : super._();
  @override
  GPokemonCatalogData_pokemon_pokemonsprites rebuild(
          void Function(GPokemonCatalogData_pokemon_pokemonspritesBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GPokemonCatalogData_pokemon_pokemonspritesBuilder toBuilder() =>
      GPokemonCatalogData_pokemon_pokemonspritesBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GPokemonCatalogData_pokemon_pokemonsprites &&
        G__typename == other.G__typename &&
        artwork == other.artwork &&
        front == other.front;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, artwork.hashCode);
    _$hash = $jc(_$hash, front.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'GPokemonCatalogData_pokemon_pokemonsprites')
          ..add('G__typename', G__typename)
          ..add('artwork', artwork)
          ..add('front', front))
        .toString();
  }
}

class GPokemonCatalogData_pokemon_pokemonspritesBuilder
    implements
        Builder<GPokemonCatalogData_pokemon_pokemonsprites,
            GPokemonCatalogData_pokemon_pokemonspritesBuilder> {
  _$GPokemonCatalogData_pokemon_pokemonsprites? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  _i2.GjsonbBuilder? _artwork;
  _i2.GjsonbBuilder get artwork => _$this._artwork ??= _i2.GjsonbBuilder();
  set artwork(_i2.GjsonbBuilder? artwork) => _$this._artwork = artwork;

  _i2.GjsonbBuilder? _front;
  _i2.GjsonbBuilder get front => _$this._front ??= _i2.GjsonbBuilder();
  set front(_i2.GjsonbBuilder? front) => _$this._front = front;

  GPokemonCatalogData_pokemon_pokemonspritesBuilder() {
    GPokemonCatalogData_pokemon_pokemonsprites._initializeBuilder(this);
  }

  GPokemonCatalogData_pokemon_pokemonspritesBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _artwork = $v.artwork.toBuilder();
      _front = $v.front.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GPokemonCatalogData_pokemon_pokemonsprites other) {
    _$v = other as _$GPokemonCatalogData_pokemon_pokemonsprites;
  }

  @override
  void update(
      void Function(GPokemonCatalogData_pokemon_pokemonspritesBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  GPokemonCatalogData_pokemon_pokemonsprites build() => _build();

  _$GPokemonCatalogData_pokemon_pokemonsprites _build() {
    _$GPokemonCatalogData_pokemon_pokemonsprites _$result;
    try {
      _$result = _$v ??
          _$GPokemonCatalogData_pokemon_pokemonsprites._(
            G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
                r'GPokemonCatalogData_pokemon_pokemonsprites', 'G__typename'),
            artwork: artwork.build(),
            front: front.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'artwork';
        artwork.build();
        _$failedField = 'front';
        front.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'GPokemonCatalogData_pokemon_pokemonsprites',
            _$failedField,
            e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GPokemonCatalogData_pokemon_aggregate
    extends GPokemonCatalogData_pokemon_aggregate {
  @override
  final String G__typename;
  @override
  final GPokemonCatalogData_pokemon_aggregate_aggregate? aggregate;

  factory _$GPokemonCatalogData_pokemon_aggregate(
          [void Function(GPokemonCatalogData_pokemon_aggregateBuilder)?
              updates]) =>
      (GPokemonCatalogData_pokemon_aggregateBuilder()..update(updates))
          ._build();

  _$GPokemonCatalogData_pokemon_aggregate._(
      {required this.G__typename, this.aggregate})
      : super._();
  @override
  GPokemonCatalogData_pokemon_aggregate rebuild(
          void Function(GPokemonCatalogData_pokemon_aggregateBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GPokemonCatalogData_pokemon_aggregateBuilder toBuilder() =>
      GPokemonCatalogData_pokemon_aggregateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GPokemonCatalogData_pokemon_aggregate &&
        G__typename == other.G__typename &&
        aggregate == other.aggregate;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, aggregate.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'GPokemonCatalogData_pokemon_aggregate')
          ..add('G__typename', G__typename)
          ..add('aggregate', aggregate))
        .toString();
  }
}

class GPokemonCatalogData_pokemon_aggregateBuilder
    implements
        Builder<GPokemonCatalogData_pokemon_aggregate,
            GPokemonCatalogData_pokemon_aggregateBuilder> {
  _$GPokemonCatalogData_pokemon_aggregate? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  GPokemonCatalogData_pokemon_aggregate_aggregateBuilder? _aggregate;
  GPokemonCatalogData_pokemon_aggregate_aggregateBuilder get aggregate =>
      _$this._aggregate ??=
          GPokemonCatalogData_pokemon_aggregate_aggregateBuilder();
  set aggregate(
          GPokemonCatalogData_pokemon_aggregate_aggregateBuilder? aggregate) =>
      _$this._aggregate = aggregate;

  GPokemonCatalogData_pokemon_aggregateBuilder() {
    GPokemonCatalogData_pokemon_aggregate._initializeBuilder(this);
  }

  GPokemonCatalogData_pokemon_aggregateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _aggregate = $v.aggregate?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GPokemonCatalogData_pokemon_aggregate other) {
    _$v = other as _$GPokemonCatalogData_pokemon_aggregate;
  }

  @override
  void update(
      void Function(GPokemonCatalogData_pokemon_aggregateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  GPokemonCatalogData_pokemon_aggregate build() => _build();

  _$GPokemonCatalogData_pokemon_aggregate _build() {
    _$GPokemonCatalogData_pokemon_aggregate _$result;
    try {
      _$result = _$v ??
          _$GPokemonCatalogData_pokemon_aggregate._(
            G__typename: BuiltValueNullFieldError.checkNotNull(G__typename,
                r'GPokemonCatalogData_pokemon_aggregate', 'G__typename'),
            aggregate: _aggregate?.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'aggregate';
        _aggregate?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'GPokemonCatalogData_pokemon_aggregate',
            _$failedField,
            e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$GPokemonCatalogData_pokemon_aggregate_aggregate
    extends GPokemonCatalogData_pokemon_aggregate_aggregate {
  @override
  final String G__typename;
  @override
  final int count;

  factory _$GPokemonCatalogData_pokemon_aggregate_aggregate(
          [void Function(
                  GPokemonCatalogData_pokemon_aggregate_aggregateBuilder)?
              updates]) =>
      (GPokemonCatalogData_pokemon_aggregate_aggregateBuilder()
            ..update(updates))
          ._build();

  _$GPokemonCatalogData_pokemon_aggregate_aggregate._(
      {required this.G__typename, required this.count})
      : super._();
  @override
  GPokemonCatalogData_pokemon_aggregate_aggregate rebuild(
          void Function(GPokemonCatalogData_pokemon_aggregate_aggregateBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GPokemonCatalogData_pokemon_aggregate_aggregateBuilder toBuilder() =>
      GPokemonCatalogData_pokemon_aggregate_aggregateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GPokemonCatalogData_pokemon_aggregate_aggregate &&
        G__typename == other.G__typename &&
        count == other.count;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, G__typename.hashCode);
    _$hash = $jc(_$hash, count.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'GPokemonCatalogData_pokemon_aggregate_aggregate')
          ..add('G__typename', G__typename)
          ..add('count', count))
        .toString();
  }
}

class GPokemonCatalogData_pokemon_aggregate_aggregateBuilder
    implements
        Builder<GPokemonCatalogData_pokemon_aggregate_aggregate,
            GPokemonCatalogData_pokemon_aggregate_aggregateBuilder> {
  _$GPokemonCatalogData_pokemon_aggregate_aggregate? _$v;

  String? _G__typename;
  String? get G__typename => _$this._G__typename;
  set G__typename(String? G__typename) => _$this._G__typename = G__typename;

  int? _count;
  int? get count => _$this._count;
  set count(int? count) => _$this._count = count;

  GPokemonCatalogData_pokemon_aggregate_aggregateBuilder() {
    GPokemonCatalogData_pokemon_aggregate_aggregate._initializeBuilder(this);
  }

  GPokemonCatalogData_pokemon_aggregate_aggregateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _G__typename = $v.G__typename;
      _count = $v.count;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GPokemonCatalogData_pokemon_aggregate_aggregate other) {
    _$v = other as _$GPokemonCatalogData_pokemon_aggregate_aggregate;
  }

  @override
  void update(
      void Function(GPokemonCatalogData_pokemon_aggregate_aggregateBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  GPokemonCatalogData_pokemon_aggregate_aggregate build() => _build();

  _$GPokemonCatalogData_pokemon_aggregate_aggregate _build() {
    final _$result = _$v ??
        _$GPokemonCatalogData_pokemon_aggregate_aggregate._(
          G__typename: BuiltValueNullFieldError.checkNotNull(
              G__typename,
              r'GPokemonCatalogData_pokemon_aggregate_aggregate',
              'G__typename'),
          count: BuiltValueNullFieldError.checkNotNull(count,
              r'GPokemonCatalogData_pokemon_aggregate_aggregate', 'count'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
