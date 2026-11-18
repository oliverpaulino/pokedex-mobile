import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:pokedex/features/pokemon/data/connection_checker.dart';
import 'package:pokedex/features/pokemon/data/dto/pokemon_catalog_dto.dart';
import 'package:pokedex/features/pokemon/data/remote/pokemon_remote_data_source.dart';
import 'package:pokedex/features/pokemon/domain/failures.dart';

class FakeRemote implements PokemonCatalogRemoteDataSource {
  FakeRemote(this.handler);

  final Future<PokemonCatalogDto> Function() handler;

  @override
  Future<PokemonCatalogDto> fetchCatalog({
    required int limit,
    required int offset,
  }) {
    return handler();
  }
}

PokemonCatalogDto _emptyDto() {
  return const PokemonCatalogDto(pokemons: [], totalCount: 0);
}

void main() {
  group('ConnectionChecker', () {
    test('devuelve online cuando la peticion tiene exito', () async {
      final checker = ConnectionChecker(
        remoteDataSource: FakeRemote(() async => _emptyDto()),
      );

      expect(await checker.check(), ConnectionStatus.online);
    });

    test('devuelve offline ante NetworkFailure', () async {
      final checker = ConnectionChecker(
        remoteDataSource: FakeRemote(() async => throw const NetworkFailure()),
      );

      expect(await checker.check(), ConnectionStatus.offline);
    });

    test('devuelve serviceUnavailable ante TimeoutFailure', () async {
      final checker = ConnectionChecker(
        remoteDataSource: FakeRemote(() async => throw const TimeoutFailure()),
      );

      expect(await checker.check(), ConnectionStatus.serviceUnavailable);
    });

    test('devuelve serviceUnavailable ante GraphqlFailure', () async {
      final checker = ConnectionChecker(
        remoteDataSource:
            FakeRemote(() async => throw const GraphqlFailure('x')),
      );

      expect(await checker.check(), ConnectionStatus.serviceUnavailable);
    });

    test('devuelve serviceUnavailable ante RateLimitFailure', () async {
      final checker = ConnectionChecker(
        remoteDataSource:
            FakeRemote(() async => throw const RateLimitFailure()),
      );

      expect(await checker.check(), ConnectionStatus.serviceUnavailable);
    });

    test('devuelve serviceUnavailable ante timeout del checker', () async {
      final never = Completer<PokemonCatalogDto>();
      final checker = ConnectionChecker(
        remoteDataSource: FakeRemote(() => never.future),
        timeout: const Duration(milliseconds: 20),
      );

      expect(await checker.check(), ConnectionStatus.serviceUnavailable);
    });
  });
}
