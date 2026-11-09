import 'dart:async';

import '../../domain/catalog_sync.dart';
import '../../domain/failures.dart';
import '../../domain/pokemon_repository.dart';
import '../dto/pokemon_catalog_dto.dart';
import '../mappers/pokemon_mapper.dart';
import '../remote/pokemon_remote_data_source.dart';
import 'catalog_sync_config.dart';

/// Coordina la descarga paginada del catalogo en segundo plano.

/// - Reanuda desde el offset guardado en `sync_metadata`.
/// - Evita sincronizaciones concurrentes compartiendo el mismo [Future].
/// - Reintenta fallos transitorios con backoff exponencial.
/// - Actualiza `lastSuccessAt` solo cuando termina todo el catalogo.
class CatalogSyncCoordinator {
  final PokemonCatalogRemoteDataSource remoteDataSource;
  final PokemonRepository repository;
  final CatalogSyncMetadataStore metadataStore;
  final PokemonMapper mapper;
  final int pageSize;
  final int maxAttempts;
  final Duration initialBackoff;
  final DateTime Function() now;

  Future<CatalogSyncResult>? _activeSync;

  CatalogSyncCoordinator({
    required this.remoteDataSource,
    required this.repository,
    required this.metadataStore,
    this.mapper = const PokemonMapper(),
    this.pageSize = catalogPageSize,
    this.maxAttempts = catalogSyncMaxAttempts,
    this.initialBackoff = catalogSyncInitialBackoff,
    this.now = DateTime.now,
  })  : assert(pageSize > 0, 'El tamano de pagina debe ser mayor que cero'),
        assert(maxAttempts > 0, 'Debe existir al menos un intento');

  /// Indica si hay una sincronizacion en curso.
  bool get isSyncing => _activeSync != null;

  /// Sincronizacion inicial del catalogo.
  /// Si ya existe una sincronizacion completa, no descarga nada salvo que
  /// [forceRestart] sea verdadero.
  Future<CatalogSyncResult> syncInitialCatalog({
    bool forceRestart = false,
  }) {
    return _start(() => _run(forceRestart: forceRestart));
  }

  /// Actualizacion completa del catalogo.
  /// Es una operacion independiente de la carga inicial: siempre vuelve a
  /// recorrer el catalogo desde el inicio y actualiza los datos locales.
  Future<CatalogSyncResult> refreshCatalog() {
    return _start(() => _run(forceRestart: true));
  }

  Future<CatalogSyncResult> _start(
    Future<CatalogSyncResult> Function() run,
  ) {
    final active = _activeSync;
    if (active != null) {
      return active;
    }

    final future = run();
    final tracked = future.whenComplete(() {
      _activeSync = null;
    });

    _activeSync = tracked;
    return tracked;
  }

  Future<CatalogSyncResult> _run({required bool forceRestart}) async {
    var downloaded = 0;
    var pages = 0;
    var offset = 0;

    try {
      final metadata = await metadataStore.read();

      // La sincronizacion inicial se omite si el catalogo ya esta completo.
      // refreshCatalog() usa forceRestart para saltarse esta condicion.
      if (!forceRestart && metadata.status == CatalogSyncStatus.success) {
        return CatalogSyncCompleted(
          downloaded: 0,
          pages: 0,
          completedAt: metadata.lastSuccessAt ?? now(),
          skipped: true,
        );
      }

      offset = forceRestart ? 0 : metadata.offset;
      if (offset < 0) {
        offset = 0;
      }

      await metadataStore.markRunning(offset: offset);

      while (true) {
        final page = await _fetchPageWithRetry(offset: offset);
        pages++;

        if (page.pokemons.isEmpty) {
          if (page.totalCount > offset) {
            throw const GraphqlFailure(
              'La API devolvio una pagina vacia antes de completar el catalogo',
            );
          }

          return await _complete(downloaded: downloaded, pages: pages);
        }

        final entities = mapper.toEntities(page);
        await repository.savePokemon(entities);

        downloaded += entities.length;
        offset += entities.length;

        if (page.totalCount > 0 && offset >= page.totalCount) {
          return await _complete(downloaded: downloaded, pages: pages);
        }

        await metadataStore.saveProgress(offset: offset);
      }
    } on AppFailure catch (failure) {
      await _markFailedSafely(offset);
      return CatalogSyncFailed(
        downloaded: downloaded,
        pages: pages,
        failure: failure,
        lastOffset: offset,
      );
    } catch (_) {
      await _markFailedSafely(offset);
      return CatalogSyncFailed(
        downloaded: downloaded,
        pages: pages,
        failure: const UnknownFailure(),
        lastOffset: offset,
      );
    }
  }

  Future<CatalogSyncCompleted> _complete({
    required int downloaded,
    required int pages,
  }) async {
    final completedAt = now();
    await metadataStore.markSuccess(completedAt: completedAt);

    return CatalogSyncCompleted(
      downloaded: downloaded,
      pages: pages,
      completedAt: completedAt,
    );
  }

  Future<PokemonCatalogDto> _fetchPageWithRetry({
    required int offset,
  }) async {
    var attempt = 0;
    var backoff = initialBackoff;

    while (true) {
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
  }

  bool _isRetryable(AppFailure failure) {
    return failure is NetworkFailure ||
        failure is TimeoutFailure ||
        failure is RateLimitFailure;
  }

  Future<void> _markFailedSafely(int offset) async {
    try {
      await metadataStore.markFailed(offset: offset);
    } catch (_) {
      // Si tampoco se puede escribir el metadato, el estado `running` con el
      // ultimo offset permite reanudar en la proxima ejecucion.
    }
  }
}
