// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $PokemonSpeciesTable extends PokemonSpecies
    with TableInfo<$PokemonSpeciesTable, PokemonSpecy> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PokemonSpeciesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _generationIdMeta =
      const VerificationMeta('generationId');
  @override
  late final GeneratedColumn<int> generationId = GeneratedColumn<int>(
      'generation_id', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _evolutionChainIdMeta =
      const VerificationMeta('evolutionChainId');
  @override
  late final GeneratedColumn<int> evolutionChainId = GeneratedColumn<int>(
      'evolution_chain_id', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _eggGroupsJsonMeta =
      const VerificationMeta('eggGroupsJson');
  @override
  late final GeneratedColumn<String> eggGroupsJson = GeneratedColumn<String>(
      'egg_groups_json', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [id, name, generationId, evolutionChainId, eggGroupsJson];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'pokemon_species';
  @override
  VerificationContext validateIntegrity(Insertable<PokemonSpecy> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('generation_id')) {
      context.handle(
          _generationIdMeta,
          generationId.isAcceptableOrUnknown(
              data['generation_id']!, _generationIdMeta));
    }
    if (data.containsKey('evolution_chain_id')) {
      context.handle(
          _evolutionChainIdMeta,
          evolutionChainId.isAcceptableOrUnknown(
              data['evolution_chain_id']!, _evolutionChainIdMeta));
    }
    if (data.containsKey('egg_groups_json')) {
      context.handle(
          _eggGroupsJsonMeta,
          eggGroupsJson.isAcceptableOrUnknown(
              data['egg_groups_json']!, _eggGroupsJsonMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PokemonSpecy map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PokemonSpecy(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      generationId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}generation_id']),
      evolutionChainId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}evolution_chain_id']),
      eggGroupsJson: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}egg_groups_json']),
    );
  }

  @override
  $PokemonSpeciesTable createAlias(String alias) {
    return $PokemonSpeciesTable(attachedDatabase, alias);
  }
}

class PokemonSpecy extends DataClass implements Insertable<PokemonSpecy> {
  final int id;
  final String name;
  final int? generationId;
  final int? evolutionChainId;
  final String? eggGroupsJson;
  const PokemonSpecy(
      {required this.id,
      required this.name,
      this.generationId,
      this.evolutionChainId,
      this.eggGroupsJson});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || generationId != null) {
      map['generation_id'] = Variable<int>(generationId);
    }
    if (!nullToAbsent || evolutionChainId != null) {
      map['evolution_chain_id'] = Variable<int>(evolutionChainId);
    }
    if (!nullToAbsent || eggGroupsJson != null) {
      map['egg_groups_json'] = Variable<String>(eggGroupsJson);
    }
    return map;
  }

  PokemonSpeciesCompanion toCompanion(bool nullToAbsent) {
    return PokemonSpeciesCompanion(
      id: Value(id),
      name: Value(name),
      generationId: generationId == null && nullToAbsent
          ? const Value.absent()
          : Value(generationId),
      evolutionChainId: evolutionChainId == null && nullToAbsent
          ? const Value.absent()
          : Value(evolutionChainId),
      eggGroupsJson: eggGroupsJson == null && nullToAbsent
          ? const Value.absent()
          : Value(eggGroupsJson),
    );
  }

  factory PokemonSpecy.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PokemonSpecy(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      generationId: serializer.fromJson<int?>(json['generationId']),
      evolutionChainId: serializer.fromJson<int?>(json['evolutionChainId']),
      eggGroupsJson: serializer.fromJson<String?>(json['eggGroupsJson']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'generationId': serializer.toJson<int?>(generationId),
      'evolutionChainId': serializer.toJson<int?>(evolutionChainId),
      'eggGroupsJson': serializer.toJson<String?>(eggGroupsJson),
    };
  }

  PokemonSpecy copyWith(
          {int? id,
          String? name,
          Value<int?> generationId = const Value.absent(),
          Value<int?> evolutionChainId = const Value.absent(),
          Value<String?> eggGroupsJson = const Value.absent()}) =>
      PokemonSpecy(
        id: id ?? this.id,
        name: name ?? this.name,
        generationId:
            generationId.present ? generationId.value : this.generationId,
        evolutionChainId: evolutionChainId.present
            ? evolutionChainId.value
            : this.evolutionChainId,
        eggGroupsJson:
            eggGroupsJson.present ? eggGroupsJson.value : this.eggGroupsJson,
      );
  PokemonSpecy copyWithCompanion(PokemonSpeciesCompanion data) {
    return PokemonSpecy(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      generationId: data.generationId.present
          ? data.generationId.value
          : this.generationId,
      evolutionChainId: data.evolutionChainId.present
          ? data.evolutionChainId.value
          : this.evolutionChainId,
      eggGroupsJson: data.eggGroupsJson.present
          ? data.eggGroupsJson.value
          : this.eggGroupsJson,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PokemonSpecy(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('generationId: $generationId, ')
          ..write('evolutionChainId: $evolutionChainId, ')
          ..write('eggGroupsJson: $eggGroupsJson')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, name, generationId, evolutionChainId, eggGroupsJson);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PokemonSpecy &&
          other.id == this.id &&
          other.name == this.name &&
          other.generationId == this.generationId &&
          other.evolutionChainId == this.evolutionChainId &&
          other.eggGroupsJson == this.eggGroupsJson);
}

class PokemonSpeciesCompanion extends UpdateCompanion<PokemonSpecy> {
  final Value<int> id;
  final Value<String> name;
  final Value<int?> generationId;
  final Value<int?> evolutionChainId;
  final Value<String?> eggGroupsJson;
  const PokemonSpeciesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.generationId = const Value.absent(),
    this.evolutionChainId = const Value.absent(),
    this.eggGroupsJson = const Value.absent(),
  });
  PokemonSpeciesCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    this.generationId = const Value.absent(),
    this.evolutionChainId = const Value.absent(),
    this.eggGroupsJson = const Value.absent(),
  }) : name = Value(name);
  static Insertable<PokemonSpecy> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<int>? generationId,
    Expression<int>? evolutionChainId,
    Expression<String>? eggGroupsJson,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (generationId != null) 'generation_id': generationId,
      if (evolutionChainId != null) 'evolution_chain_id': evolutionChainId,
      if (eggGroupsJson != null) 'egg_groups_json': eggGroupsJson,
    });
  }

  PokemonSpeciesCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<int?>? generationId,
      Value<int?>? evolutionChainId,
      Value<String?>? eggGroupsJson}) {
    return PokemonSpeciesCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      generationId: generationId ?? this.generationId,
      evolutionChainId: evolutionChainId ?? this.evolutionChainId,
      eggGroupsJson: eggGroupsJson ?? this.eggGroupsJson,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (generationId.present) {
      map['generation_id'] = Variable<int>(generationId.value);
    }
    if (evolutionChainId.present) {
      map['evolution_chain_id'] = Variable<int>(evolutionChainId.value);
    }
    if (eggGroupsJson.present) {
      map['egg_groups_json'] = Variable<String>(eggGroupsJson.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PokemonSpeciesCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('generationId: $generationId, ')
          ..write('evolutionChainId: $evolutionChainId, ')
          ..write('eggGroupsJson: $eggGroupsJson')
          ..write(')'))
        .toString();
  }
}

