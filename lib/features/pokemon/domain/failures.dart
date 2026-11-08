sealed class AppFailure implements Exception {
  final String message;

  const AppFailure(this.message);
}

class NetworkFailure extends AppFailure {
  const NetworkFailure() : super('Sin conexion a internet');
}

class TimeoutFailure extends AppFailure {
  const TimeoutFailure() : super('La solicitud tardo demasiado');
}

class GraphqlFailure extends AppFailure {
  const GraphqlFailure(super.message);
}

class PartialResponseFailure extends GraphqlFailure {
  const PartialResponseFailure(super.message);
}

class RateLimitFailure extends AppFailure {
  const RateLimitFailure() : super('Demasiadas solicitudes');
}

class UnknownFailure extends AppFailure {
  const UnknownFailure() : super('Error desconocido');
}

class ValidationFailure extends AppFailure {
  const ValidationFailure(super.message);
}

class DatabaseFailure extends AppFailure {
  const DatabaseFailure() : super('Error al guardar los datos');
}
