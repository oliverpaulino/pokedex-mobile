import '../../../../core/connectivity/connectivity_config.dart';
import '../../../../core/connectivity/domain/api_health_checker.dart';
import '../../domain/failures.dart';
import 'pokemon_remote_data_source.dart';

/// Comprueba la disponibilidad real de GraphQL
class GraphqlApiHealthChecker implements ApiHealthChecker {
  final PokemonCatalogRemoteDataSource remoteDataSource;
  final Duration timeout;

  const GraphqlApiHealthChecker({
    required this.remoteDataSource,
    this.timeout = connectivityHealthCheckTimeout,
  });

  @override
  Future<bool> isAvailable() async {
    try {
      await remoteDataSource.fetchCatalog(limit: 1, offset: 0).timeout(timeout);
      return true;
    } on AppFailure {
      return false;
    } catch (_) {
      return false;
    }
  }
}
