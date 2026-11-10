import 'package:connectivity_plus/connectivity_plus.dart';

import '../domain/network_status_source.dart';

/// Implementacion de [NetworkStatusSource] sobre `connectivity_plus`.
class ConnectivityPlusNetworkStatusSource implements NetworkStatusSource {
  final Connectivity connectivity;

  ConnectivityPlusNetworkStatusSource({Connectivity? connectivity})
      : connectivity = connectivity ?? Connectivity();

  @override
  Future<bool> hasNetwork() async {
    final results = await connectivity.checkConnectivity();
    return _hasNetwork(results);
  }

  @override
  Stream<bool> get onNetworkChanged {
    return connectivity.onConnectivityChanged.map(_hasNetwork).distinct();
  }

  static bool _hasNetwork(List<ConnectivityResult> results) {
    return results.any((result) => result != ConnectivityResult.none);
  }
}
