import 'dart:async';

import 'package:ferry/ferry.dart';

import '../../../../core/network/graphql_failure_mapper.dart';
import '../../../../core/network/network_config.dart';
import '../../domain/failures.dart';
import '../dto/pokemon_detail_dto.dart';
import '../graphql/__generated__/pokemon_detail.data.gql.dart';
import '../graphql/__generated__/pokemon_detail.req.gql.dart';
import '../graphql/__generated__/pokemon_detail.var.gql.dart';

/// Contrato remoto del detalle. Permite sustituir Ferry en las pruebas.
abstract interface class PokemonDetailRemoteDataSource {
  Future<PokemonDetailDto> fetchDetail({
    required int id,
    List<String>? versionGroups,
  });
}

/// Version groups consultados por defecto: los recientes cubren el detalle
/// sin descargar el historial completo de movimientos de cada forma.
const List<String> defaultDetailVersionGroups = [
  'scarlet-violet',
  'sword-shield',
  'legends-arceus',
  'lets-go-pikachu-lets-go-eevee',
];

class PokemonDetailGraphqlRemoteDataSource
    implements PokemonDetailRemoteDataSource {
  final Client client;
  final Duration timeout;

  const PokemonDetailGraphqlRemoteDataSource({
    required this.client,
    this.timeout = graphqlRequestTimeout,
  });

  @override
  Future<PokemonDetailDto> fetchDetail({
    required int id,
    List<String>? versionGroups,
  }) async {
    if (id <= 0) {
      throw const ValidationFailure('El id del Pokemon debe ser mayor que cero');
    }

    final request = GPokemonDetailReq(
      (builder) => builder
        ..vars.id = id
        ..vars.versionGroups.addAll(
          versionGroups ?? defaultDetailVersionGroups,
        )
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

      return _mapResponse(response, id);
    } on TimeoutException {
      throw const TimeoutFailure();
    } on AppFailure {
      rethrow;
    } catch (_) {
      throw const UnknownFailure();
    }
  }

  PokemonDetailDto _mapResponse(
    OperationResponse<GPokemonDetailData, GPokemonDetailVars> response,
    int requestedId,
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

    final dto = PokemonDetailDto.fromGraphql(data);
    dto.validate();

    if (dto.id != requestedId) {
      throw const ValidationFailure(
        'La respuesta no corresponde al Pokemon solicitado',
      );
    }

    return dto;
  }
}
