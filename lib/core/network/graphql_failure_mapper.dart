import 'dart:async';

import 'package:ferry/ferry.dart';

import '../../features/pokemon/domain/failures.dart';

/// Traduce errores de Ferry a fallos del dominio.
/// Lo usan el catalogo y el detalle para que la UI reciba siempre los mismos
/// tipos de fallo (red, timeout, GraphQL, parcial, rate limit).
class GraphqlFailureMapper {
  const GraphqlFailureMapper();

  /// Devuelve null cuando no hay errores GraphQL.
  AppFailure? mapErrors({
    required Iterable<String> messages,
    required Iterable<Map<String, dynamic>?> extensions,
    required bool hasData,
  }) {
    final mensajes = messages.toList(growable: false);
    final codes = extensions
        .map((extension) => extension?['code']?.toString().toLowerCase())
        .toList(growable: false);

    final isRateLimit = codes.any(
      (code) =>
          code == 'rate_limit' ||
          code == 'rate-limit' ||
          code == 'too_many_requests',
    ) || mensajes.any(_isRateLimitMessage);

    if (isRateLimit) {
      return const RateLimitFailure();
    }

    if (mensajes.isEmpty) {
      return null;
    }

    final detalle = mensajes.join(' | ');

    if (hasData) {
      return PartialResponseFailure('Respuesta parcial: $detalle');
    }

    return GraphqlFailure(detalle);
  }

  AppFailure mapLinkException(LinkException exception) {
    if (exception is ServerException) {
      if (exception.originalException is TimeoutException) {
        return const TimeoutFailure();
      }
      if (exception.statusCode == 429) {
        return const RateLimitFailure();
      }
      if (exception.statusCode == null) {
        return const NetworkFailure();
      }

      return GraphqlFailure(
        'Error del servidor GraphQL (${exception.statusCode})',
      );
    }

    if (exception is ResponseFormatException) {
      return const GraphqlFailure('Respuesta GraphQL invalida');
    }

    if (exception is RequestFormatException) {
      return const GraphqlFailure('Solicitud GraphQL invalida');
    }

    return const UnknownFailure();
  }

  bool _isRateLimitMessage(String message) {
    final normalized = message.toLowerCase();
    return normalized.contains('rate limit') ||
        normalized.contains('too many requests');
  }
}
