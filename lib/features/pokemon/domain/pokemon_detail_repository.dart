import 'pokemon_detail.dart';

/// La UI solo lee [watchDetail]; [refreshDetail] es la operacion de
/// actualizacion por id que descarga una sola forma, sin recorrer paginas.
abstract interface class PokemonDetailRepository {
  Stream<PokemonDetail?> watchDetail(int id);

  Future<PokemonDetail?> getDetail(int id);

  /// Consulta GraphQL, valida, guarda con upsert transaccional y devuelve la
  /// entidad ya persistida. Fallos de red/timeout/GraphQL/rate limit se lanzan
  /// como fallos del dominio.
  Future<PokemonDetail> refreshDetail(int id);
}
