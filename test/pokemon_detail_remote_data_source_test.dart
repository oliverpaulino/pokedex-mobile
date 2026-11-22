import 'dart:async';

import 'package:ferry/ferry.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gql_exec/gql_exec.dart';
import 'package:pokedex/features/pokemon/data/remote/pokemon_detail_remote_data_source.dart';
import 'package:pokedex/features/pokemon/domain/failures.dart';

import 'fixtures/pokemon_detail_fixture.dart';

const _emptyResponse = <String, dynamic>{};

Client _clientReturning(Stream<Response> Function() handler) {
  return Client(
    link: Link.function((request, [forward]) => handler()),
  );
}

PokemonDetailGraphqlRemoteDataSource _dataSource(
  Stream<Response> Function() handler,
) {
  return PokemonDetailGraphqlRemoteDataSource(client: _clientReturning(handler));
}

void main() {
  group('PokemonDetailGraphqlRemoteDataSource', () {
    test('valida el id antes de llamar a la red', () async {
      final dataSource = _dataSource(
        () => throw StateError('la red no deberia consultarse'),
      );

      await expectLater(
        dataSource.fetchDetail(id: 0),
        throwsA(isA<ValidationFailure>()),
      );
    });

    test('convierte una respuesta valida en DTO validado', () async {
      final detail = buildPokemonDetailData();
      final dataSource = _dataSource(
        () => Stream.value(
          Response(data: detail.toJson(), response: _emptyResponse),
        ),
      );

      final dto = await dataSource.fetchDetail(id: 6);

      expect(dto.id, 6);
      expect(dto.name, 'charizard');
      expect(dto.stats!.hp, 78);
    });

    test('traduce el timeout a TimeoutFailure', () async {
      final never = Completer<Response>();
      final dataSource = PokemonDetailGraphqlRemoteDataSource(
        client: _clientReturning(
          () => Stream<Response>.fromFuture(never.future),
        ),
        timeout: const Duration(milliseconds: 20),
      );

      await expectLater(
        dataSource.fetchDetail(id: 6),
        throwsA(isA<TimeoutFailure>()),
      );
    });

    test('traduce HTTP 429 a RateLimitFailure', () async {
      final dataSource = _dataSource(
        () => Stream.error(const ServerException(statusCode: 429)),
      );

      await expectLater(
        dataSource.fetchDetail(id: 6),
        throwsA(isA<RateLimitFailure>()),
      );
    });

    test('traduce un fallo de red sin status a NetworkFailure', () async {
      final dataSource = _dataSource(
        () => Stream.error(
          ServerException(originalException: Exception('sin conexion')),
        ),
      );

      await expectLater(
        dataSource.fetchDetail(id: 6),
        throwsA(isA<NetworkFailure>()),
      );
    });

    test('traduce un error GraphQL sin datos a GraphqlFailure', () async {
      final dataSource = _dataSource(
        () => Stream.value(
          const Response(
            response: _emptyResponse,
            errors: [GraphQLError(message: 'campo invalido')],
          ),
        ),
      );

      await expectLater(
        dataSource.fetchDetail(id: 6),
        throwsA(isA<GraphqlFailure>()),
      );
    });

    test('distingue una respuesta parcial', () async {
      final detail = buildPokemonDetailData();
      final dataSource = _dataSource(
        () => Stream.value(
          Response(
            data: detail.toJson(),
            errors: [const GraphQLError(message: 'campo parcial')],
            response: _emptyResponse,
          ),
        ),
      );

      await expectLater(
        dataSource.fetchDetail(id: 6),
        throwsA(isA<PartialResponseFailure>()),
      );
    });

    test('detecta rate limiting reportado como error GraphQL', () async {
      final dataSource = _dataSource(
        () => Stream.value(
          const Response(
            response: _emptyResponse,
            errors: [GraphQLError(message: 'Too many requests')],
          ),
        ),
      );

      await expectLater(
        dataSource.fetchDetail(id: 6),
        throwsA(isA<RateLimitFailure>()),
      );
    });
  });
}
