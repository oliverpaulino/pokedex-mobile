import 'dart:async';

import 'package:flutter_test/flutter_test.dart';

import 'package:pokedex/features/pokemon/data/dto/pokemon_catalog_dto.dart';
import 'package:pokedex/features/pokemon/data/remote/graphql_api_health_checker.dart';
import 'package:pokedex/features/pokemon/data/remote/pokemon_remote_data_source.dart';
import 'package:pokedex/features/pokemon/domain/failures.dart';

class FakeRemoteDataSource implements PokemonCatalogRemoteDataSource {
  final Future<PokemonCatalogDto> Function(int limit, int offset) handler;

  int calls = 0;
  int? lastLimit;
  int? lastOffset;

  FakeRemoteDataSource(this.handler);

  @override
  Future<PokemonCatalogDto> fetchCatalog({
    required int limit,
    required int offset,
  }) {
    calls++;
    lastLimit = limit;
    lastOffset = offset;
    return handler(limit, offset);
  }
}

void main() {
  test('devuelve true cuando GraphQL responde', () async {
    final remote = FakeRemoteDataSource(
      (limit, offset) async => const PokemonCatalogDto(
        pokemons: [],
        totalCount: 0,
      ),
    );
    final checker = GraphqlApiHealthChecker(
      remoteDataSource: remote,
      timeout: const Duration(seconds: 1),
    );

    expect(await checker.isAvailable(), isTrue);
    expect(remote.calls, 1);
    expect(remote.lastLimit, 1);
    expect(remote.lastOffset, 0);
  });

  test('devuelve false ante un fallo de dominio', () async {
    final remote = FakeRemoteDataSource(
      (limit, offset) async => throw const NetworkFailure(),
    );
    final checker = GraphqlApiHealthChecker(remoteDataSource: remote);

    expect(await checker.isAvailable(), isFalse);
  });

  test('devuelve false cuando la comprobacion excede el timeout', () async {
    final pending = Completer<PokemonCatalogDto>();
    final remote = FakeRemoteDataSource((limit, offset) => pending.future);
    final checker = GraphqlApiHealthChecker(
      remoteDataSource: remote,
      timeout: const Duration(milliseconds: 10),
    );

    expect(await checker.isAvailable(), isFalse);
  });
}
