import 'entities.dart';

abstract class PokemonRepository {
  Stream<List<Pokemon>> watchPokemon({
    String search = '',
  });

  Future<Pokemon?> getPokemon(int id);

  Future<void> savePokemon(List<Pokemon> pokemon);
}
