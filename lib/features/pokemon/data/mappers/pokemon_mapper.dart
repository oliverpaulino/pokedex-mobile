import 'package:drift/drift.dart';

import '../../../../core/database/app_database.dart' hide Pokemon, PokemonType;
import '../../domain/entities.dart';
import '../dto/pokemon_catalog_dto.dart';

class PokemonMapper {
  const PokemonMapper();

  Pokemon toEntity(PokemonDto dto) {
    final stats = dto.stats;
    return Pokemon(
      id: dto.id,
      number: dto.id,
      name: dto.name,
      imageUrl: dto.preferredImageUrl,
      types: dto.types
          .map(
            (type) => PokemonType(
              id: type.id,
              name: type.name,
            ),
          )
          .toList(growable: false),
      baseStats: stats == null
          ? null
          : PokemonBaseStats(
              hp: stats.hp,
              attack: stats.attack,
              defense: stats.defense,
              specialAttack: stats.specialAttack,
              specialDefense: stats.specialDefense,
              speed: stats.speed,
            ),
      speciesId: dto.speciesId,
      speciesName: dto.speciesName,
      generationId: dto.generationId,
    );
  }

  List<Pokemon> toEntities(PokemonCatalogDto dto) {
    return dto.pokemons.map(toEntity).toList(growable: false);
  }

  PokemonsCompanion toPokemonTable(
    PokemonDto dto, {
    DateTime? updatedAt,
  }) {
    return PokemonsCompanion.insert(
      id: Value(dto.id),
      nationalDexNumber: dto.id,
      name: dto.name,
      imageUrl: Value(dto.preferredImageUrl),
      updatedAt: Value(updatedAt ?? DateTime.now()),
    );
  }

  List<TypesCompanion> toTypeTables(PokemonDto dto) {
    return dto.types
        .map(
          (type) => TypesCompanion.insert(
            id: Value(type.id),
            name: type.name,
          ),
        )
        .toList(growable: false);
  }

  List<PokemonTypesCompanion> toPokemonTypeTables(PokemonDto dto) {
    return dto.types
        .map(
          (type) => PokemonTypesCompanion.insert(
            pokemonId: dto.id,
            typeId: type.id,
            slot: type.slot,
          ),
        )
        .toList(growable: false);
  }
}
