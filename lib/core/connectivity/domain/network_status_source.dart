abstract interface class NetworkStatusSource {
  Future<bool> hasNetwork();
  Stream<bool> get onNetworkChanged;
}
