abstract class FavoriteRepository {
  Stream<List<int>> watchFavorites();

  Future<void> addFavorite(int pokemonId);

  Future<void> removeFavorite(int pokemonId);
}
