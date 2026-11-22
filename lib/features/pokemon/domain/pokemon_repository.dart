import 'package:pokedex/features/pokemon/domain/pokemon_orden.dart';

import 'entities.dart';

abstract class PokemonRepository {
  Stream<List<Pokemon>> watchPokemon({
    String search = '',
    int? tipoId,
    OrdenPokemon orden = OrdenPokemon.numero,
  });

  Future<Pokemon?> getPokemon(int id);

  Future<void> savePokemon(List<Pokemon> pokemon);
}
