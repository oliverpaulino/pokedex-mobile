import 'dart:async';

import 'package:ferry/ferry.dart';

import '../../../../core/network/graphql_failure_mapper.dart';
import '../../../../core/network/network_config.dart';
import '../../domain/failures.dart';
import '../dto/pokemon_catalog_dto.dart';
import '../graphql/__generated__/pokemon_catalog.data.gql.dart';
import '../graphql/__generated__/pokemon_catalog.req.gql.dart';
import '../graphql/__generated__/pokemon_catalog.var.gql.dart';

/// Contrato de la fuente remota del catalogo.
/// Permite sustituir Ferry por un fake en las pruebas del coordinador de
/// sincronizacion.
abstract interface class PokemonCatalogRemoteDataSource {
  Future<PokemonCatalogDto> fetchCatalog({
    required int limit,
    required int offset,
  });
}

/// Fuente de datos remota para el catalogo de Pokemon.
/// Toda llamada usa un timeout explicito ([graphqlRequestTimeout]) y traduce
/// los errores de infraestructura a fallos del dominio.
class PokemonRemoteDataSource implements PokemonCatalogRemoteDataSource {
  final Client client;
  final Duration timeout;

  const PokemonRemoteDataSource({
    required this.client,
    this.timeout = graphqlRequestTimeout,
  });

  @override
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
      throw const GraphqlFailureMapper().mapLinkException(linkException);
    }

    final graphqlErrors = response.graphqlErrors ?? const [];
    final failure = const GraphqlFailureMapper().mapErrors(
      messages: graphqlErrors.map((error) => error.message),
      extensions: graphqlErrors.map((error) => error.extensions),
      hasData: response.data != null,
    );
    if (failure != null) {
      throw failure;
    }

    final data = response.data;
    if (data == null) {
      throw const UnknownFailure();
    }

    return PokemonCatalogDto.fromGraphql(data);
  }
}
