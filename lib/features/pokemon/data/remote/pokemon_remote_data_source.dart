import 'dart:async';

import 'package:ferry/ferry.dart';

import '../../../../core/network/network_config.dart';
import '../../domain/failures.dart';
import '../dto/pokemon_catalog_dto.dart';
import '../graphql/__generated__/pokemon_catalog.data.gql.dart';
import '../graphql/__generated__/pokemon_catalog.req.gql.dart';
import '../graphql/__generated__/pokemon_catalog.var.gql.dart';

class PokemonRemoteDataSource {
  final Client client;
  final Duration timeout;

  const PokemonRemoteDataSource({
    required this.client,
    this.timeout = graphqlRequestTimeout,
  });

  Future<PokemonCatalogDto> fetchCatalog({
    required int limit,
    required int offset,
  }) async {
    if (limit <= 0) {
      throw const ValidationFailure('El limite debe ser mayor que cero');
    }
    if (offset < 0) {
      throw const ValidationFailure('El offset no puede ser negativo');
    }

    final request = GPokemonCatalogReq(
      (builder) => builder
        ..vars.limit = limit
        ..vars.offset = offset
        // El data source remoto debe consultar la API, no el cache de Ferry.
        ..fetchPolicy = FetchPolicy.NetworkOnly,
    );

    try {
      final response = await client
          .request(request)
          .firstWhere(
            (response) =>
                response.data != null ||
                response.hasErrors ||
                response.linkException != null,
          )
          .timeout(timeout);

      return _mapResponse(response);
    } on TimeoutException {
      throw const TimeoutFailure();
    } on AppFailure {
      rethrow;
    } catch (_) {
      throw const UnknownFailure();
    }
  }

  PokemonCatalogDto _mapResponse(
    OperationResponse<GPokemonCatalogData, GPokemonCatalogVars> response,
  ) {
    final linkException = response.linkException;
    if (linkException != null) {
      throw _mapLinkException(linkException);
    }

    final graphqlErrors = response.graphqlErrors;
    if (graphqlErrors != null && graphqlErrors.isNotEmpty) {
      if (graphqlErrors.any(
        (error) => _isRateLimit(error.message, error.extensions),
      )) {
        throw const RateLimitFailure();
      }

      final message = graphqlErrors.map((error) => error.message).join(' | ');

      // RNF-RES-05: una respuesta parcial se reporta de forma diferenciada.
      if (response.data != null) {
        throw PartialResponseFailure('Respuesta parcial: $message');
      }

      throw GraphqlFailure(message);
    }

    final data = response.data;
    if (data == null) {
      throw const UnknownFailure();
    }

    return PokemonCatalogDto.fromGraphql(data);
  }

  AppFailure _mapLinkException(LinkException exception) {
    if (exception is ServerException) {
      if (exception.originalException is TimeoutException) {
        return const TimeoutFailure();
      }
      if (exception.statusCode == 429) {
        return const RateLimitFailure();
      }
      if (exception.statusCode == null) {
        // gql_http_link envuelve fallos de red sin status en ServerException.
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

  bool _isRateLimit(String message, Map<String, dynamic>? extensions) {
    final code = extensions?['code']?.toString().toLowerCase();
    final normalizedMessage = message.toLowerCase();

    return code == 'rate_limit' ||
        code == 'rate-limit' ||
        code == 'too_many_requests' ||
        normalizedMessage.contains('rate limit') ||
        normalizedMessage.contains('too many requests');
  }
}
