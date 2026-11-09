/// Comprueba la disponibilidad efectiva de la API remota
abstract interface class ApiHealthChecker {
  Future<bool> isAvailable();
}
