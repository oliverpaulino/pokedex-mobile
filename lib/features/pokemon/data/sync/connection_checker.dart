import 'dart:async';

import '../../domain/failures.dart';
import '../remote/pokemon_remote_data_source.dart';

enum ConnectionStatus { checking, online, offline, serviceUnavailable }

class ConnectionChecker {
  final PokemonCatalogRemoteDataSource remoteDataSource;
  final Duration timeout;

  const ConnectionChecker({
    required this.remoteDataSource,
    this.timeout = const Duration(seconds: 5),
  });

  Future<ConnectionStatus> check() async {
    try {
      await remoteDataSource.fetchCatalog(limit: 1, offset: 0).timeout(timeout);
      return ConnectionStatus.online;
    } on NetworkFailure {
      return ConnectionStatus.offline;
    } on TimeoutFailure {
      return ConnectionStatus.serviceUnavailable;
    } on GraphqlFailure {
      return ConnectionStatus.serviceUnavailable;
    } on RateLimitFailure {
      return ConnectionStatus.serviceUnavailable;
    } on AppFailure {
      return ConnectionStatus.serviceUnavailable;
    } catch (_) {
      return ConnectionStatus.serviceUnavailable;
    }
  }
}