class $PokemonsTable extends Pokemons with TableInfo<$PokemonsTable, Pokemon> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PokemonsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _nationalDexNumberMeta =
      const VerificationMeta('nationalDexNumber');
  @override
  late final GeneratedColumn<int> nationalDexNumber = GeneratedColumn<int>(
      'national_dex_number', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _speciesIdMeta =
      const VerificationMeta('speciesId');
  @override
  late final GeneratedColumn<int> speciesId = GeneratedColumn<int>(
      'species_id', aliasedName, true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES pokemon_species (id)'));
  static const VerificationMeta _isDefaultMeta =
      const VerificationMeta('isDefault');
  @override
  late final GeneratedColumn<bool> isDefault = GeneratedColumn<bool>(
      'is_default', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_default" IN (0, 1))'),
      defaultValue: const Constant(true));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _imageUrlMeta =
      const VerificationMeta('imageUrl');
  @override
  late final GeneratedColumn<String> imageUrl = GeneratedColumn<String>(
      'image_url', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _artworkLocalPathMeta =
      const VerificationMeta('artworkLocalPath');
  @override
  late final GeneratedColumn<String> artworkLocalPath = GeneratedColumn<String>(
      'artwork_local_path', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _spriteUrlMeta =
      const VerificationMeta('spriteUrl');
  @override
  late final GeneratedColumn<String> spriteUrl = GeneratedColumn<String>(
      'sprite_url', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _spriteLocalPathMeta =
      const VerificationMeta('spriteLocalPath');
  @override
  late final GeneratedColumn<String> spriteLocalPath = GeneratedColumn<String>(
      'sprite_local_path', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _shinyArtworkUrlMeta =
      const VerificationMeta('shinyArtworkUrl');
  @override
  late final GeneratedColumn<String> shinyArtworkUrl = GeneratedColumn<String>(
      'shiny_artwork_url', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _shinyArtworkLocalPathMeta =
      const VerificationMeta('shinyArtworkLocalPath');
  @override
  late final GeneratedColumn<String> shinyArtworkLocalPath =
      GeneratedColumn<String>('shiny_artwork_local_path', aliasedName, true,
          type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _shinySpriteUrlMeta =
      const VerificationMeta('shinySpriteUrl');
  @override
  late final GeneratedColumn<String> shinySpriteUrl = GeneratedColumn<String>(
      'shiny_sprite_url', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _shinySpriteLocalPathMeta =
      const VerificationMeta('shinySpriteLocalPath');
  @override
  late final GeneratedColumn<String> shinySpriteLocalPath =
      GeneratedColumn<String>('shiny_sprite_local_path', aliasedName, true,
          type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _heightDecimetersMeta =
      const VerificationMeta('heightDecimeters');
  @override
  late final GeneratedColumn<int> heightDecimeters = GeneratedColumn<int>(
      'height_decimeters', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _weightHectogramsMeta =
      const VerificationMeta('weightHectograms');
  @override
  late final GeneratedColumn<int> weightHectograms = GeneratedColumn<int>(
      'weight_hectograms', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        nationalDexNumber,
        speciesId,
        isDefault,
        name,
        imageUrl,
        artworkLocalPath,
        spriteUrl,
        spriteLocalPath,
        shinyArtworkUrl,
        shinyArtworkLocalPath,
        shinySpriteUrl,
        shinySpriteLocalPath,
        heightDecimeters,
        weightHectograms,
        updatedAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'pokemon';
  @override
  VerificationContext validateIntegrity(Insertable<Pokemon> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('national_dex_number')) {
      context.handle(
          _nationalDexNumberMeta,
          nationalDexNumber.isAcceptableOrUnknown(
              data['national_dex_number']!, _nationalDexNumberMeta));
    } else if (isInserting) {
      context.missing(_nationalDexNumberMeta);
    }
    if (data.containsKey('species_id')) {
      context.handle(_speciesIdMeta,
          speciesId.isAcceptableOrUnknown(data['species_id']!, _speciesIdMeta));
    }
    if (data.containsKey('is_default')) {
      context.handle(_isDefaultMeta,
          isDefault.isAcceptableOrUnknown(data['is_default']!, _isDefaultMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('image_url')) {
      context.handle(_imageUrlMeta,
          imageUrl.isAcceptableOrUnknown(data['image_url']!, _imageUrlMeta));
    }
    if (data.containsKey('artwork_local_path')) {
      context.handle(
          _artworkLocalPathMeta,
          artworkLocalPath.isAcceptableOrUnknown(
              data['artwork_local_path']!, _artworkLocalPathMeta));
    }
    if (data.containsKey('sprite_url')) {
      context.handle(_spriteUrlMeta,
          spriteUrl.isAcceptableOrUnknown(data['sprite_url']!, _spriteUrlMeta));
    }
    if (data.containsKey('sprite_local_path')) {
      context.handle(
          _spriteLocalPathMeta,
          spriteLocalPath.isAcceptableOrUnknown(
              data['sprite_local_path']!, _spriteLocalPathMeta));
    }
    if (data.containsKey('shiny_artwork_url')) {
      context.handle(
          _shinyArtworkUrlMeta,
          shinyArtworkUrl.isAcceptableOrUnknown(
              data['shiny_artwork_url']!, _shinyArtworkUrlMeta));
    }
    if (data.containsKey('shiny_artwork_local_path')) {
      context.handle(
          _shinyArtworkLocalPathMeta,
          shinyArtworkLocalPath.isAcceptableOrUnknown(
              data['shiny_artwork_local_path']!, _shinyArtworkLocalPathMeta));
    }
    if (data.containsKey('shiny_sprite_url')) {
      context.handle(
          _shinySpriteUrlMeta,
          shinySpriteUrl.isAcceptableOrUnknown(
              data['shiny_sprite_url']!, _shinySpriteUrlMeta));
    }
    if (data.containsKey('shiny_sprite_local_path')) {
      context.handle(
          _shinySpriteLocalPathMeta,
          shinySpriteLocalPath.isAcceptableOrUnknown(
              data['shiny_sprite_local_path']!, _shinySpriteLocalPathMeta));
    }
    if (data.containsKey('height_decimeters')) {
      context.handle(
          _heightDecimetersMeta,
          heightDecimeters.isAcceptableOrUnknown(
              data['height_decimeters']!, _heightDecimetersMeta));
    }
    if (data.containsKey('weight_hectograms')) {
      context.handle(
          _weightHectogramsMeta,
          weightHectograms.isAcceptableOrUnknown(
              data['weight_hectograms']!, _weightHectogramsMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Pokemon map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Pokemon(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      nationalDexNumber: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}national_dex_number'])!,
      speciesId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}species_id']),
      isDefault: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_default'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      imageUrl: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}image_url']),
      artworkLocalPath: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}artwork_local_path']),
      spriteUrl: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}sprite_url']),
      spriteLocalPath: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}sprite_local_path']),
      shinyArtworkUrl: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}shiny_artwork_url']),
      shinyArtworkLocalPath: attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}shiny_artwork_local_path']),
      shinySpriteUrl: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}shiny_sprite_url']),
      shinySpriteLocalPath: attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}shiny_sprite_local_path']),
      heightDecimeters: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}height_decimeters']),
      weightHectograms: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}weight_hectograms']),
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
    );
  }

  @override
  $PokemonsTable createAlias(String alias) {
    return $PokemonsTable(attachedDatabase, alias);
  }
}

class Pokemon extends DataClass implements Insertable<Pokemon> {
  final int id;
  final int nationalDexNumber;
  final int? speciesId;
  final bool isDefault;
  final String name;
  final String? imageUrl;
  final String? artworkLocalPath;
  final String? spriteUrl;
  final String? spriteLocalPath;
  final String? shinyArtworkUrl;
  final String? shinyArtworkLocalPath;
  final String? shinySpriteUrl;
  final String? shinySpriteLocalPath;
  final int? heightDecimeters;
  final int? weightHectograms;
  final DateTime updatedAt;
  const Pokemon(
      {required this.id,
      required this.nationalDexNumber,
      this.speciesId,
      required this.isDefault,
      required this.name,
      this.imageUrl,
      this.artworkLocalPath,
      this.spriteUrl,
      this.spriteLocalPath,
      this.shinyArtworkUrl,
      this.shinyArtworkLocalPath,
      this.shinySpriteUrl,
      this.shinySpriteLocalPath,
      this.heightDecimeters,
      this.weightHectograms,
      required this.updatedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['national_dex_number'] = Variable<int>(nationalDexNumber);
    if (!nullToAbsent || speciesId != null) {
      map['species_id'] = Variable<int>(speciesId);
    }
    map['is_default'] = Variable<bool>(isDefault);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || imageUrl != null) {
      map['image_url'] = Variable<String>(imageUrl);
    }
    if (!nullToAbsent || artworkLocalPath != null) {
      map['artwork_local_path'] = Variable<String>(artworkLocalPath);
    }
    if (!nullToAbsent || spriteUrl != null) {
      map['sprite_url'] = Variable<String>(spriteUrl);
    }
    if (!nullToAbsent || spriteLocalPath != null) {
      map['sprite_local_path'] = Variable<String>(spriteLocalPath);
    }
    if (!nullToAbsent || shinyArtworkUrl != null) {
      map['shiny_artwork_url'] = Variable<String>(shinyArtworkUrl);
    }
    if (!nullToAbsent || shinyArtworkLocalPath != null) {
      map['shiny_artwork_local_path'] = Variable<String>(shinyArtworkLocalPath);
    }
    if (!nullToAbsent || shinySpriteUrl != null) {
      map['shiny_sprite_url'] = Variable<String>(shinySpriteUrl);
    }
    if (!nullToAbsent || shinySpriteLocalPath != null) {
      map['shiny_sprite_local_path'] = Variable<String>(shinySpriteLocalPath);
    }
    if (!nullToAbsent || heightDecimeters != null) {
      map['height_decimeters'] = Variable<int>(heightDecimeters);
    }
    if (!nullToAbsent || weightHectograms != null) {
      map['weight_hectograms'] = Variable<int>(weightHectograms);
    }
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  PokemonsCompanion toCompanion(bool nullToAbsent) {
    return PokemonsCompanion(
      id: Value(id),
      nationalDexNumber: Value(nationalDexNumber),
      speciesId: speciesId == null && nullToAbsent
          ? const Value.absent()
          : Value(speciesId),
      isDefault: Value(isDefault),
      name: Value(name),
      imageUrl: imageUrl == null && nullToAbsent
          ? const Value.absent()
          : Value(imageUrl),
      artworkLocalPath: artworkLocalPath == null && nullToAbsent
          ? const Value.absent()
          : Value(artworkLocalPath),
      spriteUrl: spriteUrl == null && nullToAbsent
          ? const Value.absent()
          : Value(spriteUrl),
      spriteLocalPath: spriteLocalPath == null && nullToAbsent
          ? const Value.absent()
          : Value(spriteLocalPath),
      shinyArtworkUrl: shinyArtworkUrl == null && nullToAbsent
          ? const Value.absent()
          : Value(shinyArtworkUrl),
      shinyArtworkLocalPath: shinyArtworkLocalPath == null && nullToAbsent
          ? const Value.absent()
          : Value(shinyArtworkLocalPath),
      shinySpriteUrl: shinySpriteUrl == null && nullToAbsent
          ? const Value.absent()
          : Value(shinySpriteUrl),
      shinySpriteLocalPath: shinySpriteLocalPath == null && nullToAbsent
          ? const Value.absent()
          : Value(shinySpriteLocalPath),
      heightDecimeters: heightDecimeters == null && nullToAbsent
          ? const Value.absent()
          : Value(heightDecimeters),
      weightHectograms: weightHectograms == null && nullToAbsent
          ? const Value.absent()
          : Value(weightHectograms),
      updatedAt: Value(updatedAt),
    );
  }

  factory Pokemon.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Pokemon(
      id: serializer.fromJson<int>(json['id']),
      nationalDexNumber: serializer.fromJson<int>(json['nationalDexNumber']),
      speciesId: serializer.fromJson<int?>(json['speciesId']),
      isDefault: serializer.fromJson<bool>(json['isDefault']),
      name: serializer.fromJson<String>(json['name']),
      imageUrl: serializer.fromJson<String?>(json['imageUrl']),
      artworkLocalPath: serializer.fromJson<String?>(json['artworkLocalPath']),
      spriteUrl: serializer.fromJson<String?>(json['spriteUrl']),
      spriteLocalPath: serializer.fromJson<String?>(json['spriteLocalPath']),
      shinyArtworkUrl: serializer.fromJson<String?>(json['shinyArtworkUrl']),
      shinyArtworkLocalPath:
          serializer.fromJson<String?>(json['shinyArtworkLocalPath']),
      shinySpriteUrl: serializer.fromJson<String?>(json['shinySpriteUrl']),
      shinySpriteLocalPath:
          serializer.fromJson<String?>(json['shinySpriteLocalPath']),
      heightDecimeters: serializer.fromJson<int?>(json['heightDecimeters']),
      weightHectograms: serializer.fromJson<int?>(json['weightHectograms']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'nationalDexNumber': serializer.toJson<int>(nationalDexNumber),
      'speciesId': serializer.toJson<int?>(speciesId),
      'isDefault': serializer.toJson<bool>(isDefault),
      'name': serializer.toJson<String>(name),
      'imageUrl': serializer.toJson<String?>(imageUrl),
      'artworkLocalPath': serializer.toJson<String?>(artworkLocalPath),
      'spriteUrl': serializer.toJson<String?>(spriteUrl),
      'spriteLocalPath': serializer.toJson<String?>(spriteLocalPath),
      'shinyArtworkUrl': serializer.toJson<String?>(shinyArtworkUrl),
      'shinyArtworkLocalPath':
          serializer.toJson<String?>(shinyArtworkLocalPath),
      'shinySpriteUrl': serializer.toJson<String?>(shinySpriteUrl),
      'shinySpriteLocalPath': serializer.toJson<String?>(shinySpriteLocalPath),
      'heightDecimeters': serializer.toJson<int?>(heightDecimeters),
      'weightHectograms': serializer.toJson<int?>(weightHectograms),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  Pokemon copyWith(
          {int? id,
          int? nationalDexNumber,
          Value<int?> speciesId = const Value.absent(),
          bool? isDefault,
          String? name,
          Value<String?> imageUrl = const Value.absent(),
          Value<String?> artworkLocalPath = const Value.absent(),
          Value<String?> spriteUrl = const Value.absent(),
          Value<String?> spriteLocalPath = const Value.absent(),
          Value<String?> shinyArtworkUrl = const Value.absent(),
          Value<String?> shinyArtworkLocalPath = const Value.absent(),
          Value<String?> shinySpriteUrl = const Value.absent(),
          Value<String?> shinySpriteLocalPath = const Value.absent(),
          Value<int?> heightDecimeters = const Value.absent(),
          Value<int?> weightHectograms = const Value.absent(),
          DateTime? updatedAt}) =>
      Pokemon(
        id: id ?? this.id,
        nationalDexNumber: nationalDexNumber ?? this.nationalDexNumber,
        speciesId: speciesId.present ? speciesId.value : this.speciesId,
        isDefault: isDefault ?? this.isDefault,
        name: name ?? this.name,
        imageUrl: imageUrl.present ? imageUrl.value : this.imageUrl,
        artworkLocalPath: artworkLocalPath.present
            ? artworkLocalPath.value
            : this.artworkLocalPath,
        spriteUrl: spriteUrl.present ? spriteUrl.value : this.spriteUrl,
        spriteLocalPath: spriteLocalPath.present
            ? spriteLocalPath.value
            : this.spriteLocalPath,
        shinyArtworkUrl: shinyArtworkUrl.present
            ? shinyArtworkUrl.value
            : this.shinyArtworkUrl,
        shinyArtworkLocalPath: shinyArtworkLocalPath.present
            ? shinyArtworkLocalPath.value
            : this.shinyArtworkLocalPath,
        shinySpriteUrl:
            shinySpriteUrl.present ? shinySpriteUrl.value : this.shinySpriteUrl,
        shinySpriteLocalPath: shinySpriteLocalPath.present
            ? shinySpriteLocalPath.value
            : this.shinySpriteLocalPath,
        heightDecimeters: heightDecimeters.present
            ? heightDecimeters.value
            : this.heightDecimeters,
        weightHectograms: weightHectograms.present
            ? weightHectograms.value
            : this.weightHectograms,
        updatedAt: updatedAt ?? this.updatedAt,
      );
  Pokemon copyWithCompanion(PokemonsCompanion data) {
    return Pokemon(
      id: data.id.present ? data.id.value : this.id,
      nationalDexNumber: data.nationalDexNumber.present
          ? data.nationalDexNumber.value
          : this.nationalDexNumber,
      speciesId: data.speciesId.present ? data.speciesId.value : this.speciesId,
      isDefault: data.isDefault.present ? data.isDefault.value : this.isDefault,
      name: data.name.present ? data.name.value : this.name,
      imageUrl: data.imageUrl.present ? data.imageUrl.value : this.imageUrl,
      artworkLocalPath: data.artworkLocalPath.present
          ? data.artworkLocalPath.value
          : this.artworkLocalPath,
      spriteUrl: data.spriteUrl.present ? data.spriteUrl.value : this.spriteUrl,
      spriteLocalPath: data.spriteLocalPath.present
          ? data.spriteLocalPath.value
          : this.spriteLocalPath,
      shinyArtworkUrl: data.shinyArtworkUrl.present
          ? data.shinyArtworkUrl.value
          : this.shinyArtworkUrl,
      shinyArtworkLocalPath: data.shinyArtworkLocalPath.present
          ? data.shinyArtworkLocalPath.value
          : this.shinyArtworkLocalPath,
      shinySpriteUrl: data.shinySpriteUrl.present
          ? data.shinySpriteUrl.value
          : this.shinySpriteUrl,
      shinySpriteLocalPath: data.shinySpriteLocalPath.present
          ? data.shinySpriteLocalPath.value
          : this.shinySpriteLocalPath,
      heightDecimeters: data.heightDecimeters.present
          ? data.heightDecimeters.value
          : this.heightDecimeters,
      weightHectograms: data.weightHectograms.present
          ? data.weightHectograms.value
          : this.weightHectograms,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Pokemon(')
          ..write('id: $id, ')
          ..write('nationalDexNumber: $nationalDexNumber, ')
          ..write('speciesId: $speciesId, ')
          ..write('isDefault: $isDefault, ')
          ..write('name: $name, ')
          ..write('imageUrl: $imageUrl, ')
          ..write('artworkLocalPath: $artworkLocalPath, ')
          ..write('spriteUrl: $spriteUrl, ')
          ..write('spriteLocalPath: $spriteLocalPath, ')
          ..write('shinyArtworkUrl: $shinyArtworkUrl, ')
          ..write('shinyArtworkLocalPath: $shinyArtworkLocalPath, ')
          ..write('shinySpriteUrl: $shinySpriteUrl, ')
          ..write('shinySpriteLocalPath: $shinySpriteLocalPath, ')
          ..write('heightDecimeters: $heightDecimeters, ')
          ..write('weightHectograms: $weightHectograms, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      nationalDexNumber,
      speciesId,
      isDefault,
      name,
      imageUrl,
      artworkLocalPath,
      spriteUrl,
      spriteLocalPath,
      shinyArtworkUrl,
      shinyArtworkLocalPath,
      shinySpriteUrl,
      shinySpriteLocalPath,
      heightDecimeters,
      weightHectograms,
      updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Pokemon &&
          other.id == this.id &&
          other.nationalDexNumber == this.nationalDexNumber &&
          other.speciesId == this.speciesId &&
          other.isDefault == this.isDefault &&
          other.name == this.name &&
          other.imageUrl == this.imageUrl &&
          other.artworkLocalPath == this.artworkLocalPath &&
          other.spriteUrl == this.spriteUrl &&
          other.spriteLocalPath == this.spriteLocalPath &&
          other.shinyArtworkUrl == this.shinyArtworkUrl &&
          other.shinyArtworkLocalPath == this.shinyArtworkLocalPath &&
          other.shinySpriteUrl == this.shinySpriteUrl &&
          other.shinySpriteLocalPath == this.shinySpriteLocalPath &&
          other.heightDecimeters == this.heightDecimeters &&
          other.weightHectograms == this.weightHectograms &&
          other.updatedAt == this.updatedAt);
}

class PokemonsCompanion extends UpdateCompanion<Pokemon> {
  final Value<int> id;
  final Value<int> nationalDexNumber;
  final Value<int?> speciesId;
  final Value<bool> isDefault;
  final Value<String> name;
  final Value<String?> imageUrl;
  final Value<String?> artworkLocalPath;
  final Value<String?> spriteUrl;
  final Value<String?> spriteLocalPath;
  final Value<String?> shinyArtworkUrl;
  final Value<String?> shinyArtworkLocalPath;
  final Value<String?> shinySpriteUrl;
  final Value<String?> shinySpriteLocalPath;
  final Value<int?> heightDecimeters;
  final Value<int?> weightHectograms;
  final Value<DateTime> updatedAt;
  const PokemonsCompanion({
    this.id = const Value.absent(),
    this.nationalDexNumber = const Value.absent(),
    this.speciesId = const Value.absent(),
    this.isDefault = const Value.absent(),
    this.name = const Value.absent(),
    this.imageUrl = const Value.absent(),
    this.artworkLocalPath = const Value.absent(),
    this.spriteUrl = const Value.absent(),
    this.spriteLocalPath = const Value.absent(),
    this.shinyArtworkUrl = const Value.absent(),
    this.shinyArtworkLocalPath = const Value.absent(),
    this.shinySpriteUrl = const Value.absent(),
    this.shinySpriteLocalPath = const Value.absent(),
    this.heightDecimeters = const Value.absent(),
    this.weightHectograms = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  PokemonsCompanion.insert({
    this.id = const Value.absent(),
    required int nationalDexNumber,
    this.speciesId = const Value.absent(),
    this.isDefault = const Value.absent(),
    required String name,
    this.imageUrl = const Value.absent(),
    this.artworkLocalPath = const Value.absent(),
    this.spriteUrl = const Value.absent(),
    this.spriteLocalPath = const Value.absent(),
    this.shinyArtworkUrl = const Value.absent(),
    this.shinyArtworkLocalPath = const Value.absent(),
    this.shinySpriteUrl = const Value.absent(),
    this.shinySpriteLocalPath = const Value.absent(),
    this.heightDecimeters = const Value.absent(),
    this.weightHectograms = const Value.absent(),
    this.updatedAt = const Value.absent(),
  })  : nationalDexNumber = Value(nationalDexNumber),
        name = Value(name);
  static Insertable<Pokemon> custom({
    Expression<int>? id,
    Expression<int>? nationalDexNumber,
    Expression<int>? speciesId,
    Expression<bool>? isDefault,
    Expression<String>? name,
    Expression<String>? imageUrl,
    Expression<String>? artworkLocalPath,
    Expression<String>? spriteUrl,
    Expression<String>? spriteLocalPath,
    Expression<String>? shinyArtworkUrl,
    Expression<String>? shinyArtworkLocalPath,
    Expression<String>? shinySpriteUrl,
    Expression<String>? shinySpriteLocalPath,
    Expression<int>? heightDecimeters,
    Expression<int>? weightHectograms,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (nationalDexNumber != null) 'national_dex_number': nationalDexNumber,
      if (speciesId != null) 'species_id': speciesId,
      if (isDefault != null) 'is_default': isDefault,
      if (name != null) 'name': name,
      if (imageUrl != null) 'image_url': imageUrl,
      if (artworkLocalPath != null) 'artwork_local_path': artworkLocalPath,
      if (spriteUrl != null) 'sprite_url': spriteUrl,
      if (spriteLocalPath != null) 'sprite_local_path': spriteLocalPath,
      if (shinyArtworkUrl != null) 'shiny_artwork_url': shinyArtworkUrl,
      if (shinyArtworkLocalPath != null)
        'shiny_artwork_local_path': shinyArtworkLocalPath,
      if (shinySpriteUrl != null) 'shiny_sprite_url': shinySpriteUrl,
      if (shinySpriteLocalPath != null)
        'shiny_sprite_local_path': shinySpriteLocalPath,
      if (heightDecimeters != null) 'height_decimeters': heightDecimeters,
      if (weightHectograms != null) 'weight_hectograms': weightHectograms,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  PokemonsCompanion copyWith(
      {Value<int>? id,
      Value<int>? nationalDexNumber,
      Value<int?>? speciesId,
      Value<bool>? isDefault,
      Value<String>? name,
      Value<String?>? imageUrl,
      Value<String?>? artworkLocalPath,
      Value<String?>? spriteUrl,
      Value<String?>? spriteLocalPath,
      Value<String?>? shinyArtworkUrl,
      Value<String?>? shinyArtworkLocalPath,
      Value<String?>? shinySpriteUrl,
      Value<String?>? shinySpriteLocalPath,
      Value<int?>? heightDecimeters,
      Value<int?>? weightHectograms,
      Value<DateTime>? updatedAt}) {
    return PokemonsCompanion(
      id: id ?? this.id,
      nationalDexNumber: nationalDexNumber ?? this.nationalDexNumber,
      speciesId: speciesId ?? this.speciesId,
      isDefault: isDefault ?? this.isDefault,
      name: name ?? this.name,
      imageUrl: imageUrl ?? this.imageUrl,
      artworkLocalPath: artworkLocalPath ?? this.artworkLocalPath,
      spriteUrl: spriteUrl ?? this.spriteUrl,
      spriteLocalPath: spriteLocalPath ?? this.spriteLocalPath,
      shinyArtworkUrl: shinyArtworkUrl ?? this.shinyArtworkUrl,
      shinyArtworkLocalPath:
          shinyArtworkLocalPath ?? this.shinyArtworkLocalPath,
      shinySpriteUrl: shinySpriteUrl ?? this.shinySpriteUrl,
      shinySpriteLocalPath: shinySpriteLocalPath ?? this.shinySpriteLocalPath,
      heightDecimeters: heightDecimeters ?? this.heightDecimeters,
      weightHectograms: weightHectograms ?? this.weightHectograms,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (nationalDexNumber.present) {
      map['national_dex_number'] = Variable<int>(nationalDexNumber.value);
    }
    if (speciesId.present) {
      map['species_id'] = Variable<int>(speciesId.value);
    }
    if (isDefault.present) {
      map['is_default'] = Variable<bool>(isDefault.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (imageUrl.present) {
      map['image_url'] = Variable<String>(imageUrl.value);
    }
    if (artworkLocalPath.present) {
      map['artwork_local_path'] = Variable<String>(artworkLocalPath.value);
    }
    if (spriteUrl.present) {
      map['sprite_url'] = Variable<String>(spriteUrl.value);
    }
    if (spriteLocalPath.present) {
      map['sprite_local_path'] = Variable<String>(spriteLocalPath.value);
    }
    if (shinyArtworkUrl.present) {
      map['shiny_artwork_url'] = Variable<String>(shinyArtworkUrl.value);
    }
    if (shinyArtworkLocalPath.present) {
      map['shiny_artwork_local_path'] =
          Variable<String>(shinyArtworkLocalPath.value);
    }
    if (shinySpriteUrl.present) {
      map['shiny_sprite_url'] = Variable<String>(shinySpriteUrl.value);
    }
    if (shinySpriteLocalPath.present) {
      map['shiny_sprite_local_path'] =
          Variable<String>(shinySpriteLocalPath.value);
    }
    if (heightDecimeters.present) {
      map['height_decimeters'] = Variable<int>(heightDecimeters.value);
    }
    if (weightHectograms.present) {
      map['weight_hectograms'] = Variable<int>(weightHectograms.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PokemonsCompanion(')
          ..write('id: $id, ')
          ..write('nationalDexNumber: $nationalDexNumber, ')
          ..write('speciesId: $speciesId, ')
          ..write('isDefault: $isDefault, ')
          ..write('name: $name, ')
          ..write('imageUrl: $imageUrl, ')
          ..write('artworkLocalPath: $artworkLocalPath, ')
          ..write('spriteUrl: $spriteUrl, ')
          ..write('spriteLocalPath: $spriteLocalPath, ')
          ..write('shinyArtworkUrl: $shinyArtworkUrl, ')
          ..write('shinyArtworkLocalPath: $shinyArtworkLocalPath, ')
          ..write('shinySpriteUrl: $shinySpriteUrl, ')
          ..write('shinySpriteLocalPath: $shinySpriteLocalPath, ')
          ..write('heightDecimeters: $heightDecimeters, ')
          ..write('weightHectograms: $weightHectograms, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $TypesTable extends Types with TableInfo<$TypesTable, Type> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TypesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'));
  @override
  List<GeneratedColumn> get $columns => [id, name];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'type';
  @override
  VerificationContext validateIntegrity(Insertable<Type> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Type map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Type(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
    );
  }

  @override
  $TypesTable createAlias(String alias) {
    return $TypesTable(attachedDatabase, alias);
  }
}

class Type extends DataClass implements Insertable<Type> {
  final int id;
  final String name;
  const Type({required this.id, required this.name});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    return map;
  }

  TypesCompanion toCompanion(bool nullToAbsent) {
    return TypesCompanion(
      id: Value(id),
      name: Value(name),
    );
  }

  factory Type.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Type(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
    };
  }

  Type copyWith({int? id, String? name}) => Type(
        id: id ?? this.id,
        name: name ?? this.name,
      );
  Type copyWithCompanion(TypesCompanion data) {
    return Type(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Type(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Type && other.id == this.id && other.name == this.name);
}

class TypesCompanion extends UpdateCompanion<Type> {
  final Value<int> id;
  final Value<String> name;
  const TypesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
  });
  TypesCompanion.insert({
    this.id = const Value.absent(),
    required String name,
  }) : name = Value(name);
  static Insertable<Type> custom({
    Expression<int>? id,
    Expression<String>? name,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
    });
  }

  TypesCompanion copyWith({Value<int>? id, Value<String>? name}) {
    return TypesCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TypesCompanion(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }
}

class $PokemonTypesTable extends PokemonTypes
    with TableInfo<$PokemonTypesTable, PokemonType> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PokemonTypesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _pokemonIdMeta =
      const VerificationMeta('pokemonId');
  @override
  late final GeneratedColumn<int> pokemonId = GeneratedColumn<int>(
      'pokemon_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES pokemon (id)'));
  static const VerificationMeta _typeIdMeta = const VerificationMeta('typeId');
  @override
  late final GeneratedColumn<int> typeId = GeneratedColumn<int>(
      'type_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES type (id)'));
  static const VerificationMeta _slotMeta = const VerificationMeta('slot');
  @override
  late final GeneratedColumn<int> slot = GeneratedColumn<int>(
      'slot', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [pokemonId, typeId, slot];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'pokemon_type';
  @override
  VerificationContext validateIntegrity(Insertable<PokemonType> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('pokemon_id')) {
      context.handle(_pokemonIdMeta,
          pokemonId.isAcceptableOrUnknown(data['pokemon_id']!, _pokemonIdMeta));
    } else if (isInserting) {
      context.missing(_pokemonIdMeta);
    }
    if (data.containsKey('type_id')) {
      context.handle(_typeIdMeta,
          typeId.isAcceptableOrUnknown(data['type_id']!, _typeIdMeta));
    } else if (isInserting) {
      context.missing(_typeIdMeta);
    }
    if (data.containsKey('slot')) {
      context.handle(
          _slotMeta, slot.isAcceptableOrUnknown(data['slot']!, _slotMeta));
    } else if (isInserting) {
      context.missing(_slotMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {pokemonId, typeId};
  @override
  List<Set<GeneratedColumn>> get uniqueKeys => [
        {pokemonId, slot},
      ];
  @override
  PokemonType map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PokemonType(
      pokemonId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}pokemon_id'])!,
      typeId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}type_id'])!,
      slot: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}slot'])!,
    );
  }

  @override
  $PokemonTypesTable createAlias(String alias) {
    return $PokemonTypesTable(attachedDatabase, alias);
  }
}

class PokemonType extends DataClass implements Insertable<PokemonType> {
  final int pokemonId;
  final int typeId;
  final int slot;
  const PokemonType(
      {required this.pokemonId, required this.typeId, required this.slot});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['pokemon_id'] = Variable<int>(pokemonId);
    map['type_id'] = Variable<int>(typeId);
    map['slot'] = Variable<int>(slot);
    return map;
  }

  PokemonTypesCompanion toCompanion(bool nullToAbsent) {
    return PokemonTypesCompanion(
      pokemonId: Value(pokemonId),
      typeId: Value(typeId),
      slot: Value(slot),
    );
  }

  factory PokemonType.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PokemonType(
      pokemonId: serializer.fromJson<int>(json['pokemonId']),
      typeId: serializer.fromJson<int>(json['typeId']),
      slot: serializer.fromJson<int>(json['slot']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'pokemonId': serializer.toJson<int>(pokemonId),
      'typeId': serializer.toJson<int>(typeId),
      'slot': serializer.toJson<int>(slot),
    };
  }

  PokemonType copyWith({int? pokemonId, int? typeId, int? slot}) => PokemonType(
        pokemonId: pokemonId ?? this.pokemonId,
        typeId: typeId ?? this.typeId,
        slot: slot ?? this.slot,
      );
  PokemonType copyWithCompanion(PokemonTypesCompanion data) {
    return PokemonType(
      pokemonId: data.pokemonId.present ? data.pokemonId.value : this.pokemonId,
      typeId: data.typeId.present ? data.typeId.value : this.typeId,
      slot: data.slot.present ? data.slot.value : this.slot,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PokemonType(')
          ..write('pokemonId: $pokemonId, ')
          ..write('typeId: $typeId, ')
          ..write('slot: $slot')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(pokemonId, typeId, slot);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PokemonType &&
          other.pokemonId == this.pokemonId &&
          other.typeId == this.typeId &&
          other.slot == this.slot);
}

class PokemonTypesCompanion extends UpdateCompanion<PokemonType> {
  final Value<int> pokemonId;
  final Value<int> typeId;
  final Value<int> slot;
  final Value<int> rowid;
  const PokemonTypesCompanion({
    this.pokemonId = const Value.absent(),
    this.typeId = const Value.absent(),
    this.slot = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  PokemonTypesCompanion.insert({
    required int pokemonId,
    required int typeId,
    required int slot,
    this.rowid = const Value.absent(),
  })  : pokemonId = Value(pokemonId),
        typeId = Value(typeId),
        slot = Value(slot);
  static Insertable<PokemonType> custom({
    Expression<int>? pokemonId,
    Expression<int>? typeId,
    Expression<int>? slot,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (pokemonId != null) 'pokemon_id': pokemonId,
      if (typeId != null) 'type_id': typeId,
      if (slot != null) 'slot': slot,
      if (rowid != null) 'rowid': rowid,
    });
  }

  PokemonTypesCompanion copyWith(
      {Value<int>? pokemonId,
      Value<int>? typeId,
      Value<int>? slot,
      Value<int>? rowid}) {
    return PokemonTypesCompanion(
      pokemonId: pokemonId ?? this.pokemonId,
      typeId: typeId ?? this.typeId,
      slot: slot ?? this.slot,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (pokemonId.present) {
      map['pokemon_id'] = Variable<int>(pokemonId.value);
    }
    if (typeId.present) {
      map['type_id'] = Variable<int>(typeId.value);
    }
    if (slot.present) {
      map['slot'] = Variable<int>(slot.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PokemonTypesCompanion(')
          ..write('pokemonId: $pokemonId, ')
          ..write('typeId: $typeId, ')
          ..write('slot: $slot, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $PokemonStatsTable extends PokemonStats
    with TableInfo<$PokemonStatsTable, PokemonStat> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PokemonStatsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _pokemonIdMeta =
      const VerificationMeta('pokemonId');
  @override
  late final GeneratedColumn<int> pokemonId = GeneratedColumn<int>(
      'pokemon_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES pokemon (id)'));
  static const VerificationMeta _hpMeta = const VerificationMeta('hp');
  @override
  late final GeneratedColumn<int> hp = GeneratedColumn<int>(
      'hp', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _attackMeta = const VerificationMeta('attack');
  @override
  late final GeneratedColumn<int> attack = GeneratedColumn<int>(
      'attack', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _defenseMeta =
      const VerificationMeta('defense');
  @override
  late final GeneratedColumn<int> defense = GeneratedColumn<int>(
      'defense', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _specialAttackMeta =
      const VerificationMeta('specialAttack');
  @override
  late final GeneratedColumn<int> specialAttack = GeneratedColumn<int>(
      'special_attack', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _specialDefenseMeta =
      const VerificationMeta('specialDefense');
  @override
  late final GeneratedColumn<int> specialDefense = GeneratedColumn<int>(
      'special_defense', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _speedMeta = const VerificationMeta('speed');
  @override
  late final GeneratedColumn<int> speed = GeneratedColumn<int>(
      'speed', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [pokemonId, hp, attack, defense, specialAttack, specialDefense, speed];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'pokemon_stats';
  @override
  VerificationContext validateIntegrity(Insertable<PokemonStat> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('pokemon_id')) {
      context.handle(_pokemonIdMeta,
          pokemonId.isAcceptableOrUnknown(data['pokemon_id']!, _pokemonIdMeta));
    }
    if (data.containsKey('hp')) {
      context.handle(_hpMeta, hp.isAcceptableOrUnknown(data['hp']!, _hpMeta));
    } else if (isInserting) {
      context.missing(_hpMeta);
    }
    if (data.containsKey('attack')) {
      context.handle(_attackMeta,
          attack.isAcceptableOrUnknown(data['attack']!, _attackMeta));
    } else if (isInserting) {
      context.missing(_attackMeta);
    }
    if (data.containsKey('defense')) {
      context.handle(_defenseMeta,
          defense.isAcceptableOrUnknown(data['defense']!, _defenseMeta));
    } else if (isInserting) {
      context.missing(_defenseMeta);
    }
    if (data.containsKey('special_attack')) {
      context.handle(
          _specialAttackMeta,
          specialAttack.isAcceptableOrUnknown(
              data['special_attack']!, _specialAttackMeta));
    } else if (isInserting) {
      context.missing(_specialAttackMeta);
    }
    if (data.containsKey('special_defense')) {
      context.handle(
          _specialDefenseMeta,
          specialDefense.isAcceptableOrUnknown(
              data['special_defense']!, _specialDefenseMeta));
    } else if (isInserting) {
      context.missing(_specialDefenseMeta);
    }
    if (data.containsKey('speed')) {
      context.handle(
          _speedMeta, speed.isAcceptableOrUnknown(data['speed']!, _speedMeta));
    } else if (isInserting) {
      context.missing(_speedMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {pokemonId};
  @override
  PokemonStat map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PokemonStat(
      pokemonId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}pokemon_id'])!,
      hp: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}hp'])!,
      attack: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}attack'])!,
      defense: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}defense'])!,
      specialAttack: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}special_attack'])!,
      specialDefense: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}special_defense'])!,
      speed: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}speed'])!,
    );
  }

  @override
  $PokemonStatsTable createAlias(String alias) {
    return $PokemonStatsTable(attachedDatabase, alias);
  }
}

class PokemonStat extends DataClass implements Insertable<PokemonStat> {
  final int pokemonId;
  final int hp;
  final int attack;
  final int defense;
  final int specialAttack;
  final int specialDefense;
  final int speed;
  const PokemonStat(
      {required this.pokemonId,
      required this.hp,
      required this.attack,
      required this.defense,
      required this.specialAttack,
      required this.specialDefense,
      required this.speed});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['pokemon_id'] = Variable<int>(pokemonId);
    map['hp'] = Variable<int>(hp);
    map['attack'] = Variable<int>(attack);
    map['defense'] = Variable<int>(defense);
    map['special_attack'] = Variable<int>(specialAttack);
    map['special_defense'] = Variable<int>(specialDefense);
    map['speed'] = Variable<int>(speed);
    return map;
  }

  PokemonStatsCompanion toCompanion(bool nullToAbsent) {
    return PokemonStatsCompanion(
      pokemonId: Value(pokemonId),
      hp: Value(hp),
      attack: Value(attack),
      defense: Value(defense),
      specialAttack: Value(specialAttack),
      specialDefense: Value(specialDefense),
      speed: Value(speed),
    );
  }

  factory PokemonStat.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PokemonStat(
      pokemonId: serializer.fromJson<int>(json['pokemonId']),
      hp: serializer.fromJson<int>(json['hp']),
      attack: serializer.fromJson<int>(json['attack']),
      defense: serializer.fromJson<int>(json['defense']),
      specialAttack: serializer.fromJson<int>(json['specialAttack']),
      specialDefense: serializer.fromJson<int>(json['specialDefense']),
      speed: serializer.fromJson<int>(json['speed']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'pokemonId': serializer.toJson<int>(pokemonId),
      'hp': serializer.toJson<int>(hp),
      'attack': serializer.toJson<int>(attack),
      'defense': serializer.toJson<int>(defense),
      'specialAttack': serializer.toJson<int>(specialAttack),
      'specialDefense': serializer.toJson<int>(specialDefense),
      'speed': serializer.toJson<int>(speed),
    };
  }

  PokemonStat copyWith(
          {int? pokemonId,
          int? hp,
          int? attack,
          int? defense,
          int? specialAttack,
          int? specialDefense,
          int? speed}) =>
      PokemonStat(
        pokemonId: pokemonId ?? this.pokemonId,
        hp: hp ?? this.hp,
        attack: attack ?? this.attack,
        defense: defense ?? this.defense,
        specialAttack: specialAttack ?? this.specialAttack,
        specialDefense: specialDefense ?? this.specialDefense,
        speed: speed ?? this.speed,
      );
  PokemonStat copyWithCompanion(PokemonStatsCompanion data) {
    return PokemonStat(
      pokemonId: data.pokemonId.present ? data.pokemonId.value : this.pokemonId,
      hp: data.hp.present ? data.hp.value : this.hp,
      attack: data.attack.present ? data.attack.value : this.attack,
      defense: data.defense.present ? data.defense.value : this.defense,
      specialAttack: data.specialAttack.present
          ? data.specialAttack.value
          : this.specialAttack,
      specialDefense: data.specialDefense.present
          ? data.specialDefense.value
          : this.specialDefense,
      speed: data.speed.present ? data.speed.value : this.speed,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PokemonStat(')
          ..write('pokemonId: $pokemonId, ')
          ..write('hp: $hp, ')
          ..write('attack: $attack, ')
          ..write('defense: $defense, ')
          ..write('specialAttack: $specialAttack, ')
          ..write('specialDefense: $specialDefense, ')
          ..write('speed: $speed')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      pokemonId, hp, attack, defense, specialAttack, specialDefense, speed);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PokemonStat &&
          other.pokemonId == this.pokemonId &&
          other.hp == this.hp &&
          other.attack == this.attack &&
          other.defense == this.defense &&
          other.specialAttack == this.specialAttack &&
          other.specialDefense == this.specialDefense &&
          other.speed == this.speed);
}

class PokemonStatsCompanion extends UpdateCompanion<PokemonStat> {
  final Value<int> pokemonId;
  final Value<int> hp;
  final Value<int> attack;
  final Value<int> defense;
  final Value<int> specialAttack;
  final Value<int> specialDefense;
  final Value<int> speed;
  const PokemonStatsCompanion({
    this.pokemonId = const Value.absent(),
    this.hp = const Value.absent(),
    this.attack = const Value.absent(),
    this.defense = const Value.absent(),
    this.specialAttack = const Value.absent(),
    this.specialDefense = const Value.absent(),
    this.speed = const Value.absent(),
  });
  PokemonStatsCompanion.insert({
    this.pokemonId = const Value.absent(),
    required int hp,
    required int attack,
    required int defense,
    required int specialAttack,
    required int specialDefense,
    required int speed,
  })  : hp = Value(hp),
        attack = Value(attack),
        defense = Value(defense),
        specialAttack = Value(specialAttack),
        specialDefense = Value(specialDefense),
        speed = Value(speed);
  static Insertable<PokemonStat> custom({
    Expression<int>? pokemonId,
    Expression<int>? hp,
    Expression<int>? attack,
    Expression<int>? defense,
    Expression<int>? specialAttack,
    Expression<int>? specialDefense,
    Expression<int>? speed,
  }) {
    return RawValuesInsertable({
      if (pokemonId != null) 'pokemon_id': pokemonId,
      if (hp != null) 'hp': hp,
      if (attack != null) 'attack': attack,
      if (defense != null) 'defense': defense,
      if (specialAttack != null) 'special_attack': specialAttack,
      if (specialDefense != null) 'special_defense': specialDefense,
      if (speed != null) 'speed': speed,
    });
  }

  PokemonStatsCompanion copyWith(
      {Value<int>? pokemonId,
      Value<int>? hp,
      Value<int>? attack,
      Value<int>? defense,
      Value<int>? specialAttack,
      Value<int>? specialDefense,
      Value<int>? speed}) {
    return PokemonStatsCompanion(
      pokemonId: pokemonId ?? this.pokemonId,
      hp: hp ?? this.hp,
      attack: attack ?? this.attack,
      defense: defense ?? this.defense,
      specialAttack: specialAttack ?? this.specialAttack,
      specialDefense: specialDefense ?? this.specialDefense,
      speed: speed ?? this.speed,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (pokemonId.present) {
      map['pokemon_id'] = Variable<int>(pokemonId.value);
    }
    if (hp.present) {
      map['hp'] = Variable<int>(hp.value);
    }
    if (attack.present) {
      map['attack'] = Variable<int>(attack.value);
    }
    if (defense.present) {
      map['defense'] = Variable<int>(defense.value);
    }
    if (specialAttack.present) {
      map['special_attack'] = Variable<int>(specialAttack.value);
    }
    if (specialDefense.present) {
      map['special_defense'] = Variable<int>(specialDefense.value);
    }
    if (speed.present) {
      map['speed'] = Variable<int>(speed.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PokemonStatsCompanion(')
          ..write('pokemonId: $pokemonId, ')
          ..write('hp: $hp, ')
          ..write('attack: $attack, ')
          ..write('defense: $defense, ')
          ..write('specialAttack: $specialAttack, ')
          ..write('specialDefense: $specialDefense, ')
          ..write('speed: $speed')
          ..write(')'))
        .toString();
  }
}

class $AbilitiesTable extends Abilities
    with TableInfo<$AbilitiesTable, Ability> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AbilitiesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _effectSummaryMeta =
      const VerificationMeta('effectSummary');
  @override
  late final GeneratedColumn<String> effectSummary = GeneratedColumn<String>(
      'effect_summary', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [id, name, effectSummary];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'ability';
  @override
  VerificationContext validateIntegrity(Insertable<Ability> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('effect_summary')) {
      context.handle(
          _effectSummaryMeta,
          effectSummary.isAcceptableOrUnknown(
              data['effect_summary']!, _effectSummaryMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Ability map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Ability(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      effectSummary: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}effect_summary']),
    );
  }

  @override
  $AbilitiesTable createAlias(String alias) {
    return $AbilitiesTable(attachedDatabase, alias);
  }
}

class Ability extends DataClass implements Insertable<Ability> {
  final int id;
  final String name;
  final String? effectSummary;
  const Ability({required this.id, required this.name, this.effectSummary});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || effectSummary != null) {
      map['effect_summary'] = Variable<String>(effectSummary);
    }
    return map;
  }

  AbilitiesCompanion toCompanion(bool nullToAbsent) {
    return AbilitiesCompanion(
      id: Value(id),
      name: Value(name),
      effectSummary: effectSummary == null && nullToAbsent
          ? const Value.absent()
          : Value(effectSummary),
    );
  }

  factory Ability.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Ability(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      effectSummary: serializer.fromJson<String?>(json['effectSummary']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'effectSummary': serializer.toJson<String?>(effectSummary),
    };
  }

  Ability copyWith(
          {int? id,
          String? name,
          Value<String?> effectSummary = const Value.absent()}) =>
      Ability(
        id: id ?? this.id,
        name: name ?? this.name,
        effectSummary:
            effectSummary.present ? effectSummary.value : this.effectSummary,
      );
  Ability copyWithCompanion(AbilitiesCompanion data) {
    return Ability(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      effectSummary: data.effectSummary.present
          ? data.effectSummary.value
          : this.effectSummary,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Ability(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('effectSummary: $effectSummary')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, effectSummary);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Ability &&
          other.id == this.id &&
          other.name == this.name &&
          other.effectSummary == this.effectSummary);
}

class AbilitiesCompanion extends UpdateCompanion<Ability> {
  final Value<int> id;
  final Value<String> name;
  final Value<String?> effectSummary;
  const AbilitiesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.effectSummary = const Value.absent(),
  });
  AbilitiesCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    this.effectSummary = const Value.absent(),
  }) : name = Value(name);
  static Insertable<Ability> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? effectSummary,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (effectSummary != null) 'effect_summary': effectSummary,
    });
  }

  AbilitiesCompanion copyWith(
      {Value<int>? id, Value<String>? name, Value<String?>? effectSummary}) {
    return AbilitiesCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      effectSummary: effectSummary ?? this.effectSummary,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (effectSummary.present) {
      map['effect_summary'] = Variable<String>(effectSummary.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AbilitiesCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('effectSummary: $effectSummary')
          ..write(')'))
        .toString();
  }
}

class $PokemonAbilitiesTable extends PokemonAbilities
    with TableInfo<$PokemonAbilitiesTable, PokemonAbility> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PokemonAbilitiesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _pokemonIdMeta =
      const VerificationMeta('pokemonId');
  @override
  late final GeneratedColumn<int> pokemonId = GeneratedColumn<int>(
      'pokemon_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES pokemon (id)'));
  static const VerificationMeta _abilityIdMeta =
      const VerificationMeta('abilityId');
  @override
  late final GeneratedColumn<int> abilityId = GeneratedColumn<int>(
      'ability_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES ability (id)'));
  static const VerificationMeta _isHiddenMeta =
      const VerificationMeta('isHidden');
  @override
  late final GeneratedColumn<bool> isHidden = GeneratedColumn<bool>(
      'is_hidden', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_hidden" IN (0, 1))'));
  static const VerificationMeta _slotMeta = const VerificationMeta('slot');
  @override
  late final GeneratedColumn<int> slot = GeneratedColumn<int>(
      'slot', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [pokemonId, abilityId, isHidden, slot];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'pokemon_ability';
  @override
  VerificationContext validateIntegrity(Insertable<PokemonAbility> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('pokemon_id')) {
      context.handle(_pokemonIdMeta,
          pokemonId.isAcceptableOrUnknown(data['pokemon_id']!, _pokemonIdMeta));
    } else if (isInserting) {
      context.missing(_pokemonIdMeta);
    }
    if (data.containsKey('ability_id')) {
      context.handle(_abilityIdMeta,
          abilityId.isAcceptableOrUnknown(data['ability_id']!, _abilityIdMeta));
    } else if (isInserting) {
      context.missing(_abilityIdMeta);
    }
    if (data.containsKey('is_hidden')) {
      context.handle(_isHiddenMeta,
          isHidden.isAcceptableOrUnknown(data['is_hidden']!, _isHiddenMeta));
    } else if (isInserting) {
      context.missing(_isHiddenMeta);
    }
    if (data.containsKey('slot')) {
      context.handle(
          _slotMeta, slot.isAcceptableOrUnknown(data['slot']!, _slotMeta));
    } else if (isInserting) {
      context.missing(_slotMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {pokemonId, abilityId};
  @override
  List<Set<GeneratedColumn>> get uniqueKeys => [
        {pokemonId, slot},
      ];
  @override
  PokemonAbility map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PokemonAbility(
      pokemonId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}pokemon_id'])!,
      abilityId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}ability_id'])!,
      isHidden: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_hidden'])!,
      slot: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}slot'])!,
    );
  }

  @override
  $PokemonAbilitiesTable createAlias(String alias) {
    return $PokemonAbilitiesTable(attachedDatabase, alias);
  }
}

class PokemonAbility extends DataClass implements Insertable<PokemonAbility> {
  final int pokemonId;
  final int abilityId;
  final bool isHidden;
  final int slot;
  const PokemonAbility(
      {required this.pokemonId,
      required this.abilityId,
      required this.isHidden,
      required this.slot});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['pokemon_id'] = Variable<int>(pokemonId);
    map['ability_id'] = Variable<int>(abilityId);
    map['is_hidden'] = Variable<bool>(isHidden);
    map['slot'] = Variable<int>(slot);
    return map;
  }

  PokemonAbilitiesCompanion toCompanion(bool nullToAbsent) {
    return PokemonAbilitiesCompanion(
      pokemonId: Value(pokemonId),
      abilityId: Value(abilityId),
      isHidden: Value(isHidden),
      slot: Value(slot),
    );
  }

  factory PokemonAbility.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PokemonAbility(
      pokemonId: serializer.fromJson<int>(json['pokemonId']),
      abilityId: serializer.fromJson<int>(json['abilityId']),
      isHidden: serializer.fromJson<bool>(json['isHidden']),
      slot: serializer.fromJson<int>(json['slot']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'pokemonId': serializer.toJson<int>(pokemonId),
      'abilityId': serializer.toJson<int>(abilityId),
      'isHidden': serializer.toJson<bool>(isHidden),
      'slot': serializer.toJson<int>(slot),
    };
  }

  PokemonAbility copyWith(
          {int? pokemonId, int? abilityId, bool? isHidden, int? slot}) =>
      PokemonAbility(
        pokemonId: pokemonId ?? this.pokemonId,
        abilityId: abilityId ?? this.abilityId,
        isHidden: isHidden ?? this.isHidden,
        slot: slot ?? this.slot,
      );
  PokemonAbility copyWithCompanion(PokemonAbilitiesCompanion data) {
    return PokemonAbility(
      pokemonId: data.pokemonId.present ? data.pokemonId.value : this.pokemonId,
      abilityId: data.abilityId.present ? data.abilityId.value : this.abilityId,
      isHidden: data.isHidden.present ? data.isHidden.value : this.isHidden,
      slot: data.slot.present ? data.slot.value : this.slot,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PokemonAbility(')
          ..write('pokemonId: $pokemonId, ')
          ..write('abilityId: $abilityId, ')
          ..write('isHidden: $isHidden, ')
          ..write('slot: $slot')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(pokemonId, abilityId, isHidden, slot);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PokemonAbility &&
          other.pokemonId == this.pokemonId &&
          other.abilityId == this.abilityId &&
          other.isHidden == this.isHidden &&
          other.slot == this.slot);
}

class PokemonAbilitiesCompanion extends UpdateCompanion<PokemonAbility> {
  final Value<int> pokemonId;
  final Value<int> abilityId;
  final Value<bool> isHidden;
  final Value<int> slot;
  final Value<int> rowid;
  const PokemonAbilitiesCompanion({
    this.pokemonId = const Value.absent(),
    this.abilityId = const Value.absent(),
    this.isHidden = const Value.absent(),
    this.slot = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  PokemonAbilitiesCompanion.insert({
    required int pokemonId,
    required int abilityId,
    required bool isHidden,
    required int slot,
    this.rowid = const Value.absent(),
  })  : pokemonId = Value(pokemonId),
        abilityId = Value(abilityId),
        isHidden = Value(isHidden),
        slot = Value(slot);
  static Insertable<PokemonAbility> custom({
    Expression<int>? pokemonId,
    Expression<int>? abilityId,
    Expression<bool>? isHidden,
    Expression<int>? slot,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (pokemonId != null) 'pokemon_id': pokemonId,
      if (abilityId != null) 'ability_id': abilityId,
      if (isHidden != null) 'is_hidden': isHidden,
      if (slot != null) 'slot': slot,
      if (rowid != null) 'rowid': rowid,
    });
  }

  PokemonAbilitiesCompanion copyWith(
      {Value<int>? pokemonId,
      Value<int>? abilityId,
      Value<bool>? isHidden,
      Value<int>? slot,
      Value<int>? rowid}) {
    return PokemonAbilitiesCompanion(
      pokemonId: pokemonId ?? this.pokemonId,
      abilityId: abilityId ?? this.abilityId,
      isHidden: isHidden ?? this.isHidden,
      slot: slot ?? this.slot,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (pokemonId.present) {
      map['pokemon_id'] = Variable<int>(pokemonId.value);
    }
    if (abilityId.present) {
      map['ability_id'] = Variable<int>(abilityId.value);
    }
    if (isHidden.present) {
      map['is_hidden'] = Variable<bool>(isHidden.value);
    }
    if (slot.present) {
      map['slot'] = Variable<int>(slot.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PokemonAbilitiesCompanion(')
          ..write('pokemonId: $pokemonId, ')
          ..write('abilityId: $abilityId, ')
          ..write('isHidden: $isHidden, ')
          ..write('slot: $slot, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $MovesTable extends Moves with TableInfo<$MovesTable, Move> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MovesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, name];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'move';
  @override
  VerificationContext validateIntegrity(Insertable<Move> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Move map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Move(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
    );
  }

  @override
  $MovesTable createAlias(String alias) {
    return $MovesTable(attachedDatabase, alias);
  }
}

class Move extends DataClass implements Insertable<Move> {
  final int id;
  final String name;
  const Move({required this.id, required this.name});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    return map;
  }

  MovesCompanion toCompanion(bool nullToAbsent) {
    return MovesCompanion(
      id: Value(id),
      name: Value(name),
    );
  }

  factory Move.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Move(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
    };
  }

  Move copyWith({int? id, String? name}) => Move(
        id: id ?? this.id,
        name: name ?? this.name,
      );
  Move copyWithCompanion(MovesCompanion data) {
    return Move(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Move(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Move && other.id == this.id && other.name == this.name);
}

class MovesCompanion extends UpdateCompanion<Move> {
  final Value<int> id;
  final Value<String> name;
  const MovesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
  });
  MovesCompanion.insert({
    this.id = const Value.absent(),
    required String name,
  }) : name = Value(name);
  static Insertable<Move> custom({
    Expression<int>? id,
    Expression<String>? name,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
    });
  }

  MovesCompanion copyWith({Value<int>? id, Value<String>? name}) {
    return MovesCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MovesCompanion(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }
}

class $PokemonMovesTable extends PokemonMoves
    with TableInfo<$PokemonMovesTable, PokemonMove> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PokemonMovesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _pokemonIdMeta =
      const VerificationMeta('pokemonId');
  @override
  late final GeneratedColumn<int> pokemonId = GeneratedColumn<int>(
      'pokemon_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES pokemon (id)'));
  static const VerificationMeta _moveIdMeta = const VerificationMeta('moveId');
  @override
  late final GeneratedColumn<int> moveId = GeneratedColumn<int>(
      'move_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES move (id)'));
  static const VerificationMeta _versionGroupMeta =
      const VerificationMeta('versionGroup');
  @override
  late final GeneratedColumn<String> versionGroup = GeneratedColumn<String>(
      'version_group', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _learnMethodMeta =
      const VerificationMeta('learnMethod');
  @override
  late final GeneratedColumn<String> learnMethod = GeneratedColumn<String>(
      'learn_method', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _levelLearnedMeta =
      const VerificationMeta('levelLearned');
  @override
  late final GeneratedColumn<int> levelLearned = GeneratedColumn<int>(
      'level_learned', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  @override
  List<GeneratedColumn> get $columns =>
      [pokemonId, moveId, versionGroup, learnMethod, levelLearned];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'pokemon_move';
  @override
  VerificationContext validateIntegrity(Insertable<PokemonMove> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('pokemon_id')) {
      context.handle(_pokemonIdMeta,
          pokemonId.isAcceptableOrUnknown(data['pokemon_id']!, _pokemonIdMeta));
    } else if (isInserting) {
      context.missing(_pokemonIdMeta);
    }
    if (data.containsKey('move_id')) {
      context.handle(_moveIdMeta,
          moveId.isAcceptableOrUnknown(data['move_id']!, _moveIdMeta));
    } else if (isInserting) {
      context.missing(_moveIdMeta);
    }
    if (data.containsKey('version_group')) {
      context.handle(
          _versionGroupMeta,
          versionGroup.isAcceptableOrUnknown(
              data['version_group']!, _versionGroupMeta));
    } else if (isInserting) {
      context.missing(_versionGroupMeta);
    }
    if (data.containsKey('learn_method')) {
      context.handle(
          _learnMethodMeta,
          learnMethod.isAcceptableOrUnknown(
              data['learn_method']!, _learnMethodMeta));
    } else if (isInserting) {
      context.missing(_learnMethodMeta);
    }
    if (data.containsKey('level_learned')) {
      context.handle(
          _levelLearnedMeta,
          levelLearned.isAcceptableOrUnknown(
              data['level_learned']!, _levelLearnedMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey =>
      {pokemonId, moveId, versionGroup, learnMethod, levelLearned};
  @override
  PokemonMove map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PokemonMove(
      pokemonId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}pokemon_id'])!,
      moveId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}move_id'])!,
      versionGroup: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}version_group'])!,
      learnMethod: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}learn_method'])!,
      levelLearned: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}level_learned'])!,
    );
  }

  @override
  $PokemonMovesTable createAlias(String alias) {
    return $PokemonMovesTable(attachedDatabase, alias);
  }
}

class PokemonMove extends DataClass implements Insertable<PokemonMove> {
  final int pokemonId;
  final int moveId;
  final String versionGroup;
  final String learnMethod;
  final int levelLearned;
  const PokemonMove(
      {required this.pokemonId,
      required this.moveId,
      required this.versionGroup,
      required this.learnMethod,
      required this.levelLearned});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['pokemon_id'] = Variable<int>(pokemonId);
    map['move_id'] = Variable<int>(moveId);
    map['version_group'] = Variable<String>(versionGroup);
    map['learn_method'] = Variable<String>(learnMethod);
    map['level_learned'] = Variable<int>(levelLearned);
    return map;
  }

  PokemonMovesCompanion toCompanion(bool nullToAbsent) {
    return PokemonMovesCompanion(
      pokemonId: Value(pokemonId),
      moveId: Value(moveId),
      versionGroup: Value(versionGroup),
      learnMethod: Value(learnMethod),
      levelLearned: Value(levelLearned),
    );
  }

  factory PokemonMove.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PokemonMove(
      pokemonId: serializer.fromJson<int>(json['pokemonId']),
      moveId: serializer.fromJson<int>(json['moveId']),
      versionGroup: serializer.fromJson<String>(json['versionGroup']),
      learnMethod: serializer.fromJson<String>(json['learnMethod']),
      levelLearned: serializer.fromJson<int>(json['levelLearned']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'pokemonId': serializer.toJson<int>(pokemonId),
      'moveId': serializer.toJson<int>(moveId),
      'versionGroup': serializer.toJson<String>(versionGroup),
      'learnMethod': serializer.toJson<String>(learnMethod),
      'levelLearned': serializer.toJson<int>(levelLearned),
    };
  }

  PokemonMove copyWith(
          {int? pokemonId,
          int? moveId,
          String? versionGroup,
          String? learnMethod,
          int? levelLearned}) =>
      PokemonMove(
        pokemonId: pokemonId ?? this.pokemonId,
        moveId: moveId ?? this.moveId,
        versionGroup: versionGroup ?? this.versionGroup,
        learnMethod: learnMethod ?? this.learnMethod,
        levelLearned: levelLearned ?? this.levelLearned,
      );
  PokemonMove copyWithCompanion(PokemonMovesCompanion data) {
    return PokemonMove(
      pokemonId: data.pokemonId.present ? data.pokemonId.value : this.pokemonId,
      moveId: data.moveId.present ? data.moveId.value : this.moveId,
      versionGroup: data.versionGroup.present
          ? data.versionGroup.value
          : this.versionGroup,
      learnMethod:
          data.learnMethod.present ? data.learnMethod.value : this.learnMethod,
      levelLearned: data.levelLearned.present
          ? data.levelLearned.value
          : this.levelLearned,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PokemonMove(')
          ..write('pokemonId: $pokemonId, ')
          ..write('moveId: $moveId, ')
          ..write('versionGroup: $versionGroup, ')
          ..write('learnMethod: $learnMethod, ')
          ..write('levelLearned: $levelLearned')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(pokemonId, moveId, versionGroup, learnMethod, levelLearned);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PokemonMove &&
          other.pokemonId == this.pokemonId &&
          other.moveId == this.moveId &&
          other.versionGroup == this.versionGroup &&
          other.learnMethod == this.learnMethod &&
          other.levelLearned == this.levelLearned);
}

class PokemonMovesCompanion extends UpdateCompanion<PokemonMove> {
  final Value<int> pokemonId;
  final Value<int> moveId;
  final Value<String> versionGroup;
  final Value<String> learnMethod;
  final Value<int> levelLearned;
  final Value<int> rowid;
  const PokemonMovesCompanion({
    this.pokemonId = const Value.absent(),
    this.moveId = const Value.absent(),
    this.versionGroup = const Value.absent(),
    this.learnMethod = const Value.absent(),
    this.levelLearned = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  PokemonMovesCompanion.insert({
    required int pokemonId,
    required int moveId,
    required String versionGroup,
    required String learnMethod,
    this.levelLearned = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : pokemonId = Value(pokemonId),
        moveId = Value(moveId),
        versionGroup = Value(versionGroup),
        learnMethod = Value(learnMethod);
  static Insertable<PokemonMove> custom({
    Expression<int>? pokemonId,
    Expression<int>? moveId,
    Expression<String>? versionGroup,
    Expression<String>? learnMethod,
    Expression<int>? levelLearned,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (pokemonId != null) 'pokemon_id': pokemonId,
      if (moveId != null) 'move_id': moveId,
      if (versionGroup != null) 'version_group': versionGroup,
      if (learnMethod != null) 'learn_method': learnMethod,
      if (levelLearned != null) 'level_learned': levelLearned,
      if (rowid != null) 'rowid': rowid,
    });
  }

  PokemonMovesCompanion copyWith(
      {Value<int>? pokemonId,
      Value<int>? moveId,
      Value<String>? versionGroup,
      Value<String>? learnMethod,
      Value<int>? levelLearned,
      Value<int>? rowid}) {
    return PokemonMovesCompanion(
      pokemonId: pokemonId ?? this.pokemonId,
      moveId: moveId ?? this.moveId,
      versionGroup: versionGroup ?? this.versionGroup,
      learnMethod: learnMethod ?? this.learnMethod,
      levelLearned: levelLearned ?? this.levelLearned,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (pokemonId.present) {
      map['pokemon_id'] = Variable<int>(pokemonId.value);
    }
    if (moveId.present) {
      map['move_id'] = Variable<int>(moveId.value);
    }
    if (versionGroup.present) {
      map['version_group'] = Variable<String>(versionGroup.value);
    }
    if (learnMethod.present) {
      map['learn_method'] = Variable<String>(learnMethod.value);
    }
    if (levelLearned.present) {
      map['level_learned'] = Variable<int>(levelLearned.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PokemonMovesCompanion(')
          ..write('pokemonId: $pokemonId, ')
          ..write('moveId: $moveId, ')
          ..write('versionGroup: $versionGroup, ')
          ..write('learnMethod: $learnMethod, ')
          ..write('levelLearned: $levelLearned, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $EvolutionsTable extends Evolutions
    with TableInfo<$EvolutionsTable, Evolution> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $EvolutionsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _fromSpeciesIdMeta =
      const VerificationMeta('fromSpeciesId');
  @override
  late final GeneratedColumn<int> fromSpeciesId = GeneratedColumn<int>(
      'from_species_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES pokemon_species (id)'));
  static const VerificationMeta _toSpeciesIdMeta =
      const VerificationMeta('toSpeciesId');
  @override
  late final GeneratedColumn<int> toSpeciesId = GeneratedColumn<int>(
      'to_species_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES pokemon_species (id)'));
  static const VerificationMeta _triggerMeta =
      const VerificationMeta('trigger');
  @override
  late final GeneratedColumn<String> trigger = GeneratedColumn<String>(
      'trigger', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _triggerDetailMeta =
      const VerificationMeta('triggerDetail');
  @override
  late final GeneratedColumn<String> triggerDetail = GeneratedColumn<String>(
      'trigger_detail', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [fromSpeciesId, toSpeciesId, trigger, triggerDetail];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'evolution';
  @override
  VerificationContext validateIntegrity(Insertable<Evolution> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('from_species_id')) {
      context.handle(
          _fromSpeciesIdMeta,
          fromSpeciesId.isAcceptableOrUnknown(
              data['from_species_id']!, _fromSpeciesIdMeta));
    } else if (isInserting) {
      context.missing(_fromSpeciesIdMeta);
    }
    if (data.containsKey('to_species_id')) {
      context.handle(
          _toSpeciesIdMeta,
          toSpeciesId.isAcceptableOrUnknown(
              data['to_species_id']!, _toSpeciesIdMeta));
    } else if (isInserting) {
      context.missing(_toSpeciesIdMeta);
    }
    if (data.containsKey('trigger')) {
      context.handle(_triggerMeta,
          trigger.isAcceptableOrUnknown(data['trigger']!, _triggerMeta));
    } else if (isInserting) {
      context.missing(_triggerMeta);
    }
    if (data.containsKey('trigger_detail')) {
      context.handle(
          _triggerDetailMeta,
          triggerDetail.isAcceptableOrUnknown(
              data['trigger_detail']!, _triggerDetailMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {fromSpeciesId, toSpeciesId, trigger};
  @override
  Evolution map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Evolution(
      fromSpeciesId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}from_species_id'])!,
      toSpeciesId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}to_species_id'])!,
      trigger: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}trigger'])!,
      triggerDetail: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}trigger_detail']),
    );
  }

  @override
  $EvolutionsTable createAlias(String alias) {
    return $EvolutionsTable(attachedDatabase, alias);
  }
}

class Evolution extends DataClass implements Insertable<Evolution> {
  final int fromSpeciesId;
  final int toSpeciesId;
  final String trigger;
  final String? triggerDetail;
  const Evolution(
      {required this.fromSpeciesId,
      required this.toSpeciesId,
      required this.trigger,
      this.triggerDetail});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['from_species_id'] = Variable<int>(fromSpeciesId);
    map['to_species_id'] = Variable<int>(toSpeciesId);
    map['trigger'] = Variable<String>(trigger);
    if (!nullToAbsent || triggerDetail != null) {
      map['trigger_detail'] = Variable<String>(triggerDetail);
    }
    return map;
  }

  EvolutionsCompanion toCompanion(bool nullToAbsent) {
    return EvolutionsCompanion(
      fromSpeciesId: Value(fromSpeciesId),
      toSpeciesId: Value(toSpeciesId),
      trigger: Value(trigger),
      triggerDetail: triggerDetail == null && nullToAbsent
          ? const Value.absent()
          : Value(triggerDetail),
    );
  }

  factory Evolution.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Evolution(
      fromSpeciesId: serializer.fromJson<int>(json['fromSpeciesId']),
      toSpeciesId: serializer.fromJson<int>(json['toSpeciesId']),
      trigger: serializer.fromJson<String>(json['trigger']),
      triggerDetail: serializer.fromJson<String?>(json['triggerDetail']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'fromSpeciesId': serializer.toJson<int>(fromSpeciesId),
      'toSpeciesId': serializer.toJson<int>(toSpeciesId),
      'trigger': serializer.toJson<String>(trigger),
      'triggerDetail': serializer.toJson<String?>(triggerDetail),
    };
  }

  Evolution copyWith(
          {int? fromSpeciesId,
          int? toSpeciesId,
          String? trigger,
          Value<String?> triggerDetail = const Value.absent()}) =>
      Evolution(
        fromSpeciesId: fromSpeciesId ?? this.fromSpeciesId,
        toSpeciesId: toSpeciesId ?? this.toSpeciesId,
        trigger: trigger ?? this.trigger,
        triggerDetail:
            triggerDetail.present ? triggerDetail.value : this.triggerDetail,
      );
  Evolution copyWithCompanion(EvolutionsCompanion data) {
    return Evolution(
      fromSpeciesId: data.fromSpeciesId.present
          ? data.fromSpeciesId.value
          : this.fromSpeciesId,
      toSpeciesId:
          data.toSpeciesId.present ? data.toSpeciesId.value : this.toSpeciesId,
      trigger: data.trigger.present ? data.trigger.value : this.trigger,
      triggerDetail: data.triggerDetail.present
          ? data.triggerDetail.value
          : this.triggerDetail,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Evolution(')
          ..write('fromSpeciesId: $fromSpeciesId, ')
          ..write('toSpeciesId: $toSpeciesId, ')
          ..write('trigger: $trigger, ')
          ..write('triggerDetail: $triggerDetail')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(fromSpeciesId, toSpeciesId, trigger, triggerDetail);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Evolution &&
          other.fromSpeciesId == this.fromSpeciesId &&
          other.toSpeciesId == this.toSpeciesId &&
          other.trigger == this.trigger &&
          other.triggerDetail == this.triggerDetail);
}

class EvolutionsCompanion extends UpdateCompanion<Evolution> {
  final Value<int> fromSpeciesId;
  final Value<int> toSpeciesId;
  final Value<String> trigger;
  final Value<String?> triggerDetail;
  final Value<int> rowid;
  const EvolutionsCompanion({
    this.fromSpeciesId = const Value.absent(),
    this.toSpeciesId = const Value.absent(),
    this.trigger = const Value.absent(),
    this.triggerDetail = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  EvolutionsCompanion.insert({
    required int fromSpeciesId,
    required int toSpeciesId,
    required String trigger,
    this.triggerDetail = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : fromSpeciesId = Value(fromSpeciesId),
        toSpeciesId = Value(toSpeciesId),
        trigger = Value(trigger);
  static Insertable<Evolution> custom({
    Expression<int>? fromSpeciesId,
    Expression<int>? toSpeciesId,
    Expression<String>? trigger,
    Expression<String>? triggerDetail,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (fromSpeciesId != null) 'from_species_id': fromSpeciesId,
      if (toSpeciesId != null) 'to_species_id': toSpeciesId,
      if (trigger != null) 'trigger': trigger,
      if (triggerDetail != null) 'trigger_detail': triggerDetail,
      if (rowid != null) 'rowid': rowid,
    });
  }

  EvolutionsCompanion copyWith(
      {Value<int>? fromSpeciesId,
      Value<int>? toSpeciesId,
      Value<String>? trigger,
      Value<String?>? triggerDetail,
      Value<int>? rowid}) {
    return EvolutionsCompanion(
      fromSpeciesId: fromSpeciesId ?? this.fromSpeciesId,
      toSpeciesId: toSpeciesId ?? this.toSpeciesId,
      trigger: trigger ?? this.trigger,
      triggerDetail: triggerDetail ?? this.triggerDetail,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (fromSpeciesId.present) {
      map['from_species_id'] = Variable<int>(fromSpeciesId.value);
    }
    if (toSpeciesId.present) {
      map['to_species_id'] = Variable<int>(toSpeciesId.value);
    }
    if (trigger.present) {
      map['trigger'] = Variable<String>(trigger.value);
    }
    if (triggerDetail.present) {
      map['trigger_detail'] = Variable<String>(triggerDetail.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('EvolutionsCompanion(')
          ..write('fromSpeciesId: $fromSpeciesId, ')
          ..write('toSpeciesId: $toSpeciesId, ')
          ..write('trigger: $trigger, ')
          ..write('triggerDetail: $triggerDetail, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $TypeEfficaciesTable extends TypeEfficacies
    with TableInfo<$TypeEfficaciesTable, TypeEfficacy> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TypeEfficaciesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _attackingTypeIdMeta =
      const VerificationMeta('attackingTypeId');
  @override
  late final GeneratedColumn<int> attackingTypeId = GeneratedColumn<int>(
      'attacking_type_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES type (id)'));
  static const VerificationMeta _defendingTypeIdMeta =
      const VerificationMeta('defendingTypeId');
  @override
  late final GeneratedColumn<int> defendingTypeId = GeneratedColumn<int>(
      'defending_type_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES type (id)'));
  static const VerificationMeta _damageFactorMeta =
      const VerificationMeta('damageFactor');
  @override
  late final GeneratedColumn<int> damageFactor = GeneratedColumn<int>(
      'damage_factor', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [attackingTypeId, defendingTypeId, damageFactor];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'type_efficacy';
  @override
  VerificationContext validateIntegrity(Insertable<TypeEfficacy> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('attacking_type_id')) {
      context.handle(
          _attackingTypeIdMeta,
          attackingTypeId.isAcceptableOrUnknown(
              data['attacking_type_id']!, _attackingTypeIdMeta));
    } else if (isInserting) {
      context.missing(_attackingTypeIdMeta);
    }
    if (data.containsKey('defending_type_id')) {
      context.handle(
          _defendingTypeIdMeta,
          defendingTypeId.isAcceptableOrUnknown(
              data['defending_type_id']!, _defendingTypeIdMeta));
    } else if (isInserting) {
      context.missing(_defendingTypeIdMeta);
    }
    if (data.containsKey('damage_factor')) {
      context.handle(
          _damageFactorMeta,
          damageFactor.isAcceptableOrUnknown(
              data['damage_factor']!, _damageFactorMeta));
    } else if (isInserting) {
      context.missing(_damageFactorMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {attackingTypeId, defendingTypeId};
  @override
  TypeEfficacy map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TypeEfficacy(
      attackingTypeId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}attacking_type_id'])!,
      defendingTypeId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}defending_type_id'])!,
      damageFactor: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}damage_factor'])!,
    );
  }

  @override
  $TypeEfficaciesTable createAlias(String alias) {
    return $TypeEfficaciesTable(attachedDatabase, alias);
  }
}

class TypeEfficacy extends DataClass implements Insertable<TypeEfficacy> {
  final int attackingTypeId;
  final int defendingTypeId;
  final int damageFactor;
  const TypeEfficacy(
      {required this.attackingTypeId,
      required this.defendingTypeId,
      required this.damageFactor});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['attacking_type_id'] = Variable<int>(attackingTypeId);
    map['defending_type_id'] = Variable<int>(defendingTypeId);
    map['damage_factor'] = Variable<int>(damageFactor);
    return map;
  }

  TypeEfficaciesCompanion toCompanion(bool nullToAbsent) {
    return TypeEfficaciesCompanion(
      attackingTypeId: Value(attackingTypeId),
      defendingTypeId: Value(defendingTypeId),
      damageFactor: Value(damageFactor),
    );
  }

  factory TypeEfficacy.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TypeEfficacy(
      attackingTypeId: serializer.fromJson<int>(json['attackingTypeId']),
      defendingTypeId: serializer.fromJson<int>(json['defendingTypeId']),
      damageFactor: serializer.fromJson<int>(json['damageFactor']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'attackingTypeId': serializer.toJson<int>(attackingTypeId),
      'defendingTypeId': serializer.toJson<int>(defendingTypeId),
      'damageFactor': serializer.toJson<int>(damageFactor),
    };
  }

  TypeEfficacy copyWith(
          {int? attackingTypeId, int? defendingTypeId, int? damageFactor}) =>
      TypeEfficacy(
        attackingTypeId: attackingTypeId ?? this.attackingTypeId,
        defendingTypeId: defendingTypeId ?? this.defendingTypeId,
        damageFactor: damageFactor ?? this.damageFactor,
      );
  TypeEfficacy copyWithCompanion(TypeEfficaciesCompanion data) {
    return TypeEfficacy(
      attackingTypeId: data.attackingTypeId.present
          ? data.attackingTypeId.value
          : this.attackingTypeId,
      defendingTypeId: data.defendingTypeId.present
          ? data.defendingTypeId.value
          : this.defendingTypeId,
      damageFactor: data.damageFactor.present
          ? data.damageFactor.value
          : this.damageFactor,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TypeEfficacy(')
          ..write('attackingTypeId: $attackingTypeId, ')
          ..write('defendingTypeId: $defendingTypeId, ')
          ..write('damageFactor: $damageFactor')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(attackingTypeId, defendingTypeId, damageFactor);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TypeEfficacy &&
          other.attackingTypeId == this.attackingTypeId &&
          other.defendingTypeId == this.defendingTypeId &&
          other.damageFactor == this.damageFactor);
}

class TypeEfficaciesCompanion extends UpdateCompanion<TypeEfficacy> {
  final Value<int> attackingTypeId;
  final Value<int> defendingTypeId;
  final Value<int> damageFactor;
  final Value<int> rowid;
  const TypeEfficaciesCompanion({
    this.attackingTypeId = const Value.absent(),
    this.defendingTypeId = const Value.absent(),
    this.damageFactor = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  TypeEfficaciesCompanion.insert({
    required int attackingTypeId,
    required int defendingTypeId,
    required int damageFactor,
    this.rowid = const Value.absent(),
  })  : attackingTypeId = Value(attackingTypeId),
        defendingTypeId = Value(defendingTypeId),
        damageFactor = Value(damageFactor);
  static Insertable<TypeEfficacy> custom({
    Expression<int>? attackingTypeId,
    Expression<int>? defendingTypeId,
    Expression<int>? damageFactor,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (attackingTypeId != null) 'attacking_type_id': attackingTypeId,
      if (defendingTypeId != null) 'defending_type_id': defendingTypeId,
      if (damageFactor != null) 'damage_factor': damageFactor,
      if (rowid != null) 'rowid': rowid,
    });
  }

  TypeEfficaciesCompanion copyWith(
      {Value<int>? attackingTypeId,
      Value<int>? defendingTypeId,
      Value<int>? damageFactor,
      Value<int>? rowid}) {
    return TypeEfficaciesCompanion(
      attackingTypeId: attackingTypeId ?? this.attackingTypeId,
      defendingTypeId: defendingTypeId ?? this.defendingTypeId,
      damageFactor: damageFactor ?? this.damageFactor,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (attackingTypeId.present) {
      map['attacking_type_id'] = Variable<int>(attackingTypeId.value);
    }
    if (defendingTypeId.present) {
      map['defending_type_id'] = Variable<int>(defendingTypeId.value);
    }
    if (damageFactor.present) {
      map['damage_factor'] = Variable<int>(damageFactor.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TypeEfficaciesCompanion(')
          ..write('attackingTypeId: $attackingTypeId, ')
          ..write('defendingTypeId: $defendingTypeId, ')
          ..write('damageFactor: $damageFactor, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $FavoritesTable extends Favorites
    with TableInfo<$FavoritesTable, Favorite> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $FavoritesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _pokemonIdMeta =
      const VerificationMeta('pokemonId');
  @override
  late final GeneratedColumn<int> pokemonId = GeneratedColumn<int>(
      'pokemon_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES pokemon (id)'));
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns => [pokemonId, createdAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'favorite';
  @override
  VerificationContext validateIntegrity(Insertable<Favorite> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('pokemon_id')) {
      context.handle(_pokemonIdMeta,
          pokemonId.isAcceptableOrUnknown(data['pokemon_id']!, _pokemonIdMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {pokemonId};
  @override
  Favorite map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Favorite(
      pokemonId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}pokemon_id'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
    );
  }

  @override
  $FavoritesTable createAlias(String alias) {
    return $FavoritesTable(attachedDatabase, alias);
  }
}

class Favorite extends DataClass implements Insertable<Favorite> {
  final int pokemonId;
  final DateTime createdAt;
  const Favorite({required this.pokemonId, required this.createdAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['pokemon_id'] = Variable<int>(pokemonId);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  FavoritesCompanion toCompanion(bool nullToAbsent) {
    return FavoritesCompanion(
      pokemonId: Value(pokemonId),
      createdAt: Value(createdAt),
    );
  }

  factory Favorite.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Favorite(
      pokemonId: serializer.fromJson<int>(json['pokemonId']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'pokemonId': serializer.toJson<int>(pokemonId),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  Favorite copyWith({int? pokemonId, DateTime? createdAt}) => Favorite(
        pokemonId: pokemonId ?? this.pokemonId,
        createdAt: createdAt ?? this.createdAt,
      );
  Favorite copyWithCompanion(FavoritesCompanion data) {
    return Favorite(
      pokemonId: data.pokemonId.present ? data.pokemonId.value : this.pokemonId,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Favorite(')
          ..write('pokemonId: $pokemonId, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(pokemonId, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Favorite &&
          other.pokemonId == this.pokemonId &&
          other.createdAt == this.createdAt);
}

class FavoritesCompanion extends UpdateCompanion<Favorite> {
  final Value<int> pokemonId;
  final Value<DateTime> createdAt;
  const FavoritesCompanion({
    this.pokemonId = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  FavoritesCompanion.insert({
    this.pokemonId = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  static Insertable<Favorite> custom({
    Expression<int>? pokemonId,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (pokemonId != null) 'pokemon_id': pokemonId,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  FavoritesCompanion copyWith(
      {Value<int>? pokemonId, Value<DateTime>? createdAt}) {
    return FavoritesCompanion(
      pokemonId: pokemonId ?? this.pokemonId,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (pokemonId.present) {
      map['pokemon_id'] = Variable<int>(pokemonId.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FavoritesCompanion(')
          ..write('pokemonId: $pokemonId, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $TriviaResultsTable extends TriviaResults
    with TableInfo<$TriviaResultsTable, TriviaResult> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TriviaResultsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _scoreMeta = const VerificationMeta('score');
  @override
  late final GeneratedColumn<int> score = GeneratedColumn<int>(
      'score', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _correctAnswersMeta =
      const VerificationMeta('correctAnswers');
  @override
  late final GeneratedColumn<int> correctAnswers = GeneratedColumn<int>(
      'correct_answers', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _playedAtMeta =
      const VerificationMeta('playedAt');
  @override
  late final GeneratedColumn<DateTime> playedAt = GeneratedColumn<DateTime>(
      'played_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns => [id, score, correctAnswers, playedAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'trivia_result';
  @override
  VerificationContext validateIntegrity(Insertable<TriviaResult> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('score')) {
      context.handle(
          _scoreMeta, score.isAcceptableOrUnknown(data['score']!, _scoreMeta));
    } else if (isInserting) {
      context.missing(_scoreMeta);
    }
    if (data.containsKey('correct_answers')) {
      context.handle(
          _correctAnswersMeta,
          correctAnswers.isAcceptableOrUnknown(
              data['correct_answers']!, _correctAnswersMeta));
    } else if (isInserting) {
      context.missing(_correctAnswersMeta);
    }
    if (data.containsKey('played_at')) {
      context.handle(_playedAtMeta,
          playedAt.isAcceptableOrUnknown(data['played_at']!, _playedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TriviaResult map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TriviaResult(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      score: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}score'])!,
      correctAnswers: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}correct_answers'])!,
      playedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}played_at'])!,
    );
  }

  @override
  $TriviaResultsTable createAlias(String alias) {
    return $TriviaResultsTable(attachedDatabase, alias);
  }
}

class TriviaResult extends DataClass implements Insertable<TriviaResult> {
  final int id;
  final int score;
  final int correctAnswers;
  final DateTime playedAt;
  const TriviaResult(
      {required this.id,
      required this.score,
      required this.correctAnswers,
      required this.playedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['score'] = Variable<int>(score);
    map['correct_answers'] = Variable<int>(correctAnswers);
    map['played_at'] = Variable<DateTime>(playedAt);
    return map;
  }

  TriviaResultsCompanion toCompanion(bool nullToAbsent) {
    return TriviaResultsCompanion(
      id: Value(id),
      score: Value(score),
      correctAnswers: Value(correctAnswers),
      playedAt: Value(playedAt),
    );
  }

  factory TriviaResult.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TriviaResult(
      id: serializer.fromJson<int>(json['id']),
      score: serializer.fromJson<int>(json['score']),
      correctAnswers: serializer.fromJson<int>(json['correctAnswers']),
      playedAt: serializer.fromJson<DateTime>(json['playedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'score': serializer.toJson<int>(score),
      'correctAnswers': serializer.toJson<int>(correctAnswers),
      'playedAt': serializer.toJson<DateTime>(playedAt),
    };
  }

  TriviaResult copyWith(
          {int? id, int? score, int? correctAnswers, DateTime? playedAt}) =>
      TriviaResult(
        id: id ?? this.id,
        score: score ?? this.score,
        correctAnswers: correctAnswers ?? this.correctAnswers,
        playedAt: playedAt ?? this.playedAt,
      );
  TriviaResult copyWithCompanion(TriviaResultsCompanion data) {
    return TriviaResult(
      id: data.id.present ? data.id.value : this.id,
      score: data.score.present ? data.score.value : this.score,
      correctAnswers: data.correctAnswers.present
          ? data.correctAnswers.value
          : this.correctAnswers,
      playedAt: data.playedAt.present ? data.playedAt.value : this.playedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TriviaResult(')
          ..write('id: $id, ')
          ..write('score: $score, ')
          ..write('correctAnswers: $correctAnswers, ')
          ..write('playedAt: $playedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, score, correctAnswers, playedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TriviaResult &&
          other.id == this.id &&
          other.score == this.score &&
          other.correctAnswers == this.correctAnswers &&
          other.playedAt == this.playedAt);
}

class TriviaResultsCompanion extends UpdateCompanion<TriviaResult> {
  final Value<int> id;
  final Value<int> score;
  final Value<int> correctAnswers;
  final Value<DateTime> playedAt;
  const TriviaResultsCompanion({
    this.id = const Value.absent(),
    this.score = const Value.absent(),
    this.correctAnswers = const Value.absent(),
    this.playedAt = const Value.absent(),
  });
  TriviaResultsCompanion.insert({
    this.id = const Value.absent(),
    required int score,
    required int correctAnswers,
    this.playedAt = const Value.absent(),
  })  : score = Value(score),
        correctAnswers = Value(correctAnswers);
  static Insertable<TriviaResult> custom({
    Expression<int>? id,
    Expression<int>? score,
    Expression<int>? correctAnswers,
    Expression<DateTime>? playedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (score != null) 'score': score,
      if (correctAnswers != null) 'correct_answers': correctAnswers,
      if (playedAt != null) 'played_at': playedAt,
    });
  }

  TriviaResultsCompanion copyWith(
      {Value<int>? id,
      Value<int>? score,
      Value<int>? correctAnswers,
      Value<DateTime>? playedAt}) {
    return TriviaResultsCompanion(
      id: id ?? this.id,
      score: score ?? this.score,
      correctAnswers: correctAnswers ?? this.correctAnswers,
      playedAt: playedAt ?? this.playedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (score.present) {
      map['score'] = Variable<int>(score.value);
    }
    if (correctAnswers.present) {
      map['correct_answers'] = Variable<int>(correctAnswers.value);
    }
    if (playedAt.present) {
      map['played_at'] = Variable<DateTime>(playedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TriviaResultsCompanion(')
          ..write('id: $id, ')
          ..write('score: $score, ')
          ..write('correctAnswers: $correctAnswers, ')
          ..write('playedAt: $playedAt')
          ..write(')'))
        .toString();
  }
}

class $TriviaAnswersTable extends TriviaAnswers
    with TableInfo<$TriviaAnswersTable, TriviaAnswer> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TriviaAnswersTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _triviaResultIdMeta =
      const VerificationMeta('triviaResultId');
  @override
  late final GeneratedColumn<int> triviaResultId = GeneratedColumn<int>(
      'trivia_result_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES trivia_result (id)'));
  static const VerificationMeta _pokemonIdMeta =
      const VerificationMeta('pokemonId');
  @override
  late final GeneratedColumn<int> pokemonId = GeneratedColumn<int>(
      'pokemon_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES pokemon (id)'));
  static const VerificationMeta _correctMeta =
      const VerificationMeta('correct');
  @override
  late final GeneratedColumn<bool> correct = GeneratedColumn<bool>(
      'correct', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("correct" IN (0, 1))'));
  @override
  List<GeneratedColumn> get $columns =>
      [id, triviaResultId, pokemonId, correct];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'trivia_answer';
  @override
  VerificationContext validateIntegrity(Insertable<TriviaAnswer> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('trivia_result_id')) {
      context.handle(
          _triviaResultIdMeta,
          triviaResultId.isAcceptableOrUnknown(
              data['trivia_result_id']!, _triviaResultIdMeta));
    } else if (isInserting) {
      context.missing(_triviaResultIdMeta);
    }
    if (data.containsKey('pokemon_id')) {
      context.handle(_pokemonIdMeta,
          pokemonId.isAcceptableOrUnknown(data['pokemon_id']!, _pokemonIdMeta));
    } else if (isInserting) {
      context.missing(_pokemonIdMeta);
    }
    if (data.containsKey('correct')) {
      context.handle(_correctMeta,
          correct.isAcceptableOrUnknown(data['correct']!, _correctMeta));
    } else if (isInserting) {
      context.missing(_correctMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TriviaAnswer map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TriviaAnswer(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      triviaResultId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}trivia_result_id'])!,
      pokemonId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}pokemon_id'])!,
      correct: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}correct'])!,
    );
  }

  @override
  $TriviaAnswersTable createAlias(String alias) {
    return $TriviaAnswersTable(attachedDatabase, alias);
  }
}

class TriviaAnswer extends DataClass implements Insertable<TriviaAnswer> {
  final int id;
  final int triviaResultId;
  final int pokemonId;
  final bool correct;
  const TriviaAnswer(
      {required this.id,
      required this.triviaResultId,
      required this.pokemonId,
      required this.correct});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['trivia_result_id'] = Variable<int>(triviaResultId);
    map['pokemon_id'] = Variable<int>(pokemonId);
    map['correct'] = Variable<bool>(correct);
    return map;
  }

  TriviaAnswersCompanion toCompanion(bool nullToAbsent) {
    return TriviaAnswersCompanion(
      id: Value(id),
      triviaResultId: Value(triviaResultId),
      pokemonId: Value(pokemonId),
      correct: Value(correct),
    );
  }

  factory TriviaAnswer.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TriviaAnswer(
      id: serializer.fromJson<int>(json['id']),
      triviaResultId: serializer.fromJson<int>(json['triviaResultId']),
      pokemonId: serializer.fromJson<int>(json['pokemonId']),
      correct: serializer.fromJson<bool>(json['correct']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'triviaResultId': serializer.toJson<int>(triviaResultId),
      'pokemonId': serializer.toJson<int>(pokemonId),
      'correct': serializer.toJson<bool>(correct),
    };
  }

  TriviaAnswer copyWith(
          {int? id, int? triviaResultId, int? pokemonId, bool? correct}) =>
      TriviaAnswer(
        id: id ?? this.id,
        triviaResultId: triviaResultId ?? this.triviaResultId,
        pokemonId: pokemonId ?? this.pokemonId,
        correct: correct ?? this.correct,
      );
  TriviaAnswer copyWithCompanion(TriviaAnswersCompanion data) {
    return TriviaAnswer(
      id: data.id.present ? data.id.value : this.id,
      triviaResultId: data.triviaResultId.present
          ? data.triviaResultId.value
          : this.triviaResultId,
      pokemonId: data.pokemonId.present ? data.pokemonId.value : this.pokemonId,
      correct: data.correct.present ? data.correct.value : this.correct,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TriviaAnswer(')
          ..write('id: $id, ')
          ..write('triviaResultId: $triviaResultId, ')
          ..write('pokemonId: $pokemonId, ')
          ..write('correct: $correct')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, triviaResultId, pokemonId, correct);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TriviaAnswer &&
          other.id == this.id &&
          other.triviaResultId == this.triviaResultId &&
          other.pokemonId == this.pokemonId &&
          other.correct == this.correct);
}

class TriviaAnswersCompanion extends UpdateCompanion<TriviaAnswer> {
  final Value<int> id;
  final Value<int> triviaResultId;
  final Value<int> pokemonId;
  final Value<bool> correct;
  const TriviaAnswersCompanion({
    this.id = const Value.absent(),
    this.triviaResultId = const Value.absent(),
    this.pokemonId = const Value.absent(),
    this.correct = const Value.absent(),
  });
  TriviaAnswersCompanion.insert({
    this.id = const Value.absent(),
    required int triviaResultId,
    required int pokemonId,
    required bool correct,
  })  : triviaResultId = Value(triviaResultId),
        pokemonId = Value(pokemonId),
        correct = Value(correct);
  static Insertable<TriviaAnswer> custom({
    Expression<int>? id,
    Expression<int>? triviaResultId,
    Expression<int>? pokemonId,
    Expression<bool>? correct,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (triviaResultId != null) 'trivia_result_id': triviaResultId,
      if (pokemonId != null) 'pokemon_id': pokemonId,
      if (correct != null) 'correct': correct,
    });
  }

  TriviaAnswersCompanion copyWith(
      {Value<int>? id,
      Value<int>? triviaResultId,
      Value<int>? pokemonId,
      Value<bool>? correct}) {
    return TriviaAnswersCompanion(
      id: id ?? this.id,
      triviaResultId: triviaResultId ?? this.triviaResultId,
      pokemonId: pokemonId ?? this.pokemonId,
      correct: correct ?? this.correct,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (triviaResultId.present) {
      map['trivia_result_id'] = Variable<int>(triviaResultId.value);
    }
    if (pokemonId.present) {
      map['pokemon_id'] = Variable<int>(pokemonId.value);
    }
    if (correct.present) {
      map['correct'] = Variable<bool>(correct.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TriviaAnswersCompanion(')
          ..write('id: $id, ')
          ..write('triviaResultId: $triviaResultId, ')
          ..write('pokemonId: $pokemonId, ')
          ..write('correct: $correct')
          ..write(')'))
        .toString();
  }
}

class $AppSettingsTable extends AppSettings
    with TableInfo<$AppSettingsTable, AppSetting> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AppSettingsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _keyMeta = const VerificationMeta('key');
  @override
  late final GeneratedColumn<String> key = GeneratedColumn<String>(
      'key', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _valueMeta = const VerificationMeta('value');
  @override
  late final GeneratedColumn<String> value = GeneratedColumn<String>(
      'value', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [key, value];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'app_setting';
  @override
  VerificationContext validateIntegrity(Insertable<AppSetting> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('key')) {
      context.handle(
          _keyMeta, key.isAcceptableOrUnknown(data['key']!, _keyMeta));
    } else if (isInserting) {
      context.missing(_keyMeta);
    }
    if (data.containsKey('value')) {
      context.handle(
          _valueMeta, value.isAcceptableOrUnknown(data['value']!, _valueMeta));
    } else if (isInserting) {
      context.missing(_valueMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {key};
  @override
  AppSetting map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AppSetting(
      key: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}key'])!,
      value: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}value'])!,
    );
  }

  @override
  $AppSettingsTable createAlias(String alias) {
    return $AppSettingsTable(attachedDatabase, alias);
  }
}

class AppSetting extends DataClass implements Insertable<AppSetting> {
  final String key;
  final String value;
  const AppSetting({required this.key, required this.value});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['key'] = Variable<String>(key);
    map['value'] = Variable<String>(value);
    return map;
  }

  AppSettingsCompanion toCompanion(bool nullToAbsent) {
    return AppSettingsCompanion(
      key: Value(key),
      value: Value(value),
    );
  }

  factory AppSetting.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AppSetting(
      key: serializer.fromJson<String>(json['key']),
      value: serializer.fromJson<String>(json['value']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'key': serializer.toJson<String>(key),
      'value': serializer.toJson<String>(value),
    };
  }

  AppSetting copyWith({String? key, String? value}) => AppSetting(
        key: key ?? this.key,
        value: value ?? this.value,
      );
  AppSetting copyWithCompanion(AppSettingsCompanion data) {
    return AppSetting(
      key: data.key.present ? data.key.value : this.key,
      value: data.value.present ? data.value.value : this.value,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AppSetting(')
          ..write('key: $key, ')
          ..write('value: $value')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(key, value);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AppSetting &&
          other.key == this.key &&
          other.value == this.value);
}

class AppSettingsCompanion extends UpdateCompanion<AppSetting> {
  final Value<String> key;
  final Value<String> value;
  final Value<int> rowid;
  const AppSettingsCompanion({
    this.key = const Value.absent(),
    this.value = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  AppSettingsCompanion.insert({
    required String key,
    required String value,
    this.rowid = const Value.absent(),
  })  : key = Value(key),
        value = Value(value);
  static Insertable<AppSetting> custom({
    Expression<String>? key,
    Expression<String>? value,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (key != null) 'key': key,
      if (value != null) 'value': value,
      if (rowid != null) 'rowid': rowid,
    });
  }

  AppSettingsCompanion copyWith(
      {Value<String>? key, Value<String>? value, Value<int>? rowid}) {
    return AppSettingsCompanion(
      key: key ?? this.key,
      value: value ?? this.value,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (key.present) {
      map['key'] = Variable<String>(key.value);
    }
    if (value.present) {
      map['value'] = Variable<String>(value.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AppSettingsCompanion(')
          ..write('key: $key, ')
          ..write('value: $value, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $SyncMetadataTable extends SyncMetadata
    with TableInfo<$SyncMetadataTable, SyncMetadataData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SyncMetadataTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _resourceKeyMeta =
      const VerificationMeta('resourceKey');
  @override
  late final GeneratedColumn<String> resourceKey = GeneratedColumn<String>(
      'resource_key', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
      'status', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('pending'));
  static const VerificationMeta _lastSuccessAtMeta =
      const VerificationMeta('lastSuccessAt');
  @override
  late final GeneratedColumn<DateTime> lastSuccessAt =
      GeneratedColumn<DateTime>('last_success_at', aliasedName, true,
          type: DriftSqlType.dateTime, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [resourceKey, status, lastSuccessAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'sync_metadata';
  @override
  VerificationContext validateIntegrity(Insertable<SyncMetadataData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('resource_key')) {
      context.handle(
          _resourceKeyMeta,
          resourceKey.isAcceptableOrUnknown(
              data['resource_key']!, _resourceKeyMeta));
    } else if (isInserting) {
      context.missing(_resourceKeyMeta);
    }
    if (data.containsKey('status')) {
      context.handle(_statusMeta,
          status.isAcceptableOrUnknown(data['status']!, _statusMeta));
    }
    if (data.containsKey('last_success_at')) {
      context.handle(
          _lastSuccessAtMeta,
          lastSuccessAt.isAcceptableOrUnknown(
              data['last_success_at']!, _lastSuccessAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {resourceKey};
  @override
  SyncMetadataData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SyncMetadataData(
      resourceKey: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}resource_key'])!,
      status: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}status'])!,
      lastSuccessAt: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}last_success_at']),
    );
  }

  @override
  $SyncMetadataTable createAlias(String alias) {
    return $SyncMetadataTable(attachedDatabase, alias);
  }
}

class SyncMetadataData extends DataClass
    implements Insertable<SyncMetadataData> {
  final String resourceKey;
  final String status;
  final DateTime? lastSuccessAt;
  const SyncMetadataData(
      {required this.resourceKey, required this.status, this.lastSuccessAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['resource_key'] = Variable<String>(resourceKey);
    map['status'] = Variable<String>(status);
    if (!nullToAbsent || lastSuccessAt != null) {
      map['last_success_at'] = Variable<DateTime>(lastSuccessAt);
    }
    return map;
  }

  SyncMetadataCompanion toCompanion(bool nullToAbsent) {
    return SyncMetadataCompanion(
      resourceKey: Value(resourceKey),
      status: Value(status),
      lastSuccessAt: lastSuccessAt == null && nullToAbsent
          ? const Value.absent()
          : Value(lastSuccessAt),
    );
  }

  factory SyncMetadataData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SyncMetadataData(
      resourceKey: serializer.fromJson<String>(json['resourceKey']),
      status: serializer.fromJson<String>(json['status']),
      lastSuccessAt: serializer.fromJson<DateTime?>(json['lastSuccessAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'resourceKey': serializer.toJson<String>(resourceKey),
      'status': serializer.toJson<String>(status),
      'lastSuccessAt': serializer.toJson<DateTime?>(lastSuccessAt),
    };
  }

  SyncMetadataData copyWith(
          {String? resourceKey,
          String? status,
          Value<DateTime?> lastSuccessAt = const Value.absent()}) =>
      SyncMetadataData(
        resourceKey: resourceKey ?? this.resourceKey,
        status: status ?? this.status,
        lastSuccessAt:
            lastSuccessAt.present ? lastSuccessAt.value : this.lastSuccessAt,
      );
  SyncMetadataData copyWithCompanion(SyncMetadataCompanion data) {
    return SyncMetadataData(
      resourceKey:
          data.resourceKey.present ? data.resourceKey.value : this.resourceKey,
      status: data.status.present ? data.status.value : this.status,
      lastSuccessAt: data.lastSuccessAt.present
          ? data.lastSuccessAt.value
          : this.lastSuccessAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SyncMetadataData(')
          ..write('resourceKey: $resourceKey, ')
          ..write('status: $status, ')
          ..write('lastSuccessAt: $lastSuccessAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(resourceKey, status, lastSuccessAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SyncMetadataData &&
          other.resourceKey == this.resourceKey &&
          other.status == this.status &&
          other.lastSuccessAt == this.lastSuccessAt);
}

class SyncMetadataCompanion extends UpdateCompanion<SyncMetadataData> {
  final Value<String> resourceKey;
  final Value<String> status;
  final Value<DateTime?> lastSuccessAt;
  final Value<int> rowid;
  const SyncMetadataCompanion({
    this.resourceKey = const Value.absent(),
    this.status = const Value.absent(),
    this.lastSuccessAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  SyncMetadataCompanion.insert({
    required String resourceKey,
    this.status = const Value.absent(),
    this.lastSuccessAt = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : resourceKey = Value(resourceKey);
  static Insertable<SyncMetadataData> custom({
    Expression<String>? resourceKey,
    Expression<String>? status,
    Expression<DateTime>? lastSuccessAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (resourceKey != null) 'resource_key': resourceKey,
      if (status != null) 'status': status,
      if (lastSuccessAt != null) 'last_success_at': lastSuccessAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  SyncMetadataCompanion copyWith(
      {Value<String>? resourceKey,
      Value<String>? status,
      Value<DateTime?>? lastSuccessAt,
      Value<int>? rowid}) {
    return SyncMetadataCompanion(
      resourceKey: resourceKey ?? this.resourceKey,
      status: status ?? this.status,
      lastSuccessAt: lastSuccessAt ?? this.lastSuccessAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (resourceKey.present) {
      map['resource_key'] = Variable<String>(resourceKey.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (lastSuccessAt.present) {
      map['last_success_at'] = Variable<DateTime>(lastSuccessAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SyncMetadataCompanion(')
          ..write('resourceKey: $resourceKey, ')
          ..write('status: $status, ')
          ..write('lastSuccessAt: $lastSuccessAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $PokemonSpeciesTable pokemonSpecies = $PokemonSpeciesTable(this);
  late final $PokemonsTable pokemons = $PokemonsTable(this);
  late final $TypesTable types = $TypesTable(this);
  late final $PokemonTypesTable pokemonTypes = $PokemonTypesTable(this);
  late final $PokemonStatsTable pokemonStats = $PokemonStatsTable(this);
  late final $AbilitiesTable abilities = $AbilitiesTable(this);
  late final $PokemonAbilitiesTable pokemonAbilities =
      $PokemonAbilitiesTable(this);
  late final $MovesTable moves = $MovesTable(this);
  late final $PokemonMovesTable pokemonMoves = $PokemonMovesTable(this);
  late final $EvolutionsTable evolutions = $EvolutionsTable(this);
  late final $TypeEfficaciesTable typeEfficacies = $TypeEfficaciesTable(this);
  late final $FavoritesTable favorites = $FavoritesTable(this);
  late final $TriviaResultsTable triviaResults = $TriviaResultsTable(this);
  late final $TriviaAnswersTable triviaAnswers = $TriviaAnswersTable(this);
  late final $AppSettingsTable appSettings = $AppSettingsTable(this);
  late final $SyncMetadataTable syncMetadata = $SyncMetadataTable(this);
  late final Index pokemonNameIndex = Index('pokemon_name_index',
      'CREATE INDEX pokemon_name_index ON pokemon (name)');
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
        pokemonSpecies,
        pokemons,
        types,
        pokemonTypes,
        pokemonStats,
        abilities,
        pokemonAbilities,
        moves,
        pokemonMoves,
        evolutions,
        typeEfficacies,
        favorites,
        triviaResults,
        triviaAnswers,
        appSettings,
        syncMetadata,
        pokemonNameIndex
      ];
}

typedef $$PokemonSpeciesTableCreateCompanionBuilder = PokemonSpeciesCompanion
    Function({
  Value<int> id,
  required String name,
  Value<int?> generationId,
  Value<int?> evolutionChainId,
  Value<String?> eggGroupsJson,
});
typedef $$PokemonSpeciesTableUpdateCompanionBuilder = PokemonSpeciesCompanion
    Function({
  Value<int> id,
  Value<String> name,
  Value<int?> generationId,
  Value<int?> evolutionChainId,
  Value<String?> eggGroupsJson,
});

final class $$PokemonSpeciesTableReferences
    extends BaseReferences<_$AppDatabase, $PokemonSpeciesTable, PokemonSpecy> {
  $$PokemonSpeciesTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$PokemonsTable, List<Pokemon>> _pokemonsRefsTable(
          _$AppDatabase db) =>
      MultiTypedResultKey.fromTable(db.pokemons,
          aliasName: 'pokemon_species__id__pokemon__species_id');

  $$PokemonsTableProcessedTableManager get pokemonsRefs {
    final manager = $$PokemonsTableTableManager($_db, $_db.pokemons)
        .filter((f) => f.speciesId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_pokemonsRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$PokemonSpeciesTableFilterComposer
    extends Composer<_$AppDatabase, $PokemonSpeciesTable> {
  $$PokemonSpeciesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get generationId => $composableBuilder(
      column: $table.generationId, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get evolutionChainId => $composableBuilder(
      column: $table.evolutionChainId,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get eggGroupsJson => $composableBuilder(
      column: $table.eggGroupsJson, builder: (column) => ColumnFilters(column));

  Expression<bool> pokemonsRefs(
      Expression<bool> Function($$PokemonsTableFilterComposer f) f) {
    final $$PokemonsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.pokemons,
        getReferencedColumn: (t) => t.speciesId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PokemonsTableFilterComposer(
              $db: $db,
              $table: $db.pokemons,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$PokemonSpeciesTableOrderingComposer
    extends Composer<_$AppDatabase, $PokemonSpeciesTable> {
  $$PokemonSpeciesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get generationId => $composableBuilder(
      column: $table.generationId,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get evolutionChainId => $composableBuilder(
      column: $table.evolutionChainId,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get eggGroupsJson => $composableBuilder(
      column: $table.eggGroupsJson,
      builder: (column) => ColumnOrderings(column));
}

class $$PokemonSpeciesTableAnnotationComposer
    extends Composer<_$AppDatabase, $PokemonSpeciesTable> {
  $$PokemonSpeciesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<int> get generationId => $composableBuilder(
      column: $table.generationId, builder: (column) => column);

  GeneratedColumn<int> get evolutionChainId => $composableBuilder(
      column: $table.evolutionChainId, builder: (column) => column);

  GeneratedColumn<String> get eggGroupsJson => $composableBuilder(
      column: $table.eggGroupsJson, builder: (column) => column);

  Expression<T> pokemonsRefs<T extends Object>(
      Expression<T> Function($$PokemonsTableAnnotationComposer a) f) {
    final $$PokemonsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.pokemons,
        getReferencedColumn: (t) => t.speciesId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PokemonsTableAnnotationComposer(
              $db: $db,
              $table: $db.pokemons,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$PokemonSpeciesTableTableManager extends RootTableManager<
    _$AppDatabase,
    $PokemonSpeciesTable,
    PokemonSpecy,
    $$PokemonSpeciesTableFilterComposer,
    $$PokemonSpeciesTableOrderingComposer,
    $$PokemonSpeciesTableAnnotationComposer,
    $$PokemonSpeciesTableCreateCompanionBuilder,
    $$PokemonSpeciesTableUpdateCompanionBuilder,
    (PokemonSpecy, $$PokemonSpeciesTableReferences),
    PokemonSpecy,
    PrefetchHooks Function({bool pokemonsRefs})> {
  $$PokemonSpeciesTableTableManager(
      _$AppDatabase db, $PokemonSpeciesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PokemonSpeciesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PokemonSpeciesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PokemonSpeciesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<int?> generationId = const Value.absent(),
            Value<int?> evolutionChainId = const Value.absent(),
            Value<String?> eggGroupsJson = const Value.absent(),
          }) =>
              PokemonSpeciesCompanion(
            id: id,
            name: name,
            generationId: generationId,
            evolutionChainId: evolutionChainId,
            eggGroupsJson: eggGroupsJson,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String name,
            Value<int?> generationId = const Value.absent(),
            Value<int?> evolutionChainId = const Value.absent(),
            Value<String?> eggGroupsJson = const Value.absent(),
          }) =>
              PokemonSpeciesCompanion.insert(
            id: id,
            name: name,
            generationId: generationId,
            evolutionChainId: evolutionChainId,
            eggGroupsJson: eggGroupsJson,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable<$PokemonSpeciesTable, PokemonSpecy>(table),
                    $$PokemonSpeciesTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({pokemonsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (pokemonsRefs) db.pokemons],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (pokemonsRefs)
                    await $_getPrefetchedDataByColumns<PokemonSpecy,
                            $PokemonSpeciesTable, Pokemon, $PokemonsTable>(
                        currentTable: table,
                        referencedTable: $$PokemonSpeciesTableReferences
                            ._pokemonsRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$PokemonSpeciesTableReferences(db, table, p0)
                                .pokemonsRefs,
                        currentColumn: 'id',
                        referencedColumn: 'species_id',
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$PokemonSpeciesTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $PokemonSpeciesTable,
    PokemonSpecy,
    $$PokemonSpeciesTableFilterComposer,
    $$PokemonSpeciesTableOrderingComposer,
    $$PokemonSpeciesTableAnnotationComposer,
    $$PokemonSpeciesTableCreateCompanionBuilder,
    $$PokemonSpeciesTableUpdateCompanionBuilder,
    (PokemonSpecy, $$PokemonSpeciesTableReferences),
    PokemonSpecy,
    PrefetchHooks Function({bool pokemonsRefs})>;
typedef $$PokemonsTableCreateCompanionBuilder = PokemonsCompanion Function({
  Value<int> id,
  required int nationalDexNumber,
  Value<int?> speciesId,
  Value<bool> isDefault,
  required String name,
  Value<String?> imageUrl,
  Value<String?> artworkLocalPath,
  Value<String?> spriteUrl,
  Value<String?> spriteLocalPath,
  Value<String?> shinyArtworkUrl,
  Value<String?> shinyArtworkLocalPath,
  Value<String?> shinySpriteUrl,
  Value<String?> shinySpriteLocalPath,
  Value<int?> heightDecimeters,
  Value<int?> weightHectograms,
  Value<DateTime> updatedAt,
});
typedef $$PokemonsTableUpdateCompanionBuilder = PokemonsCompanion Function({
  Value<int> id,
  Value<int> nationalDexNumber,
  Value<int?> speciesId,
  Value<bool> isDefault,
  Value<String> name,
  Value<String?> imageUrl,
  Value<String?> artworkLocalPath,
  Value<String?> spriteUrl,
  Value<String?> spriteLocalPath,
  Value<String?> shinyArtworkUrl,
  Value<String?> shinyArtworkLocalPath,
  Value<String?> shinySpriteUrl,
  Value<String?> shinySpriteLocalPath,
  Value<int?> heightDecimeters,
  Value<int?> weightHectograms,
  Value<DateTime> updatedAt,
});

final class $$PokemonsTableReferences
    extends BaseReferences<_$AppDatabase, $PokemonsTable, Pokemon> {
  $$PokemonsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $PokemonSpeciesTable _speciesIdTable(_$AppDatabase db) =>
      db.pokemonSpecies.createAlias('pokemon__species_id__pokemon_species__id');

  $$PokemonSpeciesTableProcessedTableManager? get speciesId {
    final $_column = $_itemColumn<int>('species_id');
    if ($_column == null) return null;
    final manager = $$PokemonSpeciesTableTableManager($_db, $_db.pokemonSpecies)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_speciesIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static MultiTypedResultKey<$PokemonTypesTable, List<PokemonType>>
      _pokemonTypesRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.pokemonTypes,
              aliasName: 'pokemon__id__pokemon_type__pokemon_id');

  $$PokemonTypesTableProcessedTableManager get pokemonTypesRefs {
    final manager = $$PokemonTypesTableTableManager($_db, $_db.pokemonTypes)
        .filter((f) => f.pokemonId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_pokemonTypesRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$PokemonStatsTable, List<PokemonStat>>
      _pokemonStatsRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.pokemonStats,
              aliasName: 'pokemon__id__pokemon_stats__pokemon_id');

  $$PokemonStatsTableProcessedTableManager get pokemonStatsRefs {
    final manager = $$PokemonStatsTableTableManager($_db, $_db.pokemonStats)
        .filter((f) => f.pokemonId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_pokemonStatsRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$PokemonAbilitiesTable, List<PokemonAbility>>
      _pokemonAbilitiesRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.pokemonAbilities,
              aliasName: 'pokemon__id__pokemon_ability__pokemon_id');

  $$PokemonAbilitiesTableProcessedTableManager get pokemonAbilitiesRefs {
    final manager =
        $$PokemonAbilitiesTableTableManager($_db, $_db.pokemonAbilities)
            .filter((f) => f.pokemonId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache =
        $_typedResult.readTableOrNull(_pokemonAbilitiesRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$PokemonMovesTable, List<PokemonMove>>
      _pokemonMovesRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.pokemonMoves,
              aliasName: 'pokemon__id__pokemon_move__pokemon_id');

  $$PokemonMovesTableProcessedTableManager get pokemonMovesRefs {
    final manager = $$PokemonMovesTableTableManager($_db, $_db.pokemonMoves)
        .filter((f) => f.pokemonId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_pokemonMovesRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$FavoritesTable, List<Favorite>>
      _favoritesRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.favorites,
              aliasName: 'pokemon__id__favorite__pokemon_id');

  $$FavoritesTableProcessedTableManager get favoritesRefs {
    final manager = $$FavoritesTableTableManager($_db, $_db.favorites)
        .filter((f) => f.pokemonId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_favoritesRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$TriviaAnswersTable, List<TriviaAnswer>>
      _triviaAnswersRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.triviaAnswers,
              aliasName: 'pokemon__id__trivia_answer__pokemon_id');

  $$TriviaAnswersTableProcessedTableManager get triviaAnswersRefs {
    final manager = $$TriviaAnswersTableTableManager($_db, $_db.triviaAnswers)
        .filter((f) => f.pokemonId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_triviaAnswersRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$PokemonsTableFilterComposer
    extends Composer<_$AppDatabase, $PokemonsTable> {
  $$PokemonsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get nationalDexNumber => $composableBuilder(
      column: $table.nationalDexNumber,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isDefault => $composableBuilder(
      column: $table.isDefault, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get imageUrl => $composableBuilder(
      column: $table.imageUrl, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get artworkLocalPath => $composableBuilder(
      column: $table.artworkLocalPath,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get spriteUrl => $composableBuilder(
      column: $table.spriteUrl, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get spriteLocalPath => $composableBuilder(
      column: $table.spriteLocalPath,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get shinyArtworkUrl => $composableBuilder(
      column: $table.shinyArtworkUrl,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get shinyArtworkLocalPath => $composableBuilder(
      column: $table.shinyArtworkLocalPath,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get shinySpriteUrl => $composableBuilder(
      column: $table.shinySpriteUrl,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get shinySpriteLocalPath => $composableBuilder(
      column: $table.shinySpriteLocalPath,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get heightDecimeters => $composableBuilder(
      column: $table.heightDecimeters,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get weightHectograms => $composableBuilder(
      column: $table.weightHectograms,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));

  $$PokemonSpeciesTableFilterComposer get speciesId {
    final $$PokemonSpeciesTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.speciesId,
        referencedTable: $db.pokemonSpecies,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PokemonSpeciesTableFilterComposer(
              $db: $db,
              $table: $db.pokemonSpecies,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  Expression<bool> pokemonTypesRefs(
      Expression<bool> Function($$PokemonTypesTableFilterComposer f) f) {
    final $$PokemonTypesTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.pokemonTypes,
        getReferencedColumn: (t) => t.pokemonId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PokemonTypesTableFilterComposer(
              $db: $db,
              $table: $db.pokemonTypes,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<bool> pokemonStatsRefs(
      Expression<bool> Function($$PokemonStatsTableFilterComposer f) f) {
    final $$PokemonStatsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.pokemonStats,
        getReferencedColumn: (t) => t.pokemonId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PokemonStatsTableFilterComposer(
              $db: $db,
              $table: $db.pokemonStats,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<bool> pokemonAbilitiesRefs(
      Expression<bool> Function($$PokemonAbilitiesTableFilterComposer f) f) {
    final $$PokemonAbilitiesTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.pokemonAbilities,
        getReferencedColumn: (t) => t.pokemonId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PokemonAbilitiesTableFilterComposer(
              $db: $db,
              $table: $db.pokemonAbilities,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<bool> pokemonMovesRefs(
      Expression<bool> Function($$PokemonMovesTableFilterComposer f) f) {
    final $$PokemonMovesTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.pokemonMoves,
        getReferencedColumn: (t) => t.pokemonId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PokemonMovesTableFilterComposer(
              $db: $db,
              $table: $db.pokemonMoves,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<bool> favoritesRefs(
      Expression<bool> Function($$FavoritesTableFilterComposer f) f) {
    final $$FavoritesTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.favorites,
        getReferencedColumn: (t) => t.pokemonId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$FavoritesTableFilterComposer(
              $db: $db,
              $table: $db.favorites,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<bool> triviaAnswersRefs(
      Expression<bool> Function($$TriviaAnswersTableFilterComposer f) f) {
    final $$TriviaAnswersTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.triviaAnswers,
        getReferencedColumn: (t) => t.pokemonId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TriviaAnswersTableFilterComposer(
              $db: $db,
              $table: $db.triviaAnswers,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$PokemonsTableOrderingComposer
    extends Composer<_$AppDatabase, $PokemonsTable> {
  $$PokemonsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get nationalDexNumber => $composableBuilder(
      column: $table.nationalDexNumber,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isDefault => $composableBuilder(
      column: $table.isDefault, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get imageUrl => $composableBuilder(
      column: $table.imageUrl, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get artworkLocalPath => $composableBuilder(
      column: $table.artworkLocalPath,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get spriteUrl => $composableBuilder(
      column: $table.spriteUrl, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get spriteLocalPath => $composableBuilder(
      column: $table.spriteLocalPath,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get shinyArtworkUrl => $composableBuilder(
      column: $table.shinyArtworkUrl,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get shinyArtworkLocalPath => $composableBuilder(
      column: $table.shinyArtworkLocalPath,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get shinySpriteUrl => $composableBuilder(
      column: $table.shinySpriteUrl,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get shinySpriteLocalPath => $composableBuilder(
      column: $table.shinySpriteLocalPath,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get heightDecimeters => $composableBuilder(
      column: $table.heightDecimeters,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get weightHectograms => $composableBuilder(
      column: $table.weightHectograms,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));

  $$PokemonSpeciesTableOrderingComposer get speciesId {
    final $$PokemonSpeciesTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.speciesId,
        referencedTable: $db.pokemonSpecies,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PokemonSpeciesTableOrderingComposer(
              $db: $db,
              $table: $db.pokemonSpecies,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$PokemonsTableAnnotationComposer
    extends Composer<_$AppDatabase, $PokemonsTable> {
  $$PokemonsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get nationalDexNumber => $composableBuilder(
      column: $table.nationalDexNumber, builder: (column) => column);

  GeneratedColumn<bool> get isDefault =>
      $composableBuilder(column: $table.isDefault, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get imageUrl =>
      $composableBuilder(column: $table.imageUrl, builder: (column) => column);

  GeneratedColumn<String> get artworkLocalPath => $composableBuilder(
      column: $table.artworkLocalPath, builder: (column) => column);

  GeneratedColumn<String> get spriteUrl =>
      $composableBuilder(column: $table.spriteUrl, builder: (column) => column);

  GeneratedColumn<String> get spriteLocalPath => $composableBuilder(
      column: $table.spriteLocalPath, builder: (column) => column);

  GeneratedColumn<String> get shinyArtworkUrl => $composableBuilder(
      column: $table.shinyArtworkUrl, builder: (column) => column);

  GeneratedColumn<String> get shinyArtworkLocalPath => $composableBuilder(
      column: $table.shinyArtworkLocalPath, builder: (column) => column);

  GeneratedColumn<String> get shinySpriteUrl => $composableBuilder(
      column: $table.shinySpriteUrl, builder: (column) => column);

  GeneratedColumn<String> get shinySpriteLocalPath => $composableBuilder(
      column: $table.shinySpriteLocalPath, builder: (column) => column);

  GeneratedColumn<int> get heightDecimeters => $composableBuilder(
      column: $table.heightDecimeters, builder: (column) => column);

  GeneratedColumn<int> get weightHectograms => $composableBuilder(
      column: $table.weightHectograms, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  $$PokemonSpeciesTableAnnotationComposer get speciesId {
    final $$PokemonSpeciesTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.speciesId,
        referencedTable: $db.pokemonSpecies,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PokemonSpeciesTableAnnotationComposer(
              $db: $db,
              $table: $db.pokemonSpecies,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  Expression<T> pokemonTypesRefs<T extends Object>(
      Expression<T> Function($$PokemonTypesTableAnnotationComposer a) f) {
    final $$PokemonTypesTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.pokemonTypes,
        getReferencedColumn: (t) => t.pokemonId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PokemonTypesTableAnnotationComposer(
              $db: $db,
              $table: $db.pokemonTypes,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<T> pokemonStatsRefs<T extends Object>(
      Expression<T> Function($$PokemonStatsTableAnnotationComposer a) f) {
    final $$PokemonStatsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.pokemonStats,
        getReferencedColumn: (t) => t.pokemonId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PokemonStatsTableAnnotationComposer(
              $db: $db,
              $table: $db.pokemonStats,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<T> pokemonAbilitiesRefs<T extends Object>(
      Expression<T> Function($$PokemonAbilitiesTableAnnotationComposer a) f) {
    final $$PokemonAbilitiesTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.pokemonAbilities,
        getReferencedColumn: (t) => t.pokemonId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PokemonAbilitiesTableAnnotationComposer(
              $db: $db,
              $table: $db.pokemonAbilities,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<T> pokemonMovesRefs<T extends Object>(
      Expression<T> Function($$PokemonMovesTableAnnotationComposer a) f) {
    final $$PokemonMovesTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.pokemonMoves,
        getReferencedColumn: (t) => t.pokemonId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PokemonMovesTableAnnotationComposer(
              $db: $db,
              $table: $db.pokemonMoves,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<T> favoritesRefs<T extends Object>(
      Expression<T> Function($$FavoritesTableAnnotationComposer a) f) {
    final $$FavoritesTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.favorites,
        getReferencedColumn: (t) => t.pokemonId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$FavoritesTableAnnotationComposer(
              $db: $db,
              $table: $db.favorites,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<T> triviaAnswersRefs<T extends Object>(
      Expression<T> Function($$TriviaAnswersTableAnnotationComposer a) f) {
    final $$TriviaAnswersTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.triviaAnswers,
        getReferencedColumn: (t) => t.pokemonId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TriviaAnswersTableAnnotationComposer(
              $db: $db,
              $table: $db.triviaAnswers,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$PokemonsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $PokemonsTable,
    Pokemon,
    $$PokemonsTableFilterComposer,
    $$PokemonsTableOrderingComposer,
    $$PokemonsTableAnnotationComposer,
    $$PokemonsTableCreateCompanionBuilder,
    $$PokemonsTableUpdateCompanionBuilder,
    (Pokemon, $$PokemonsTableReferences),
    Pokemon,
    PrefetchHooks Function(
        {bool speciesId,
        bool pokemonTypesRefs,
        bool pokemonStatsRefs,
        bool pokemonAbilitiesRefs,
        bool pokemonMovesRefs,
        bool favoritesRefs,
        bool triviaAnswersRefs})> {
  $$PokemonsTableTableManager(_$AppDatabase db, $PokemonsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PokemonsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PokemonsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PokemonsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> nationalDexNumber = const Value.absent(),
            Value<int?> speciesId = const Value.absent(),
            Value<bool> isDefault = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String?> imageUrl = const Value.absent(),
            Value<String?> artworkLocalPath = const Value.absent(),
            Value<String?> spriteUrl = const Value.absent(),
            Value<String?> spriteLocalPath = const Value.absent(),
            Value<String?> shinyArtworkUrl = const Value.absent(),
            Value<String?> shinyArtworkLocalPath = const Value.absent(),
            Value<String?> shinySpriteUrl = const Value.absent(),
            Value<String?> shinySpriteLocalPath = const Value.absent(),
            Value<int?> heightDecimeters = const Value.absent(),
            Value<int?> weightHectograms = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
          }) =>
              PokemonsCompanion(
            id: id,
            nationalDexNumber: nationalDexNumber,
            speciesId: speciesId,
            isDefault: isDefault,
            name: name,
            imageUrl: imageUrl,
            artworkLocalPath: artworkLocalPath,
            spriteUrl: spriteUrl,
            spriteLocalPath: spriteLocalPath,
            shinyArtworkUrl: shinyArtworkUrl,
            shinyArtworkLocalPath: shinyArtworkLocalPath,
            shinySpriteUrl: shinySpriteUrl,
            shinySpriteLocalPath: shinySpriteLocalPath,
            heightDecimeters: heightDecimeters,
            weightHectograms: weightHectograms,
            updatedAt: updatedAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int nationalDexNumber,
            Value<int?> speciesId = const Value.absent(),
            Value<bool> isDefault = const Value.absent(),
            required String name,
            Value<String?> imageUrl = const Value.absent(),
            Value<String?> artworkLocalPath = const Value.absent(),
            Value<String?> spriteUrl = const Value.absent(),
            Value<String?> spriteLocalPath = const Value.absent(),
            Value<String?> shinyArtworkUrl = const Value.absent(),
            Value<String?> shinyArtworkLocalPath = const Value.absent(),
            Value<String?> shinySpriteUrl = const Value.absent(),
            Value<String?> shinySpriteLocalPath = const Value.absent(),
            Value<int?> heightDecimeters = const Value.absent(),
            Value<int?> weightHectograms = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
          }) =>
              PokemonsCompanion.insert(
            id: id,
            nationalDexNumber: nationalDexNumber,
            speciesId: speciesId,
            isDefault: isDefault,
            name: name,
            imageUrl: imageUrl,
            artworkLocalPath: artworkLocalPath,
            spriteUrl: spriteUrl,
            spriteLocalPath: spriteLocalPath,
            shinyArtworkUrl: shinyArtworkUrl,
            shinyArtworkLocalPath: shinyArtworkLocalPath,
            shinySpriteUrl: shinySpriteUrl,
            shinySpriteLocalPath: shinySpriteLocalPath,
            heightDecimeters: heightDecimeters,
            weightHectograms: weightHectograms,
            updatedAt: updatedAt,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable<$PokemonsTable, Pokemon>(table),
                    $$PokemonsTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: (
              {speciesId = false,
              pokemonTypesRefs = false,
              pokemonStatsRefs = false,
              pokemonAbilitiesRefs = false,
              pokemonMovesRefs = false,
              favoritesRefs = false,
              triviaAnswersRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (pokemonTypesRefs) db.pokemonTypes,
                if (pokemonStatsRefs) db.pokemonStats,
                if (pokemonAbilitiesRefs) db.pokemonAbilities,
                if (pokemonMovesRefs) db.pokemonMoves,
                if (favoritesRefs) db.favorites,
                if (triviaAnswersRefs) db.triviaAnswers
              ],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (speciesId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.speciesId,
                    referencedTable:
                        $$PokemonsTableReferences._speciesIdTable(db),
                    referencedColumn:
                        $$PokemonsTableReferences._speciesIdTable(db).id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [
                  if (pokemonTypesRefs)
                    await $_getPrefetchedDataByColumns<Pokemon, $PokemonsTable,
                            PokemonType, $PokemonTypesTable>(
                        currentTable: table,
                        referencedTable: $$PokemonsTableReferences
                            ._pokemonTypesRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$PokemonsTableReferences(db, table, p0)
                                .pokemonTypesRefs,
                        currentColumn: 'id',
                        referencedColumn: 'pokemon_id',
                        typedResults: items),
                  if (pokemonStatsRefs)
                    await $_getPrefetchedDataByColumns<Pokemon, $PokemonsTable,
                            PokemonStat, $PokemonStatsTable>(
                        currentTable: table,
                        referencedTable: $$PokemonsTableReferences
                            ._pokemonStatsRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$PokemonsTableReferences(db, table, p0)
                                .pokemonStatsRefs,
                        currentColumn: 'id',
                        referencedColumn: 'pokemon_id',
                        typedResults: items),
                  if (pokemonAbilitiesRefs)
                    await $_getPrefetchedDataByColumns<Pokemon, $PokemonsTable,
                            PokemonAbility, $PokemonAbilitiesTable>(
                        currentTable: table,
                        referencedTable: $$PokemonsTableReferences
                            ._pokemonAbilitiesRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$PokemonsTableReferences(db, table, p0)
                                .pokemonAbilitiesRefs,
                        currentColumn: 'id',
                        referencedColumn: 'pokemon_id',
                        typedResults: items),
                  if (pokemonMovesRefs)
                    await $_getPrefetchedDataByColumns<Pokemon, $PokemonsTable,
                            PokemonMove, $PokemonMovesTable>(
                        currentTable: table,
                        referencedTable: $$PokemonsTableReferences
                            ._pokemonMovesRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$PokemonsTableReferences(db, table, p0)
                                .pokemonMovesRefs,
                        currentColumn: 'id',
                        referencedColumn: 'pokemon_id',
                        typedResults: items),
                  if (favoritesRefs)
                    await $_getPrefetchedDataByColumns<Pokemon, $PokemonsTable,
                            Favorite, $FavoritesTable>(
                        currentTable: table,
                        referencedTable:
                            $$PokemonsTableReferences._favoritesRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$PokemonsTableReferences(db, table, p0)
                                .favoritesRefs,
                        currentColumn: 'id',
                        referencedColumn: 'pokemon_id',
                        typedResults: items),
                  if (triviaAnswersRefs)
                    await $_getPrefetchedDataByColumns<Pokemon, $PokemonsTable,
                            TriviaAnswer, $TriviaAnswersTable>(
                        currentTable: table,
                        referencedTable: $$PokemonsTableReferences
                            ._triviaAnswersRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$PokemonsTableReferences(db, table, p0)
                                .triviaAnswersRefs,
                        currentColumn: 'id',
                        referencedColumn: 'pokemon_id',
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$PokemonsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $PokemonsTable,
    Pokemon,
    $$PokemonsTableFilterComposer,
    $$PokemonsTableOrderingComposer,
    $$PokemonsTableAnnotationComposer,
    $$PokemonsTableCreateCompanionBuilder,
    $$PokemonsTableUpdateCompanionBuilder,
    (Pokemon, $$PokemonsTableReferences),
    Pokemon,
    PrefetchHooks Function(
        {bool speciesId,
        bool pokemonTypesRefs,
        bool pokemonStatsRefs,
        bool pokemonAbilitiesRefs,
        bool pokemonMovesRefs,
        bool favoritesRefs,
        bool triviaAnswersRefs})>;
typedef $$TypesTableCreateCompanionBuilder = TypesCompanion Function({
  Value<int> id,
  required String name,
});
typedef $$TypesTableUpdateCompanionBuilder = TypesCompanion Function({
  Value<int> id,
  Value<String> name,
});

final class $$TypesTableReferences
    extends BaseReferences<_$AppDatabase, $TypesTable, Type> {
  $$TypesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$PokemonTypesTable, List<PokemonType>>
      _pokemonTypesRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.pokemonTypes,
              aliasName: 'type__id__pokemon_type__type_id');

  $$PokemonTypesTableProcessedTableManager get pokemonTypesRefs {
    final manager = $$PokemonTypesTableTableManager($_db, $_db.pokemonTypes)
        .filter((f) => f.typeId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_pokemonTypesRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$TypesTableFilterComposer extends Composer<_$AppDatabase, $TypesTable> {
  $$TypesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  Expression<bool> pokemonTypesRefs(
      Expression<bool> Function($$PokemonTypesTableFilterComposer f) f) {
    final $$PokemonTypesTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.pokemonTypes,
        getReferencedColumn: (t) => t.typeId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PokemonTypesTableFilterComposer(
              $db: $db,
              $table: $db.pokemonTypes,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$TypesTableOrderingComposer
    extends Composer<_$AppDatabase, $TypesTable> {
  $$TypesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));
}

class $$TypesTableAnnotationComposer
    extends Composer<_$AppDatabase, $TypesTable> {
  $$TypesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  Expression<T> pokemonTypesRefs<T extends Object>(
      Expression<T> Function($$PokemonTypesTableAnnotationComposer a) f) {
    final $$PokemonTypesTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.pokemonTypes,
        getReferencedColumn: (t) => t.typeId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PokemonTypesTableAnnotationComposer(
              $db: $db,
              $table: $db.pokemonTypes,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$TypesTableTableManager extends RootTableManager<
    _$AppDatabase,
    $TypesTable,
    Type,
    $$TypesTableFilterComposer,
    $$TypesTableOrderingComposer,
    $$TypesTableAnnotationComposer,
    $$TypesTableCreateCompanionBuilder,
    $$TypesTableUpdateCompanionBuilder,
    (Type, $$TypesTableReferences),
    Type,
    PrefetchHooks Function({bool pokemonTypesRefs})> {
  $$TypesTableTableManager(_$AppDatabase db, $TypesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TypesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TypesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TypesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> name = const Value.absent(),
          }) =>
              TypesCompanion(
            id: id,
            name: name,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String name,
          }) =>
              TypesCompanion.insert(
            id: id,
            name: name,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable<$TypesTable, Type>(table),
                    $$TypesTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({pokemonTypesRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (pokemonTypesRefs) db.pokemonTypes],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (pokemonTypesRefs)
                    await $_getPrefetchedDataByColumns<Type, $TypesTable,
                            PokemonType, $PokemonTypesTable>(
                        currentTable: table,
                        referencedTable:
                            $$TypesTableReferences._pokemonTypesRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$TypesTableReferences(db, table, p0)
                                .pokemonTypesRefs,
                        currentColumn: 'id',
                        referencedColumn: 'type_id',
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$TypesTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $TypesTable,
    Type,
    $$TypesTableFilterComposer,
    $$TypesTableOrderingComposer,
    $$TypesTableAnnotationComposer,
    $$TypesTableCreateCompanionBuilder,
    $$TypesTableUpdateCompanionBuilder,
    (Type, $$TypesTableReferences),
    Type,
    PrefetchHooks Function({bool pokemonTypesRefs})>;
typedef $$PokemonTypesTableCreateCompanionBuilder = PokemonTypesCompanion
    Function({
  required int pokemonId,
  required int typeId,
  required int slot,
  Value<int> rowid,
});
typedef $$PokemonTypesTableUpdateCompanionBuilder = PokemonTypesCompanion
    Function({
  Value<int> pokemonId,
  Value<int> typeId,
  Value<int> slot,
  Value<int> rowid,
});

final class $$PokemonTypesTableReferences
    extends BaseReferences<_$AppDatabase, $PokemonTypesTable, PokemonType> {
  $$PokemonTypesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $PokemonsTable _pokemonIdTable(_$AppDatabase db) =>
      db.pokemons.createAlias('pokemon_type__pokemon_id__pokemon__id');

  $$PokemonsTableProcessedTableManager get pokemonId {
    final $_column = $_itemColumn<int>('pokemon_id')!;

    final manager = $$PokemonsTableTableManager($_db, $_db.pokemons)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_pokemonIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $TypesTable _typeIdTable(_$AppDatabase db) =>
      db.types.createAlias('pokemon_type__type_id__type__id');

  $$TypesTableProcessedTableManager get typeId {
    final $_column = $_itemColumn<int>('type_id')!;

    final manager = $$TypesTableTableManager($_db, $_db.types)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_typeIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$PokemonTypesTableFilterComposer
    extends Composer<_$AppDatabase, $PokemonTypesTable> {
  $$PokemonTypesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get slot => $composableBuilder(
      column: $table.slot, builder: (column) => ColumnFilters(column));

  $$PokemonsTableFilterComposer get pokemonId {
    final $$PokemonsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.pokemonId,
        referencedTable: $db.pokemons,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PokemonsTableFilterComposer(
              $db: $db,
              $table: $db.pokemons,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$TypesTableFilterComposer get typeId {
    final $$TypesTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.typeId,
        referencedTable: $db.types,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TypesTableFilterComposer(
              $db: $db,
              $table: $db.types,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$PokemonTypesTableOrderingComposer
    extends Composer<_$AppDatabase, $PokemonTypesTable> {
  $$PokemonTypesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get slot => $composableBuilder(
      column: $table.slot, builder: (column) => ColumnOrderings(column));

  $$PokemonsTableOrderingComposer get pokemonId {
    final $$PokemonsTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.pokemonId,
        referencedTable: $db.pokemons,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PokemonsTableOrderingComposer(
              $db: $db,
              $table: $db.pokemons,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$TypesTableOrderingComposer get typeId {
    final $$TypesTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.typeId,
        referencedTable: $db.types,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TypesTableOrderingComposer(
              $db: $db,
              $table: $db.types,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$PokemonTypesTableAnnotationComposer
    extends Composer<_$AppDatabase, $PokemonTypesTable> {
  $$PokemonTypesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get slot =>
      $composableBuilder(column: $table.slot, builder: (column) => column);

  $$PokemonsTableAnnotationComposer get pokemonId {
    final $$PokemonsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.pokemonId,
        referencedTable: $db.pokemons,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PokemonsTableAnnotationComposer(
              $db: $db,
              $table: $db.pokemons,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$TypesTableAnnotationComposer get typeId {
    final $$TypesTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.typeId,
        referencedTable: $db.types,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TypesTableAnnotationComposer(
              $db: $db,
              $table: $db.types,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$PokemonTypesTableTableManager extends RootTableManager<
    _$AppDatabase,
    $PokemonTypesTable,
    PokemonType,
    $$PokemonTypesTableFilterComposer,
    $$PokemonTypesTableOrderingComposer,
    $$PokemonTypesTableAnnotationComposer,
    $$PokemonTypesTableCreateCompanionBuilder,
    $$PokemonTypesTableUpdateCompanionBuilder,
    (PokemonType, $$PokemonTypesTableReferences),
    PokemonType,
    PrefetchHooks Function({bool pokemonId, bool typeId})> {
  $$PokemonTypesTableTableManager(_$AppDatabase db, $PokemonTypesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PokemonTypesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PokemonTypesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PokemonTypesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> pokemonId = const Value.absent(),
            Value<int> typeId = const Value.absent(),
            Value<int> slot = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              PokemonTypesCompanion(
            pokemonId: pokemonId,
            typeId: typeId,
            slot: slot,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required int pokemonId,
            required int typeId,
            required int slot,
            Value<int> rowid = const Value.absent(),
          }) =>
              PokemonTypesCompanion.insert(
            pokemonId: pokemonId,
            typeId: typeId,
            slot: slot,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable<$PokemonTypesTable, PokemonType>(table),
                    $$PokemonTypesTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({pokemonId = false, typeId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (pokemonId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.pokemonId,
                    referencedTable:
                        $$PokemonTypesTableReferences._pokemonIdTable(db),
                    referencedColumn:
                        $$PokemonTypesTableReferences._pokemonIdTable(db).id,
                  ) as T;
                }
                if (typeId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.typeId,
                    referencedTable:
                        $$PokemonTypesTableReferences._typeIdTable(db),
                    referencedColumn:
                        $$PokemonTypesTableReferences._typeIdTable(db).id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$PokemonTypesTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $PokemonTypesTable,
    PokemonType,
    $$PokemonTypesTableFilterComposer,
    $$PokemonTypesTableOrderingComposer,
    $$PokemonTypesTableAnnotationComposer,
    $$PokemonTypesTableCreateCompanionBuilder,
    $$PokemonTypesTableUpdateCompanionBuilder,
    (PokemonType, $$PokemonTypesTableReferences),
    PokemonType,
    PrefetchHooks Function({bool pokemonId, bool typeId})>;
typedef $$PokemonStatsTableCreateCompanionBuilder = PokemonStatsCompanion
    Function({
  Value<int> pokemonId,
  required int hp,
  required int attack,
  required int defense,
  required int specialAttack,
  required int specialDefense,
  required int speed,
});
typedef $$PokemonStatsTableUpdateCompanionBuilder = PokemonStatsCompanion
    Function({
  Value<int> pokemonId,
  Value<int> hp,
  Value<int> attack,
  Value<int> defense,
  Value<int> specialAttack,
  Value<int> specialDefense,
  Value<int> speed,
});

final class $$PokemonStatsTableReferences
    extends BaseReferences<_$AppDatabase, $PokemonStatsTable, PokemonStat> {
  $$PokemonStatsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $PokemonsTable _pokemonIdTable(_$AppDatabase db) =>
      db.pokemons.createAlias('pokemon_stats__pokemon_id__pokemon__id');

  $$PokemonsTableProcessedTableManager get pokemonId {
    final $_column = $_itemColumn<int>('pokemon_id')!;

    final manager = $$PokemonsTableTableManager($_db, $_db.pokemons)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_pokemonIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$PokemonStatsTableFilterComposer
    extends Composer<_$AppDatabase, $PokemonStatsTable> {
  $$PokemonStatsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get hp => $composableBuilder(
      column: $table.hp, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get attack => $composableBuilder(
      column: $table.attack, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get defense => $composableBuilder(
      column: $table.defense, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get specialAttack => $composableBuilder(
      column: $table.specialAttack, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get specialDefense => $composableBuilder(
      column: $table.specialDefense,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get speed => $composableBuilder(
      column: $table.speed, builder: (column) => ColumnFilters(column));

  $$PokemonsTableFilterComposer get pokemonId {
    final $$PokemonsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.pokemonId,
        referencedTable: $db.pokemons,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PokemonsTableFilterComposer(
              $db: $db,
              $table: $db.pokemons,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$PokemonStatsTableOrderingComposer
    extends Composer<_$AppDatabase, $PokemonStatsTable> {
  $$PokemonStatsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get hp => $composableBuilder(
      column: $table.hp, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get attack => $composableBuilder(
      column: $table.attack, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get defense => $composableBuilder(
      column: $table.defense, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get specialAttack => $composableBuilder(
      column: $table.specialAttack,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get specialDefense => $composableBuilder(
      column: $table.specialDefense,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get speed => $composableBuilder(
      column: $table.speed, builder: (column) => ColumnOrderings(column));

  $$PokemonsTableOrderingComposer get pokemonId {
    final $$PokemonsTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.pokemonId,
        referencedTable: $db.pokemons,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PokemonsTableOrderingComposer(
              $db: $db,
              $table: $db.pokemons,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$PokemonStatsTableAnnotationComposer
    extends Composer<_$AppDatabase, $PokemonStatsTable> {
  $$PokemonStatsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get hp =>
      $composableBuilder(column: $table.hp, builder: (column) => column);

  GeneratedColumn<int> get attack =>
      $composableBuilder(column: $table.attack, builder: (column) => column);

  GeneratedColumn<int> get defense =>
      $composableBuilder(column: $table.defense, builder: (column) => column);

  GeneratedColumn<int> get specialAttack => $composableBuilder(
      column: $table.specialAttack, builder: (column) => column);

  GeneratedColumn<int> get specialDefense => $composableBuilder(
      column: $table.specialDefense, builder: (column) => column);

  GeneratedColumn<int> get speed =>
      $composableBuilder(column: $table.speed, builder: (column) => column);

  $$PokemonsTableAnnotationComposer get pokemonId {
    final $$PokemonsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.pokemonId,
        referencedTable: $db.pokemons,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PokemonsTableAnnotationComposer(
              $db: $db,
              $table: $db.pokemons,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$PokemonStatsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $PokemonStatsTable,
    PokemonStat,
    $$PokemonStatsTableFilterComposer,
    $$PokemonStatsTableOrderingComposer,
    $$PokemonStatsTableAnnotationComposer,
    $$PokemonStatsTableCreateCompanionBuilder,
    $$PokemonStatsTableUpdateCompanionBuilder,
    (PokemonStat, $$PokemonStatsTableReferences),
    PokemonStat,
    PrefetchHooks Function({bool pokemonId})> {
  $$PokemonStatsTableTableManager(_$AppDatabase db, $PokemonStatsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PokemonStatsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PokemonStatsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PokemonStatsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> pokemonId = const Value.absent(),
            Value<int> hp = const Value.absent(),
            Value<int> attack = const Value.absent(),
            Value<int> defense = const Value.absent(),
            Value<int> specialAttack = const Value.absent(),
            Value<int> specialDefense = const Value.absent(),
            Value<int> speed = const Value.absent(),
          }) =>
              PokemonStatsCompanion(
            pokemonId: pokemonId,
            hp: hp,
            attack: attack,
            defense: defense,
            specialAttack: specialAttack,
            specialDefense: specialDefense,
            speed: speed,
          ),
          createCompanionCallback: ({
            Value<int> pokemonId = const Value.absent(),
            required int hp,
            required int attack,
            required int defense,
            required int specialAttack,
            required int specialDefense,
            required int speed,
          }) =>
              PokemonStatsCompanion.insert(
            pokemonId: pokemonId,
            hp: hp,
            attack: attack,
            defense: defense,
            specialAttack: specialAttack,
            specialDefense: specialDefense,
            speed: speed,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable<$PokemonStatsTable, PokemonStat>(table),
                    $$PokemonStatsTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({pokemonId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (pokemonId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.pokemonId,
                    referencedTable:
                        $$PokemonStatsTableReferences._pokemonIdTable(db),
                    referencedColumn:
                        $$PokemonStatsTableReferences._pokemonIdTable(db).id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$PokemonStatsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $PokemonStatsTable,
    PokemonStat,
    $$PokemonStatsTableFilterComposer,
    $$PokemonStatsTableOrderingComposer,
    $$PokemonStatsTableAnnotationComposer,
    $$PokemonStatsTableCreateCompanionBuilder,
    $$PokemonStatsTableUpdateCompanionBuilder,
    (PokemonStat, $$PokemonStatsTableReferences),
    PokemonStat,
    PrefetchHooks Function({bool pokemonId})>;
typedef $$AbilitiesTableCreateCompanionBuilder = AbilitiesCompanion Function({
  Value<int> id,
  required String name,
  Value<String?> effectSummary,
});
typedef $$AbilitiesTableUpdateCompanionBuilder = AbilitiesCompanion Function({
  Value<int> id,
  Value<String> name,
  Value<String?> effectSummary,
});

final class $$AbilitiesTableReferences
    extends BaseReferences<_$AppDatabase, $AbilitiesTable, Ability> {
  $$AbilitiesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$PokemonAbilitiesTable, List<PokemonAbility>>
      _pokemonAbilitiesRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.pokemonAbilities,
              aliasName: 'ability__id__pokemon_ability__ability_id');

  $$PokemonAbilitiesTableProcessedTableManager get pokemonAbilitiesRefs {
    final manager =
        $$PokemonAbilitiesTableTableManager($_db, $_db.pokemonAbilities)
            .filter((f) => f.abilityId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache =
        $_typedResult.readTableOrNull(_pokemonAbilitiesRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$AbilitiesTableFilterComposer
    extends Composer<_$AppDatabase, $AbilitiesTable> {
  $$AbilitiesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get effectSummary => $composableBuilder(
      column: $table.effectSummary, builder: (column) => ColumnFilters(column));

  Expression<bool> pokemonAbilitiesRefs(
      Expression<bool> Function($$PokemonAbilitiesTableFilterComposer f) f) {
    final $$PokemonAbilitiesTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.pokemonAbilities,
        getReferencedColumn: (t) => t.abilityId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PokemonAbilitiesTableFilterComposer(
              $db: $db,
              $table: $db.pokemonAbilities,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$AbilitiesTableOrderingComposer
    extends Composer<_$AppDatabase, $AbilitiesTable> {
  $$AbilitiesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get effectSummary => $composableBuilder(
      column: $table.effectSummary,
      builder: (column) => ColumnOrderings(column));
}

class $$AbilitiesTableAnnotationComposer
    extends Composer<_$AppDatabase, $AbilitiesTable> {
  $$AbilitiesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get effectSummary => $composableBuilder(
      column: $table.effectSummary, builder: (column) => column);

  Expression<T> pokemonAbilitiesRefs<T extends Object>(
      Expression<T> Function($$PokemonAbilitiesTableAnnotationComposer a) f) {
    final $$PokemonAbilitiesTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.pokemonAbilities,
        getReferencedColumn: (t) => t.abilityId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PokemonAbilitiesTableAnnotationComposer(
              $db: $db,
              $table: $db.pokemonAbilities,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$AbilitiesTableTableManager extends RootTableManager<
    _$AppDatabase,
    $AbilitiesTable,
    Ability,
    $$AbilitiesTableFilterComposer,
    $$AbilitiesTableOrderingComposer,
    $$AbilitiesTableAnnotationComposer,
    $$AbilitiesTableCreateCompanionBuilder,
    $$AbilitiesTableUpdateCompanionBuilder,
    (Ability, $$AbilitiesTableReferences),
    Ability,
    PrefetchHooks Function({bool pokemonAbilitiesRefs})> {
  $$AbilitiesTableTableManager(_$AppDatabase db, $AbilitiesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AbilitiesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AbilitiesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AbilitiesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String?> effectSummary = const Value.absent(),
          }) =>
              AbilitiesCompanion(
            id: id,
            name: name,
            effectSummary: effectSummary,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String name,
            Value<String?> effectSummary = const Value.absent(),
          }) =>
              AbilitiesCompanion.insert(
            id: id,
            name: name,
            effectSummary: effectSummary,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable<$AbilitiesTable, Ability>(table),
                    $$AbilitiesTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({pokemonAbilitiesRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (pokemonAbilitiesRefs) db.pokemonAbilities
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (pokemonAbilitiesRefs)
                    await $_getPrefetchedDataByColumns<Ability, $AbilitiesTable,
                            PokemonAbility, $PokemonAbilitiesTable>(
                        currentTable: table,
                        referencedTable: $$AbilitiesTableReferences
                            ._pokemonAbilitiesRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$AbilitiesTableReferences(db, table, p0)
                                .pokemonAbilitiesRefs,
                        currentColumn: 'id',
                        referencedColumn: 'ability_id',
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$AbilitiesTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $AbilitiesTable,
    Ability,
    $$AbilitiesTableFilterComposer,
    $$AbilitiesTableOrderingComposer,
    $$AbilitiesTableAnnotationComposer,
    $$AbilitiesTableCreateCompanionBuilder,
    $$AbilitiesTableUpdateCompanionBuilder,
    (Ability, $$AbilitiesTableReferences),
    Ability,
    PrefetchHooks Function({bool pokemonAbilitiesRefs})>;
typedef $$PokemonAbilitiesTableCreateCompanionBuilder
    = PokemonAbilitiesCompanion Function({
  required int pokemonId,
  required int abilityId,
  required bool isHidden,
  required int slot,
  Value<int> rowid,
});
typedef $$PokemonAbilitiesTableUpdateCompanionBuilder
    = PokemonAbilitiesCompanion Function({
  Value<int> pokemonId,
  Value<int> abilityId,
  Value<bool> isHidden,
  Value<int> slot,
  Value<int> rowid,
});

final class $$PokemonAbilitiesTableReferences extends BaseReferences<
    _$AppDatabase, $PokemonAbilitiesTable, PokemonAbility> {
  $$PokemonAbilitiesTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $PokemonsTable _pokemonIdTable(_$AppDatabase db) =>
      db.pokemons.createAlias('pokemon_ability__pokemon_id__pokemon__id');

  $$PokemonsTableProcessedTableManager get pokemonId {
    final $_column = $_itemColumn<int>('pokemon_id')!;

    final manager = $$PokemonsTableTableManager($_db, $_db.pokemons)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_pokemonIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $AbilitiesTable _abilityIdTable(_$AppDatabase db) =>
      db.abilities.createAlias('pokemon_ability__ability_id__ability__id');

  $$AbilitiesTableProcessedTableManager get abilityId {
    final $_column = $_itemColumn<int>('ability_id')!;

    final manager = $$AbilitiesTableTableManager($_db, $_db.abilities)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_abilityIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$PokemonAbilitiesTableFilterComposer
    extends Composer<_$AppDatabase, $PokemonAbilitiesTable> {
  $$PokemonAbilitiesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<bool> get isHidden => $composableBuilder(
      column: $table.isHidden, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get slot => $composableBuilder(
      column: $table.slot, builder: (column) => ColumnFilters(column));

  $$PokemonsTableFilterComposer get pokemonId {
    final $$PokemonsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.pokemonId,
        referencedTable: $db.pokemons,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PokemonsTableFilterComposer(
              $db: $db,
              $table: $db.pokemons,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$AbilitiesTableFilterComposer get abilityId {
    final $$AbilitiesTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.abilityId,
        referencedTable: $db.abilities,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$AbilitiesTableFilterComposer(
              $db: $db,
              $table: $db.abilities,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$PokemonAbilitiesTableOrderingComposer
    extends Composer<_$AppDatabase, $PokemonAbilitiesTable> {
  $$PokemonAbilitiesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<bool> get isHidden => $composableBuilder(
      column: $table.isHidden, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get slot => $composableBuilder(
      column: $table.slot, builder: (column) => ColumnOrderings(column));

  $$PokemonsTableOrderingComposer get pokemonId {
    final $$PokemonsTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.pokemonId,
        referencedTable: $db.pokemons,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PokemonsTableOrderingComposer(
              $db: $db,
              $table: $db.pokemons,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$AbilitiesTableOrderingComposer get abilityId {
    final $$AbilitiesTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.abilityId,
        referencedTable: $db.abilities,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$AbilitiesTableOrderingComposer(
              $db: $db,
              $table: $db.abilities,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$PokemonAbilitiesTableAnnotationComposer
    extends Composer<_$AppDatabase, $PokemonAbilitiesTable> {
  $$PokemonAbilitiesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<bool> get isHidden =>
      $composableBuilder(column: $table.isHidden, builder: (column) => column);

  GeneratedColumn<int> get slot =>
      $composableBuilder(column: $table.slot, builder: (column) => column);

  $$PokemonsTableAnnotationComposer get pokemonId {
    final $$PokemonsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.pokemonId,
        referencedTable: $db.pokemons,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PokemonsTableAnnotationComposer(
              $db: $db,
              $table: $db.pokemons,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$AbilitiesTableAnnotationComposer get abilityId {
    final $$AbilitiesTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.abilityId,
        referencedTable: $db.abilities,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$AbilitiesTableAnnotationComposer(
              $db: $db,
              $table: $db.abilities,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$PokemonAbilitiesTableTableManager extends RootTableManager<
    _$AppDatabase,
    $PokemonAbilitiesTable,
    PokemonAbility,
    $$PokemonAbilitiesTableFilterComposer,
    $$PokemonAbilitiesTableOrderingComposer,
    $$PokemonAbilitiesTableAnnotationComposer,
    $$PokemonAbilitiesTableCreateCompanionBuilder,
    $$PokemonAbilitiesTableUpdateCompanionBuilder,
    (PokemonAbility, $$PokemonAbilitiesTableReferences),
    PokemonAbility,
    PrefetchHooks Function({bool pokemonId, bool abilityId})> {
  $$PokemonAbilitiesTableTableManager(
      _$AppDatabase db, $PokemonAbilitiesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PokemonAbilitiesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PokemonAbilitiesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PokemonAbilitiesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> pokemonId = const Value.absent(),
            Value<int> abilityId = const Value.absent(),
            Value<bool> isHidden = const Value.absent(),
            Value<int> slot = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              PokemonAbilitiesCompanion(
            pokemonId: pokemonId,
            abilityId: abilityId,
            isHidden: isHidden,
            slot: slot,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required int pokemonId,
            required int abilityId,
            required bool isHidden,
            required int slot,
            Value<int> rowid = const Value.absent(),
          }) =>
              PokemonAbilitiesCompanion.insert(
            pokemonId: pokemonId,
            abilityId: abilityId,
            isHidden: isHidden,
            slot: slot,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable<$PokemonAbilitiesTable, PokemonAbility>(table),
                    $$PokemonAbilitiesTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({pokemonId = false, abilityId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (pokemonId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.pokemonId,
                    referencedTable:
                        $$PokemonAbilitiesTableReferences._pokemonIdTable(db),
                    referencedColumn: $$PokemonAbilitiesTableReferences
                        ._pokemonIdTable(db)
                        .id,
                  ) as T;
                }
                if (abilityId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.abilityId,
                    referencedTable:
                        $$PokemonAbilitiesTableReferences._abilityIdTable(db),
                    referencedColumn: $$PokemonAbilitiesTableReferences
                        ._abilityIdTable(db)
                        .id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$PokemonAbilitiesTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $PokemonAbilitiesTable,
    PokemonAbility,
    $$PokemonAbilitiesTableFilterComposer,
    $$PokemonAbilitiesTableOrderingComposer,
    $$PokemonAbilitiesTableAnnotationComposer,
    $$PokemonAbilitiesTableCreateCompanionBuilder,
    $$PokemonAbilitiesTableUpdateCompanionBuilder,
    (PokemonAbility, $$PokemonAbilitiesTableReferences),
    PokemonAbility,
    PrefetchHooks Function({bool pokemonId, bool abilityId})>;
typedef $$MovesTableCreateCompanionBuilder = MovesCompanion Function({
  Value<int> id,
  required String name,
});
typedef $$MovesTableUpdateCompanionBuilder = MovesCompanion Function({
  Value<int> id,
  Value<String> name,
});

final class $$MovesTableReferences
    extends BaseReferences<_$AppDatabase, $MovesTable, Move> {
  $$MovesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$PokemonMovesTable, List<PokemonMove>>
      _pokemonMovesRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.pokemonMoves,
              aliasName: 'move__id__pokemon_move__move_id');

  $$PokemonMovesTableProcessedTableManager get pokemonMovesRefs {
    final manager = $$PokemonMovesTableTableManager($_db, $_db.pokemonMoves)
        .filter((f) => f.moveId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_pokemonMovesRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$MovesTableFilterComposer extends Composer<_$AppDatabase, $MovesTable> {
  $$MovesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  Expression<bool> pokemonMovesRefs(
      Expression<bool> Function($$PokemonMovesTableFilterComposer f) f) {
    final $$PokemonMovesTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.pokemonMoves,
        getReferencedColumn: (t) => t.moveId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PokemonMovesTableFilterComposer(
              $db: $db,
              $table: $db.pokemonMoves,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$MovesTableOrderingComposer
    extends Composer<_$AppDatabase, $MovesTable> {
  $$MovesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));
}

class $$MovesTableAnnotationComposer
    extends Composer<_$AppDatabase, $MovesTable> {
  $$MovesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  Expression<T> pokemonMovesRefs<T extends Object>(
      Expression<T> Function($$PokemonMovesTableAnnotationComposer a) f) {
    final $$PokemonMovesTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.pokemonMoves,
        getReferencedColumn: (t) => t.moveId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PokemonMovesTableAnnotationComposer(
              $db: $db,
              $table: $db.pokemonMoves,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$MovesTableTableManager extends RootTableManager<
    _$AppDatabase,
    $MovesTable,
    Move,
    $$MovesTableFilterComposer,
    $$MovesTableOrderingComposer,
    $$MovesTableAnnotationComposer,
    $$MovesTableCreateCompanionBuilder,
    $$MovesTableUpdateCompanionBuilder,
    (Move, $$MovesTableReferences),
    Move,
    PrefetchHooks Function({bool pokemonMovesRefs})> {
  $$MovesTableTableManager(_$AppDatabase db, $MovesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$MovesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$MovesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$MovesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> name = const Value.absent(),
          }) =>
              MovesCompanion(
            id: id,
            name: name,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String name,
          }) =>
              MovesCompanion.insert(
            id: id,
            name: name,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable<$MovesTable, Move>(table),
                    $$MovesTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({pokemonMovesRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (pokemonMovesRefs) db.pokemonMoves],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (pokemonMovesRefs)
                    await $_getPrefetchedDataByColumns<Move, $MovesTable,
                            PokemonMove, $PokemonMovesTable>(
                        currentTable: table,
                        referencedTable:
                            $$MovesTableReferences._pokemonMovesRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$MovesTableReferences(db, table, p0)
                                .pokemonMovesRefs,
                        currentColumn: 'id',
                        referencedColumn: 'move_id',
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$MovesTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $MovesTable,
    Move,
    $$MovesTableFilterComposer,
    $$MovesTableOrderingComposer,
    $$MovesTableAnnotationComposer,
    $$MovesTableCreateCompanionBuilder,
    $$MovesTableUpdateCompanionBuilder,
    (Move, $$MovesTableReferences),
    Move,
    PrefetchHooks Function({bool pokemonMovesRefs})>;
typedef $$PokemonMovesTableCreateCompanionBuilder = PokemonMovesCompanion
    Function({
  required int pokemonId,
  required int moveId,
  required String versionGroup,
  required String learnMethod,
  Value<int> levelLearned,
  Value<int> rowid,
});
typedef $$PokemonMovesTableUpdateCompanionBuilder = PokemonMovesCompanion
    Function({
  Value<int> pokemonId,
  Value<int> moveId,
  Value<String> versionGroup,
  Value<String> learnMethod,
  Value<int> levelLearned,
  Value<int> rowid,
});

final class $$PokemonMovesTableReferences
    extends BaseReferences<_$AppDatabase, $PokemonMovesTable, PokemonMove> {
  $$PokemonMovesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $PokemonsTable _pokemonIdTable(_$AppDatabase db) =>
      db.pokemons.createAlias('pokemon_move__pokemon_id__pokemon__id');

  $$PokemonsTableProcessedTableManager get pokemonId {
    final $_column = $_itemColumn<int>('pokemon_id')!;

    final manager = $$PokemonsTableTableManager($_db, $_db.pokemons)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_pokemonIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $MovesTable _moveIdTable(_$AppDatabase db) =>
      db.moves.createAlias('pokemon_move__move_id__move__id');

  $$MovesTableProcessedTableManager get moveId {
    final $_column = $_itemColumn<int>('move_id')!;

    final manager = $$MovesTableTableManager($_db, $_db.moves)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_moveIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$PokemonMovesTableFilterComposer
    extends Composer<_$AppDatabase, $PokemonMovesTable> {
  $$PokemonMovesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get versionGroup => $composableBuilder(
      column: $table.versionGroup, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get learnMethod => $composableBuilder(
      column: $table.learnMethod, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get levelLearned => $composableBuilder(
      column: $table.levelLearned, builder: (column) => ColumnFilters(column));

  $$PokemonsTableFilterComposer get pokemonId {
    final $$PokemonsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.pokemonId,
        referencedTable: $db.pokemons,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PokemonsTableFilterComposer(
              $db: $db,
              $table: $db.pokemons,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$MovesTableFilterComposer get moveId {
    final $$MovesTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.moveId,
        referencedTable: $db.moves,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$MovesTableFilterComposer(
              $db: $db,
              $table: $db.moves,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$PokemonMovesTableOrderingComposer
    extends Composer<_$AppDatabase, $PokemonMovesTable> {
  $$PokemonMovesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get versionGroup => $composableBuilder(
      column: $table.versionGroup,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get learnMethod => $composableBuilder(
      column: $table.learnMethod, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get levelLearned => $composableBuilder(
      column: $table.levelLearned,
      builder: (column) => ColumnOrderings(column));

  $$PokemonsTableOrderingComposer get pokemonId {
    final $$PokemonsTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.pokemonId,
        referencedTable: $db.pokemons,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PokemonsTableOrderingComposer(
              $db: $db,
              $table: $db.pokemons,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$MovesTableOrderingComposer get moveId {
    final $$MovesTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.moveId,
        referencedTable: $db.moves,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$MovesTableOrderingComposer(
              $db: $db,
              $table: $db.moves,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$PokemonMovesTableAnnotationComposer
    extends Composer<_$AppDatabase, $PokemonMovesTable> {
  $$PokemonMovesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get versionGroup => $composableBuilder(
      column: $table.versionGroup, builder: (column) => column);

  GeneratedColumn<String> get learnMethod => $composableBuilder(
      column: $table.learnMethod, builder: (column) => column);

  GeneratedColumn<int> get levelLearned => $composableBuilder(
      column: $table.levelLearned, builder: (column) => column);

  $$PokemonsTableAnnotationComposer get pokemonId {
    final $$PokemonsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.pokemonId,
        referencedTable: $db.pokemons,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PokemonsTableAnnotationComposer(
              $db: $db,
              $table: $db.pokemons,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$MovesTableAnnotationComposer get moveId {
    final $$MovesTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.moveId,
        referencedTable: $db.moves,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$MovesTableAnnotationComposer(
              $db: $db,
              $table: $db.moves,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$PokemonMovesTableTableManager extends RootTableManager<
    _$AppDatabase,
    $PokemonMovesTable,
    PokemonMove,
    $$PokemonMovesTableFilterComposer,
    $$PokemonMovesTableOrderingComposer,
    $$PokemonMovesTableAnnotationComposer,
    $$PokemonMovesTableCreateCompanionBuilder,
    $$PokemonMovesTableUpdateCompanionBuilder,
    (PokemonMove, $$PokemonMovesTableReferences),
    PokemonMove,
    PrefetchHooks Function({bool pokemonId, bool moveId})> {
  $$PokemonMovesTableTableManager(_$AppDatabase db, $PokemonMovesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PokemonMovesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PokemonMovesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PokemonMovesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> pokemonId = const Value.absent(),
            Value<int> moveId = const Value.absent(),
            Value<String> versionGroup = const Value.absent(),
            Value<String> learnMethod = const Value.absent(),
            Value<int> levelLearned = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              PokemonMovesCompanion(
            pokemonId: pokemonId,
            moveId: moveId,
            versionGroup: versionGroup,
            learnMethod: learnMethod,
            levelLearned: levelLearned,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required int pokemonId,
            required int moveId,
            required String versionGroup,
            required String learnMethod,
            Value<int> levelLearned = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              PokemonMovesCompanion.insert(
            pokemonId: pokemonId,
            moveId: moveId,
            versionGroup: versionGroup,
            learnMethod: learnMethod,
            levelLearned: levelLearned,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable<$PokemonMovesTable, PokemonMove>(table),
                    $$PokemonMovesTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({pokemonId = false, moveId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (pokemonId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.pokemonId,
                    referencedTable:
                        $$PokemonMovesTableReferences._pokemonIdTable(db),
                    referencedColumn:
                        $$PokemonMovesTableReferences._pokemonIdTable(db).id,
                  ) as T;
                }
                if (moveId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.moveId,
                    referencedTable:
                        $$PokemonMovesTableReferences._moveIdTable(db),
                    referencedColumn:
                        $$PokemonMovesTableReferences._moveIdTable(db).id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$PokemonMovesTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $PokemonMovesTable,
    PokemonMove,
    $$PokemonMovesTableFilterComposer,
    $$PokemonMovesTableOrderingComposer,
    $$PokemonMovesTableAnnotationComposer,
    $$PokemonMovesTableCreateCompanionBuilder,
    $$PokemonMovesTableUpdateCompanionBuilder,
    (PokemonMove, $$PokemonMovesTableReferences),
    PokemonMove,
    PrefetchHooks Function({bool pokemonId, bool moveId})>;
typedef $$EvolutionsTableCreateCompanionBuilder = EvolutionsCompanion Function({
  required int fromSpeciesId,
  required int toSpeciesId,
  required String trigger,
  Value<String?> triggerDetail,
  Value<int> rowid,
});
typedef $$EvolutionsTableUpdateCompanionBuilder = EvolutionsCompanion Function({
  Value<int> fromSpeciesId,
  Value<int> toSpeciesId,
  Value<String> trigger,
  Value<String?> triggerDetail,
  Value<int> rowid,
});

final class $$EvolutionsTableReferences
    extends BaseReferences<_$AppDatabase, $EvolutionsTable, Evolution> {
  $$EvolutionsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $PokemonSpeciesTable _fromSpeciesIdTable(_$AppDatabase db) =>
      db.pokemonSpecies
          .createAlias('evolution__from_species_id__pokemon_species__id');

  $$PokemonSpeciesTableProcessedTableManager get fromSpeciesId {
    final $_column = $_itemColumn<int>('from_species_id')!;

    final manager = $$PokemonSpeciesTableTableManager($_db, $_db.pokemonSpecies)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_fromSpeciesIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $PokemonSpeciesTable _toSpeciesIdTable(_$AppDatabase db) =>
      db.pokemonSpecies
          .createAlias('evolution__to_species_id__pokemon_species__id');

  $$PokemonSpeciesTableProcessedTableManager get toSpeciesId {
    final $_column = $_itemColumn<int>('to_species_id')!;

    final manager = $$PokemonSpeciesTableTableManager($_db, $_db.pokemonSpecies)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_toSpeciesIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$EvolutionsTableFilterComposer
    extends Composer<_$AppDatabase, $EvolutionsTable> {
  $$EvolutionsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get trigger => $composableBuilder(
      column: $table.trigger, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get triggerDetail => $composableBuilder(
      column: $table.triggerDetail, builder: (column) => ColumnFilters(column));

  $$PokemonSpeciesTableFilterComposer get fromSpeciesId {
    final $$PokemonSpeciesTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.fromSpeciesId,
        referencedTable: $db.pokemonSpecies,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PokemonSpeciesTableFilterComposer(
              $db: $db,
              $table: $db.pokemonSpecies,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$PokemonSpeciesTableFilterComposer get toSpeciesId {
    final $$PokemonSpeciesTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.toSpeciesId,
        referencedTable: $db.pokemonSpecies,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PokemonSpeciesTableFilterComposer(
              $db: $db,
              $table: $db.pokemonSpecies,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$EvolutionsTableOrderingComposer
    extends Composer<_$AppDatabase, $EvolutionsTable> {
  $$EvolutionsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get trigger => $composableBuilder(
      column: $table.trigger, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get triggerDetail => $composableBuilder(
      column: $table.triggerDetail,
      builder: (column) => ColumnOrderings(column));

  $$PokemonSpeciesTableOrderingComposer get fromSpeciesId {
    final $$PokemonSpeciesTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.fromSpeciesId,
        referencedTable: $db.pokemonSpecies,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PokemonSpeciesTableOrderingComposer(
              $db: $db,
              $table: $db.pokemonSpecies,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$PokemonSpeciesTableOrderingComposer get toSpeciesId {
    final $$PokemonSpeciesTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.toSpeciesId,
        referencedTable: $db.pokemonSpecies,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PokemonSpeciesTableOrderingComposer(
              $db: $db,
              $table: $db.pokemonSpecies,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$EvolutionsTableAnnotationComposer
    extends Composer<_$AppDatabase, $EvolutionsTable> {
  $$EvolutionsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get trigger =>
      $composableBuilder(column: $table.trigger, builder: (column) => column);

  GeneratedColumn<String> get triggerDetail => $composableBuilder(
      column: $table.triggerDetail, builder: (column) => column);

  $$PokemonSpeciesTableAnnotationComposer get fromSpeciesId {
    final $$PokemonSpeciesTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.fromSpeciesId,
        referencedTable: $db.pokemonSpecies,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PokemonSpeciesTableAnnotationComposer(
              $db: $db,
              $table: $db.pokemonSpecies,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$PokemonSpeciesTableAnnotationComposer get toSpeciesId {
    final $$PokemonSpeciesTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.toSpeciesId,
        referencedTable: $db.pokemonSpecies,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PokemonSpeciesTableAnnotationComposer(
              $db: $db,
              $table: $db.pokemonSpecies,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$EvolutionsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $EvolutionsTable,
    Evolution,
    $$EvolutionsTableFilterComposer,
    $$EvolutionsTableOrderingComposer,
    $$EvolutionsTableAnnotationComposer,
    $$EvolutionsTableCreateCompanionBuilder,
    $$EvolutionsTableUpdateCompanionBuilder,
    (Evolution, $$EvolutionsTableReferences),
    Evolution,
    PrefetchHooks Function({bool fromSpeciesId, bool toSpeciesId})> {
  $$EvolutionsTableTableManager(_$AppDatabase db, $EvolutionsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$EvolutionsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$EvolutionsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$EvolutionsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> fromSpeciesId = const Value.absent(),
            Value<int> toSpeciesId = const Value.absent(),
            Value<String> trigger = const Value.absent(),
            Value<String?> triggerDetail = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              EvolutionsCompanion(
            fromSpeciesId: fromSpeciesId,
            toSpeciesId: toSpeciesId,
            trigger: trigger,
            triggerDetail: triggerDetail,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required int fromSpeciesId,
            required int toSpeciesId,
            required String trigger,
            Value<String?> triggerDetail = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              EvolutionsCompanion.insert(
            fromSpeciesId: fromSpeciesId,
            toSpeciesId: toSpeciesId,
            trigger: trigger,
            triggerDetail: triggerDetail,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable<$EvolutionsTable, Evolution>(table),
                    $$EvolutionsTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: (
              {fromSpeciesId = false, toSpeciesId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (fromSpeciesId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.fromSpeciesId,
                    referencedTable:
                        $$EvolutionsTableReferences._fromSpeciesIdTable(db),
                    referencedColumn:
                        $$EvolutionsTableReferences._fromSpeciesIdTable(db).id,
                  ) as T;
                }
                if (toSpeciesId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.toSpeciesId,
                    referencedTable:
                        $$EvolutionsTableReferences._toSpeciesIdTable(db),
                    referencedColumn:
                        $$EvolutionsTableReferences._toSpeciesIdTable(db).id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$EvolutionsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $EvolutionsTable,
    Evolution,
    $$EvolutionsTableFilterComposer,
    $$EvolutionsTableOrderingComposer,
    $$EvolutionsTableAnnotationComposer,
    $$EvolutionsTableCreateCompanionBuilder,
    $$EvolutionsTableUpdateCompanionBuilder,
    (Evolution, $$EvolutionsTableReferences),
    Evolution,
    PrefetchHooks Function({bool fromSpeciesId, bool toSpeciesId})>;
typedef $$TypeEfficaciesTableCreateCompanionBuilder = TypeEfficaciesCompanion
    Function({
  required int attackingTypeId,
  required int defendingTypeId,
  required int damageFactor,
  Value<int> rowid,
});
typedef $$TypeEfficaciesTableUpdateCompanionBuilder = TypeEfficaciesCompanion
    Function({
  Value<int> attackingTypeId,
  Value<int> defendingTypeId,
  Value<int> damageFactor,
  Value<int> rowid,
});

final class $$TypeEfficaciesTableReferences
    extends BaseReferences<_$AppDatabase, $TypeEfficaciesTable, TypeEfficacy> {
  $$TypeEfficaciesTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $TypesTable _attackingTypeIdTable(_$AppDatabase db) =>
      db.types.createAlias('type_efficacy__attacking_type_id__type__id');

  $$TypesTableProcessedTableManager get attackingTypeId {
    final $_column = $_itemColumn<int>('attacking_type_id')!;

    final manager = $$TypesTableTableManager($_db, $_db.types)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_attackingTypeIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $TypesTable _defendingTypeIdTable(_$AppDatabase db) =>
      db.types.createAlias('type_efficacy__defending_type_id__type__id');

  $$TypesTableProcessedTableManager get defendingTypeId {
    final $_column = $_itemColumn<int>('defending_type_id')!;

    final manager = $$TypesTableTableManager($_db, $_db.types)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_defendingTypeIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$TypeEfficaciesTableFilterComposer
    extends Composer<_$AppDatabase, $TypeEfficaciesTable> {
  $$TypeEfficaciesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get damageFactor => $composableBuilder(
      column: $table.damageFactor, builder: (column) => ColumnFilters(column));

  $$TypesTableFilterComposer get attackingTypeId {
    final $$TypesTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.attackingTypeId,
        referencedTable: $db.types,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TypesTableFilterComposer(
              $db: $db,
              $table: $db.types,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$TypesTableFilterComposer get defendingTypeId {
    final $$TypesTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.defendingTypeId,
        referencedTable: $db.types,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TypesTableFilterComposer(
              $db: $db,
              $table: $db.types,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$TypeEfficaciesTableOrderingComposer
    extends Composer<_$AppDatabase, $TypeEfficaciesTable> {
  $$TypeEfficaciesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get damageFactor => $composableBuilder(
      column: $table.damageFactor,
      builder: (column) => ColumnOrderings(column));

  $$TypesTableOrderingComposer get attackingTypeId {
    final $$TypesTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.attackingTypeId,
        referencedTable: $db.types,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TypesTableOrderingComposer(
              $db: $db,
              $table: $db.types,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$TypesTableOrderingComposer get defendingTypeId {
    final $$TypesTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.defendingTypeId,
        referencedTable: $db.types,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TypesTableOrderingComposer(
              $db: $db,
              $table: $db.types,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$TypeEfficaciesTableAnnotationComposer
    extends Composer<_$AppDatabase, $TypeEfficaciesTable> {
  $$TypeEfficaciesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get damageFactor => $composableBuilder(
      column: $table.damageFactor, builder: (column) => column);

  $$TypesTableAnnotationComposer get attackingTypeId {
    final $$TypesTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.attackingTypeId,
        referencedTable: $db.types,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TypesTableAnnotationComposer(
              $db: $db,
              $table: $db.types,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$TypesTableAnnotationComposer get defendingTypeId {
    final $$TypesTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.defendingTypeId,
        referencedTable: $db.types,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TypesTableAnnotationComposer(
              $db: $db,
              $table: $db.types,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$TypeEfficaciesTableTableManager extends RootTableManager<
    _$AppDatabase,
    $TypeEfficaciesTable,
    TypeEfficacy,
    $$TypeEfficaciesTableFilterComposer,
    $$TypeEfficaciesTableOrderingComposer,
    $$TypeEfficaciesTableAnnotationComposer,
    $$TypeEfficaciesTableCreateCompanionBuilder,
    $$TypeEfficaciesTableUpdateCompanionBuilder,
    (TypeEfficacy, $$TypeEfficaciesTableReferences),
    TypeEfficacy,
    PrefetchHooks Function({bool attackingTypeId, bool defendingTypeId})> {
  $$TypeEfficaciesTableTableManager(
      _$AppDatabase db, $TypeEfficaciesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TypeEfficaciesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TypeEfficaciesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TypeEfficaciesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> attackingTypeId = const Value.absent(),
            Value<int> defendingTypeId = const Value.absent(),
            Value<int> damageFactor = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              TypeEfficaciesCompanion(
            attackingTypeId: attackingTypeId,
            defendingTypeId: defendingTypeId,
            damageFactor: damageFactor,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required int attackingTypeId,
            required int defendingTypeId,
            required int damageFactor,
            Value<int> rowid = const Value.absent(),
          }) =>
              TypeEfficaciesCompanion.insert(
            attackingTypeId: attackingTypeId,
            defendingTypeId: defendingTypeId,
            damageFactor: damageFactor,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable<$TypeEfficaciesTable, TypeEfficacy>(table),
                    $$TypeEfficaciesTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: (
              {attackingTypeId = false, defendingTypeId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (attackingTypeId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.attackingTypeId,
                    referencedTable: $$TypeEfficaciesTableReferences
                        ._attackingTypeIdTable(db),
                    referencedColumn: $$TypeEfficaciesTableReferences
                        ._attackingTypeIdTable(db)
                        .id,
                  ) as T;
                }
                if (defendingTypeId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.defendingTypeId,
                    referencedTable: $$TypeEfficaciesTableReferences
                        ._defendingTypeIdTable(db),
                    referencedColumn: $$TypeEfficaciesTableReferences
                        ._defendingTypeIdTable(db)
                        .id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$TypeEfficaciesTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $TypeEfficaciesTable,
    TypeEfficacy,
    $$TypeEfficaciesTableFilterComposer,
    $$TypeEfficaciesTableOrderingComposer,
    $$TypeEfficaciesTableAnnotationComposer,
    $$TypeEfficaciesTableCreateCompanionBuilder,
    $$TypeEfficaciesTableUpdateCompanionBuilder,
    (TypeEfficacy, $$TypeEfficaciesTableReferences),
    TypeEfficacy,
    PrefetchHooks Function({bool attackingTypeId, bool defendingTypeId})>;
typedef $$FavoritesTableCreateCompanionBuilder = FavoritesCompanion Function({
  Value<int> pokemonId,
  Value<DateTime> createdAt,
});
typedef $$FavoritesTableUpdateCompanionBuilder = FavoritesCompanion Function({
  Value<int> pokemonId,
  Value<DateTime> createdAt,
});

final class $$FavoritesTableReferences
    extends BaseReferences<_$AppDatabase, $FavoritesTable, Favorite> {
  $$FavoritesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $PokemonsTable _pokemonIdTable(_$AppDatabase db) =>
      db.pokemons.createAlias('favorite__pokemon_id__pokemon__id');

  $$PokemonsTableProcessedTableManager get pokemonId {
    final $_column = $_itemColumn<int>('pokemon_id')!;

    final manager = $$PokemonsTableTableManager($_db, $_db.pokemons)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_pokemonIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$FavoritesTableFilterComposer
    extends Composer<_$AppDatabase, $FavoritesTable> {
  $$FavoritesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  $$PokemonsTableFilterComposer get pokemonId {
    final $$PokemonsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.pokemonId,
        referencedTable: $db.pokemons,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PokemonsTableFilterComposer(
              $db: $db,
              $table: $db.pokemons,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$FavoritesTableOrderingComposer
    extends Composer<_$AppDatabase, $FavoritesTable> {
  $$FavoritesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  $$PokemonsTableOrderingComposer get pokemonId {
    final $$PokemonsTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.pokemonId,
        referencedTable: $db.pokemons,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PokemonsTableOrderingComposer(
              $db: $db,
              $table: $db.pokemons,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$FavoritesTableAnnotationComposer
    extends Composer<_$AppDatabase, $FavoritesTable> {
  $$FavoritesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  $$PokemonsTableAnnotationComposer get pokemonId {
    final $$PokemonsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.pokemonId,
        referencedTable: $db.pokemons,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PokemonsTableAnnotationComposer(
              $db: $db,
              $table: $db.pokemons,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$FavoritesTableTableManager extends RootTableManager<
    _$AppDatabase,
    $FavoritesTable,
    Favorite,
    $$FavoritesTableFilterComposer,
    $$FavoritesTableOrderingComposer,
    $$FavoritesTableAnnotationComposer,
    $$FavoritesTableCreateCompanionBuilder,
    $$FavoritesTableUpdateCompanionBuilder,
    (Favorite, $$FavoritesTableReferences),
    Favorite,
    PrefetchHooks Function({bool pokemonId})> {
  $$FavoritesTableTableManager(_$AppDatabase db, $FavoritesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$FavoritesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$FavoritesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$FavoritesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> pokemonId = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
          }) =>
              FavoritesCompanion(
            pokemonId: pokemonId,
            createdAt: createdAt,
          ),
          createCompanionCallback: ({
            Value<int> pokemonId = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
          }) =>
              FavoritesCompanion.insert(
            pokemonId: pokemonId,
            createdAt: createdAt,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable<$FavoritesTable, Favorite>(table),
                    $$FavoritesTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({pokemonId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (pokemonId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.pokemonId,
                    referencedTable:
                        $$FavoritesTableReferences._pokemonIdTable(db),
                    referencedColumn:
                        $$FavoritesTableReferences._pokemonIdTable(db).id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$FavoritesTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $FavoritesTable,
    Favorite,
    $$FavoritesTableFilterComposer,
    $$FavoritesTableOrderingComposer,
    $$FavoritesTableAnnotationComposer,
    $$FavoritesTableCreateCompanionBuilder,
    $$FavoritesTableUpdateCompanionBuilder,
    (Favorite, $$FavoritesTableReferences),
    Favorite,
    PrefetchHooks Function({bool pokemonId})>;
typedef $$TriviaResultsTableCreateCompanionBuilder = TriviaResultsCompanion
    Function({
  Value<int> id,
  required int score,
  required int correctAnswers,
  Value<DateTime> playedAt,
});
typedef $$TriviaResultsTableUpdateCompanionBuilder = TriviaResultsCompanion
    Function({
  Value<int> id,
  Value<int> score,
  Value<int> correctAnswers,
  Value<DateTime> playedAt,
});

final class $$TriviaResultsTableReferences
    extends BaseReferences<_$AppDatabase, $TriviaResultsTable, TriviaResult> {
  $$TriviaResultsTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$TriviaAnswersTable, List<TriviaAnswer>>
      _triviaAnswersRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.triviaAnswers,
              aliasName: 'trivia_result__id__trivia_answer__trivia_result_id');

  $$TriviaAnswersTableProcessedTableManager get triviaAnswersRefs {
    final manager = $$TriviaAnswersTableTableManager($_db, $_db.triviaAnswers)
        .filter((f) => f.triviaResultId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_triviaAnswersRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$TriviaResultsTableFilterComposer
    extends Composer<_$AppDatabase, $TriviaResultsTable> {
  $$TriviaResultsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get score => $composableBuilder(
      column: $table.score, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get correctAnswers => $composableBuilder(
      column: $table.correctAnswers,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get playedAt => $composableBuilder(
      column: $table.playedAt, builder: (column) => ColumnFilters(column));

  Expression<bool> triviaAnswersRefs(
      Expression<bool> Function($$TriviaAnswersTableFilterComposer f) f) {
    final $$TriviaAnswersTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.triviaAnswers,
        getReferencedColumn: (t) => t.triviaResultId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TriviaAnswersTableFilterComposer(
              $db: $db,
              $table: $db.triviaAnswers,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$TriviaResultsTableOrderingComposer
    extends Composer<_$AppDatabase, $TriviaResultsTable> {
  $$TriviaResultsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get score => $composableBuilder(
      column: $table.score, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get correctAnswers => $composableBuilder(
      column: $table.correctAnswers,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get playedAt => $composableBuilder(
      column: $table.playedAt, builder: (column) => ColumnOrderings(column));
}

class $$TriviaResultsTableAnnotationComposer
    extends Composer<_$AppDatabase, $TriviaResultsTable> {
  $$TriviaResultsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get score =>
      $composableBuilder(column: $table.score, builder: (column) => column);

  GeneratedColumn<int> get correctAnswers => $composableBuilder(
      column: $table.correctAnswers, builder: (column) => column);

  GeneratedColumn<DateTime> get playedAt =>
      $composableBuilder(column: $table.playedAt, builder: (column) => column);

  Expression<T> triviaAnswersRefs<T extends Object>(
      Expression<T> Function($$TriviaAnswersTableAnnotationComposer a) f) {
    final $$TriviaAnswersTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.triviaAnswers,
        getReferencedColumn: (t) => t.triviaResultId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TriviaAnswersTableAnnotationComposer(
              $db: $db,
              $table: $db.triviaAnswers,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$TriviaResultsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $TriviaResultsTable,
    TriviaResult,
    $$TriviaResultsTableFilterComposer,
    $$TriviaResultsTableOrderingComposer,
    $$TriviaResultsTableAnnotationComposer,
    $$TriviaResultsTableCreateCompanionBuilder,
    $$TriviaResultsTableUpdateCompanionBuilder,
    (TriviaResult, $$TriviaResultsTableReferences),
    TriviaResult,
    PrefetchHooks Function({bool triviaAnswersRefs})> {
  $$TriviaResultsTableTableManager(_$AppDatabase db, $TriviaResultsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TriviaResultsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TriviaResultsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TriviaResultsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> score = const Value.absent(),
            Value<int> correctAnswers = const Value.absent(),
            Value<DateTime> playedAt = const Value.absent(),
          }) =>
              TriviaResultsCompanion(
            id: id,
            score: score,
            correctAnswers: correctAnswers,
            playedAt: playedAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int score,
            required int correctAnswers,
            Value<DateTime> playedAt = const Value.absent(),
          }) =>
              TriviaResultsCompanion.insert(
            id: id,
            score: score,
            correctAnswers: correctAnswers,
            playedAt: playedAt,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable<$TriviaResultsTable, TriviaResult>(table),
                    $$TriviaResultsTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({triviaAnswersRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (triviaAnswersRefs) db.triviaAnswers
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (triviaAnswersRefs)
                    await $_getPrefetchedDataByColumns<
                            TriviaResult,
                            $TriviaResultsTable,
                            TriviaAnswer,
                            $TriviaAnswersTable>(
                        currentTable: table,
                        referencedTable: $$TriviaResultsTableReferences
                            ._triviaAnswersRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$TriviaResultsTableReferences(db, table, p0)
                                .triviaAnswersRefs,
                        currentColumn: 'id',
                        referencedColumn: 'trivia_result_id',
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$TriviaResultsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $TriviaResultsTable,
    TriviaResult,
    $$TriviaResultsTableFilterComposer,
    $$TriviaResultsTableOrderingComposer,
    $$TriviaResultsTableAnnotationComposer,
    $$TriviaResultsTableCreateCompanionBuilder,
    $$TriviaResultsTableUpdateCompanionBuilder,
    (TriviaResult, $$TriviaResultsTableReferences),
    TriviaResult,
    PrefetchHooks Function({bool triviaAnswersRefs})>;
typedef $$TriviaAnswersTableCreateCompanionBuilder = TriviaAnswersCompanion
    Function({
  Value<int> id,
  required int triviaResultId,
  required int pokemonId,
  required bool correct,
});
typedef $$TriviaAnswersTableUpdateCompanionBuilder = TriviaAnswersCompanion
    Function({
  Value<int> id,
  Value<int> triviaResultId,
  Value<int> pokemonId,
  Value<bool> correct,
});

final class $$TriviaAnswersTableReferences
    extends BaseReferences<_$AppDatabase, $TriviaAnswersTable, TriviaAnswer> {
  $$TriviaAnswersTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $TriviaResultsTable _triviaResultIdTable(_$AppDatabase db) =>
      db.triviaResults
          .createAlias('trivia_answer__trivia_result_id__trivia_result__id');

  $$TriviaResultsTableProcessedTableManager get triviaResultId {
    final $_column = $_itemColumn<int>('trivia_result_id')!;

    final manager = $$TriviaResultsTableTableManager($_db, $_db.triviaResults)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_triviaResultIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $PokemonsTable _pokemonIdTable(_$AppDatabase db) =>
      db.pokemons.createAlias('trivia_answer__pokemon_id__pokemon__id');

  $$PokemonsTableProcessedTableManager get pokemonId {
    final $_column = $_itemColumn<int>('pokemon_id')!;

    final manager = $$PokemonsTableTableManager($_db, $_db.pokemons)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_pokemonIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$TriviaAnswersTableFilterComposer
    extends Composer<_$AppDatabase, $TriviaAnswersTable> {
  $$TriviaAnswersTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get correct => $composableBuilder(
      column: $table.correct, builder: (column) => ColumnFilters(column));

  $$TriviaResultsTableFilterComposer get triviaResultId {
    final $$TriviaResultsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.triviaResultId,
        referencedTable: $db.triviaResults,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TriviaResultsTableFilterComposer(
              $db: $db,
              $table: $db.triviaResults,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$PokemonsTableFilterComposer get pokemonId {
    final $$PokemonsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.pokemonId,
        referencedTable: $db.pokemons,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PokemonsTableFilterComposer(
              $db: $db,
              $table: $db.pokemons,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$TriviaAnswersTableOrderingComposer
    extends Composer<_$AppDatabase, $TriviaAnswersTable> {
  $$TriviaAnswersTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get correct => $composableBuilder(
      column: $table.correct, builder: (column) => ColumnOrderings(column));

  $$TriviaResultsTableOrderingComposer get triviaResultId {
    final $$TriviaResultsTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.triviaResultId,
        referencedTable: $db.triviaResults,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TriviaResultsTableOrderingComposer(
              $db: $db,
              $table: $db.triviaResults,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$PokemonsTableOrderingComposer get pokemonId {
    final $$PokemonsTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.pokemonId,
        referencedTable: $db.pokemons,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PokemonsTableOrderingComposer(
              $db: $db,
              $table: $db.pokemons,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$TriviaAnswersTableAnnotationComposer
    extends Composer<_$AppDatabase, $TriviaAnswersTable> {
  $$TriviaAnswersTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<bool> get correct =>
      $composableBuilder(column: $table.correct, builder: (column) => column);

  $$TriviaResultsTableAnnotationComposer get triviaResultId {
    final $$TriviaResultsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.triviaResultId,
        referencedTable: $db.triviaResults,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TriviaResultsTableAnnotationComposer(
              $db: $db,
              $table: $db.triviaResults,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$PokemonsTableAnnotationComposer get pokemonId {
    final $$PokemonsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.pokemonId,
        referencedTable: $db.pokemons,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PokemonsTableAnnotationComposer(
              $db: $db,
              $table: $db.pokemons,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$TriviaAnswersTableTableManager extends RootTableManager<
    _$AppDatabase,
    $TriviaAnswersTable,
    TriviaAnswer,
    $$TriviaAnswersTableFilterComposer,
    $$TriviaAnswersTableOrderingComposer,
    $$TriviaAnswersTableAnnotationComposer,
    $$TriviaAnswersTableCreateCompanionBuilder,
    $$TriviaAnswersTableUpdateCompanionBuilder,
    (TriviaAnswer, $$TriviaAnswersTableReferences),
    TriviaAnswer,
    PrefetchHooks Function({bool triviaResultId, bool pokemonId})> {
  $$TriviaAnswersTableTableManager(_$AppDatabase db, $TriviaAnswersTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TriviaAnswersTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TriviaAnswersTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TriviaAnswersTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> triviaResultId = const Value.absent(),
            Value<int> pokemonId = const Value.absent(),
            Value<bool> correct = const Value.absent(),
          }) =>
              TriviaAnswersCompanion(
            id: id,
            triviaResultId: triviaResultId,
            pokemonId: pokemonId,
            correct: correct,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int triviaResultId,
            required int pokemonId,
            required bool correct,
          }) =>
              TriviaAnswersCompanion.insert(
            id: id,
            triviaResultId: triviaResultId,
            pokemonId: pokemonId,
            correct: correct,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable<$TriviaAnswersTable, TriviaAnswer>(table),
                    $$TriviaAnswersTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({triviaResultId = false, pokemonId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (triviaResultId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.triviaResultId,
                    referencedTable:
                        $$TriviaAnswersTableReferences._triviaResultIdTable(db),
                    referencedColumn: $$TriviaAnswersTableReferences
                        ._triviaResultIdTable(db)
                        .id,
                  ) as T;
                }
                if (pokemonId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.pokemonId,
                    referencedTable:
                        $$TriviaAnswersTableReferences._pokemonIdTable(db),
                    referencedColumn:
                        $$TriviaAnswersTableReferences._pokemonIdTable(db).id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$TriviaAnswersTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $TriviaAnswersTable,
    TriviaAnswer,
    $$TriviaAnswersTableFilterComposer,
    $$TriviaAnswersTableOrderingComposer,
    $$TriviaAnswersTableAnnotationComposer,
    $$TriviaAnswersTableCreateCompanionBuilder,
    $$TriviaAnswersTableUpdateCompanionBuilder,
    (TriviaAnswer, $$TriviaAnswersTableReferences),
    TriviaAnswer,
    PrefetchHooks Function({bool triviaResultId, bool pokemonId})>;
typedef $$AppSettingsTableCreateCompanionBuilder = AppSettingsCompanion
    Function({
  required String key,
  required String value,
  Value<int> rowid,
});
typedef $$AppSettingsTableUpdateCompanionBuilder = AppSettingsCompanion
    Function({
  Value<String> key,
  Value<String> value,
  Value<int> rowid,
});

class $$AppSettingsTableFilterComposer
    extends Composer<_$AppDatabase, $AppSettingsTable> {
  $$AppSettingsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get key => $composableBuilder(
      column: $table.key, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get value => $composableBuilder(
      column: $table.value, builder: (column) => ColumnFilters(column));
}

class $$AppSettingsTableOrderingComposer
    extends Composer<_$AppDatabase, $AppSettingsTable> {
  $$AppSettingsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get key => $composableBuilder(
      column: $table.key, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get value => $composableBuilder(
      column: $table.value, builder: (column) => ColumnOrderings(column));
}

class $$AppSettingsTableAnnotationComposer
    extends Composer<_$AppDatabase, $AppSettingsTable> {
  $$AppSettingsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get key =>
      $composableBuilder(column: $table.key, builder: (column) => column);

  GeneratedColumn<String> get value =>
      $composableBuilder(column: $table.value, builder: (column) => column);
}

class $$AppSettingsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $AppSettingsTable,
    AppSetting,
    $$AppSettingsTableFilterComposer,
    $$AppSettingsTableOrderingComposer,
    $$AppSettingsTableAnnotationComposer,
    $$AppSettingsTableCreateCompanionBuilder,
    $$AppSettingsTableUpdateCompanionBuilder,
    (AppSetting, BaseReferences<_$AppDatabase, $AppSettingsTable, AppSetting>),
    AppSetting,
    PrefetchHooks Function()> {
  $$AppSettingsTableTableManager(_$AppDatabase db, $AppSettingsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AppSettingsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AppSettingsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AppSettingsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> key = const Value.absent(),
            Value<String> value = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              AppSettingsCompanion(
            key: key,
            value: value,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String key,
            required String value,
            Value<int> rowid = const Value.absent(),
          }) =>
              AppSettingsCompanion.insert(
            key: key,
            value: value,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable<$AppSettingsTable, AppSetting>(table),
                    BaseReferences<_$AppDatabase, $AppSettingsTable,
                        AppSetting>(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$AppSettingsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $AppSettingsTable,
    AppSetting,
    $$AppSettingsTableFilterComposer,
    $$AppSettingsTableOrderingComposer,
    $$AppSettingsTableAnnotationComposer,
    $$AppSettingsTableCreateCompanionBuilder,
    $$AppSettingsTableUpdateCompanionBuilder,
    (AppSetting, BaseReferences<_$AppDatabase, $AppSettingsTable, AppSetting>),
    AppSetting,
    PrefetchHooks Function()>;
typedef $$SyncMetadataTableCreateCompanionBuilder = SyncMetadataCompanion
    Function({
  required String resourceKey,
  Value<String> status,
  Value<DateTime?> lastSuccessAt,
  Value<int> rowid,
});
typedef $$SyncMetadataTableUpdateCompanionBuilder = SyncMetadataCompanion
    Function({
  Value<String> resourceKey,
  Value<String> status,
  Value<DateTime?> lastSuccessAt,
  Value<int> rowid,
});

class $$SyncMetadataTableFilterComposer
    extends Composer<_$AppDatabase, $SyncMetadataTable> {
  $$SyncMetadataTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get resourceKey => $composableBuilder(
      column: $table.resourceKey, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get lastSuccessAt => $composableBuilder(
      column: $table.lastSuccessAt, builder: (column) => ColumnFilters(column));
}

class $$SyncMetadataTableOrderingComposer
    extends Composer<_$AppDatabase, $SyncMetadataTable> {
  $$SyncMetadataTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get resourceKey => $composableBuilder(
      column: $table.resourceKey, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get lastSuccessAt => $composableBuilder(
      column: $table.lastSuccessAt,
      builder: (column) => ColumnOrderings(column));
}

class $$SyncMetadataTableAnnotationComposer
    extends Composer<_$AppDatabase, $SyncMetadataTable> {
  $$SyncMetadataTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get resourceKey => $composableBuilder(
      column: $table.resourceKey, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<DateTime> get lastSuccessAt => $composableBuilder(
      column: $table.lastSuccessAt, builder: (column) => column);
}

class $$SyncMetadataTableTableManager extends RootTableManager<
    _$AppDatabase,
    $SyncMetadataTable,
    SyncMetadataData,
    $$SyncMetadataTableFilterComposer,
    $$SyncMetadataTableOrderingComposer,
    $$SyncMetadataTableAnnotationComposer,
    $$SyncMetadataTableCreateCompanionBuilder,
    $$SyncMetadataTableUpdateCompanionBuilder,
    (
      SyncMetadataData,
      BaseReferences<_$AppDatabase, $SyncMetadataTable, SyncMetadataData>
    ),
    SyncMetadataData,
    PrefetchHooks Function()> {
  $$SyncMetadataTableTableManager(_$AppDatabase db, $SyncMetadataTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SyncMetadataTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SyncMetadataTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SyncMetadataTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> resourceKey = const Value.absent(),
            Value<String> status = const Value.absent(),
            Value<DateTime?> lastSuccessAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              SyncMetadataCompanion(
            resourceKey: resourceKey,
            status: status,
            lastSuccessAt: lastSuccessAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String resourceKey,
            Value<String> status = const Value.absent(),
            Value<DateTime?> lastSuccessAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              SyncMetadataCompanion.insert(
            resourceKey: resourceKey,
            status: status,
            lastSuccessAt: lastSuccessAt,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable<$SyncMetadataTable, SyncMetadataData>(table),
                    BaseReferences<_$AppDatabase, $SyncMetadataTable,
                        SyncMetadataData>(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$SyncMetadataTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $SyncMetadataTable,
    SyncMetadataData,
    $$SyncMetadataTableFilterComposer,
    $$SyncMetadataTableOrderingComposer,
    $$SyncMetadataTableAnnotationComposer,
    $$SyncMetadataTableCreateCompanionBuilder,
    $$SyncMetadataTableUpdateCompanionBuilder,
    (
      SyncMetadataData,
      BaseReferences<_$AppDatabase, $SyncMetadataTable, SyncMetadataData>
    ),
    SyncMetadataData,
    PrefetchHooks Function()>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$PokemonSpeciesTableTableManager get pokemonSpecies =>
      $$PokemonSpeciesTableTableManager(_db, _db.pokemonSpecies);
  $$PokemonsTableTableManager get pokemons =>
      $$PokemonsTableTableManager(_db, _db.pokemons);
  $$TypesTableTableManager get types =>
      $$TypesTableTableManager(_db, _db.types);
  $$PokemonTypesTableTableManager get pokemonTypes =>
      $$PokemonTypesTableTableManager(_db, _db.pokemonTypes);
  $$PokemonStatsTableTableManager get pokemonStats =>
      $$PokemonStatsTableTableManager(_db, _db.pokemonStats);
  $$AbilitiesTableTableManager get abilities =>
      $$AbilitiesTableTableManager(_db, _db.abilities);
  $$PokemonAbilitiesTableTableManager get pokemonAbilities =>
      $$PokemonAbilitiesTableTableManager(_db, _db.pokemonAbilities);
  $$MovesTableTableManager get moves =>
      $$MovesTableTableManager(_db, _db.moves);
  $$PokemonMovesTableTableManager get pokemonMoves =>
      $$PokemonMovesTableTableManager(_db, _db.pokemonMoves);
  $$EvolutionsTableTableManager get evolutions =>
      $$EvolutionsTableTableManager(_db, _db.evolutions);
  $$TypeEfficaciesTableTableManager get typeEfficacies =>
      $$TypeEfficaciesTableTableManager(_db, _db.typeEfficacies);
  $$FavoritesTableTableManager get favorites =>
      $$FavoritesTableTableManager(_db, _db.favorites);
  $$TriviaResultsTableTableManager get triviaResults =>
      $$TriviaResultsTableTableManager(_db, _db.triviaResults);
  $$TriviaAnswersTableTableManager get triviaAnswers =>
      $$TriviaAnswersTableTableManager(_db, _db.triviaAnswers);
  $$AppSettingsTableTableManager get appSettings =>
      $$AppSettingsTableTableManager(_db, _db.appSettings);
  $$SyncMetadataTableTableManager get syncMetadata =>
      $$SyncMetadataTableTableManager(_db, _db.syncMetadata);
}
