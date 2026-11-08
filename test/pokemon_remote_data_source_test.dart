import 'dart:async';

import 'package:ferry/ferry.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gql_exec/gql_exec.dart';
import 'package:pokedex/features/pokemon/data/remote/pokemon_remote_data_source.dart';
import 'package:pokedex/features/pokemon/domain/failures.dart';

import 'fixtures/pokemon_catalog_fixture.dart';

const _emptyResponse = <String, dynamic>{};

Client _clientReturning(Stream<Response> Function() handler) {
  return Client(
    link: Link.function((request, [forward]) => handler()),
  );
}

PokemonRemoteDataSource _dataSource(Stream<Response> Function() handler) {
  return PokemonRemoteDataSource(client: _clientReturning(handler));
}

void main() {
  group('PokemonRemoteDataSource', () {
    test('valida el limite antes de llamar a la red', () async {
      final dataSource = _dataSource(
        () => throw StateError('la red no deberia consultarse'),
      );

      await expectLater(
        dataSource.fetchCatalog(limit: 0, offset: 0),
        throwsA(isA<ValidationFailure>()),
      );
    });

    test('valida el offset antes de llamar a la red', () async {
      final dataSource = _dataSource(
        () => throw StateError('la red no deberia consultarse'),
      );

      await expectLater(
        dataSource.fetchCatalog(limit: 20, offset: -1),
        throwsA(isA<ValidationFailure>()),
      );
    });

    test('convierte una respuesta valida en DTO', () async {
      final catalog = buildPokemonCatalogData();
      final dataSource = _dataSource(
        () => Stream.value(
          Response(data: catalog.toJson(), response: _emptyResponse),
        ),
      );

      final dto = await dataSource.fetchCatalog(limit: 20, offset: 0);

      expect(dto.pokemons, hasLength(1));
      expect(dto.pokemons.single.name, 'charizard');
      expect(dto.totalCount, 1025);
    });

    test('traduce el timeout a TimeoutFailure', () async {
      final never = Completer<Response>();
      final dataSource = PokemonRemoteDataSource(
        client: _clientReturning(
          () => Stream<Response>.fromFuture(never.future),
        ),
        timeout: const Duration(milliseconds: 20),
      );

      await expectLater(
        dataSource.fetchCatalog(limit: 20, offset: 0),
        throwsA(isA<TimeoutFailure>()),
      );
    });

    test('traduce HTTP 429 a RateLimitFailure', () async {
      final dataSource = _dataSource(
        () => Stream.error(const ServerException(statusCode: 429)),
      );

      await expectLater(
        dataSource.fetchCatalog(limit: 20, offset: 0),
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
        dataSource.fetchCatalog(limit: 20, offset: 0),
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
        dataSource.fetchCatalog(limit: 20, offset: 0),
        throwsA(isA<GraphqlFailure>()),
      );
    });

    test('distingue una respuesta parcial', () async {
      final catalog = buildPokemonCatalogData();
      final dataSource = _dataSource(
        () => Stream.value(
          Response(
            data: catalog.toJson(),
            errors: [const GraphQLError(message: 'campo parcial')],
            response: _emptyResponse,
          ),
        ),
      );

      await expectLater(
        dataSource.fetchCatalog(limit: 20, offset: 0),
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
        dataSource.fetchCatalog(limit: 20, offset: 0),
        throwsA(isA<RateLimitFailure>()),
      );
    });

    test('traduce otros errores de servidor a GraphqlFailure', () async {
      final dataSource = _dataSource(
        () => Stream.error(const ServerException(statusCode: 500)),
      );

      await expectLater(
        dataSource.fetchCatalog(limit: 20, offset: 0),
        throwsA(isA<GraphqlFailure>()),
      );
    });
  });
}
