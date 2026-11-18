import 'dart:async';

import '../domain/failures.dart';
import '../domain/pokemon_repository.dart';
import 'catalog_load_store.dart';
import 'dto/pokemon_catalog_dto.dart';
import 'mappers/pokemon_mapper.dart';
import 'remote/pokemon_remote_data_source.dart';

class CatalogLoader {
  final PokemonCatalogRemoteDataSource remoteDataSource;
  final PokemonRepository repository;
  final CatalogLoadStore store;
  final PokemonMapper mapper;
  final int pageSize;
  final int maxAttempts;
  final Duration initialBackoff;
  final DateTime Function() now;

  Future<void>? _activeLoad;

  CatalogLoader({
    required this.remoteDataSource,
    required this.repository,
    required this.store,
    this.mapper = const PokemonMapper(),
    this.pageSize = 20,
    this.maxAttempts = 3,
    this.initialBackoff = const Duration(milliseconds: 1000),
    this.now = DateTime.now,
  });

  Future<void> load() {
    final active = _activeLoad;
    if (active != null) {
      return active;
    }

    final future = _run();
    final tracked = future.whenComplete(() {
      _activeLoad = null;
    });
    _activeLoad = tracked;
    return tracked;
  }

  Future<void> _run() async {
    await store.markRunning();

    try {
      var offset = 0;
      var hasMore = true;

      while (hasMore) {
        final page = await _fetchPageWithRetry(offset: offset);
        final totalCount = page.totalCount;

        if (page.pokemons.isEmpty) {
          if (totalCount > offset) {
            throw const GraphqlFailure(
              'La API devolvio una pagina vacia antes de completar el catalogo',
            );
          }
          hasMore = false;
        } else {
          final entities = mapper.toEntities(page);
          await repository.savePokemon(entities);
          offset += entities.length;

          hasMore = totalCount > 0 && offset < totalCount;
        }
      }

      await store.markSuccess(now());
    } on AppFailure {
      await store.markFailed();
    } catch (_) {
      await store.markFailed();
    }
  }

  Future<PokemonCatalogDto> _fetchPageWithRetry({required int offset}) async {
    var attempt = 0;
    var backoff = initialBackoff;

    while (attempt < maxAttempts) {
      attempt++;
      try {
        return await remoteDataSource.fetchCatalog(
          limit: pageSize,
          offset: offset,
        );

      } on AppFailure catch (failure) {
        final canRetry = _isRetryable(failure) && attempt < maxAttempts;
        if (!canRetry) {
          rethrow;
        }
        await Future<void>.delayed(backoff);
        backoff *= 2;
      }
    }

    throw const UnknownFailure();
  }

  bool _isRetryable(AppFailure failure) {
    return failure is NetworkFailure ||
        failure is TimeoutFailure ||
        failure is RateLimitFailure;
  }
}
