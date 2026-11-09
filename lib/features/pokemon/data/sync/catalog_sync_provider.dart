import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../app/providers.dart';
import '../../domain/catalog_sync.dart';
import '../remote/pokemon_remote_data_source_provider.dart';
import 'catalog_sync_coordinator.dart';
import 'drift_catalog_sync_metadata_store.dart';

/// Persistencia de los metadatos de sincronizacion del catalogo.
final catalogSyncMetadataStoreProvider =
    Provider<CatalogSyncMetadataStore>((ref) {
  final db = ref.watch(appDatabaseProvider);

  return DriftCatalogSyncMetadataStore(db);
});

/// Coordinador unico de sincronizacion del catalogo.
final catalogSyncCoordinatorProvider = Provider<CatalogSyncCoordinator>((ref) {
  return CatalogSyncCoordinator(
    remoteDataSource: ref.watch(pokemonRemoteDataSourceProvider),
    repository: ref.watch(pokemonRepositoryProvider),
    metadataStore: ref.watch(catalogSyncMetadataStoreProvider),
  );
});

/// Estado de sincronizacion para el indicador global.
final catalogSyncStatusProvider = StreamProvider<CatalogSyncMetadata>((ref) {
  return ref.watch(catalogSyncMetadataStoreProvider).watch();
});

/// Dispara la sincronizacion inicial una sola vez.
/// La UI no debe esperar este provider para construirse; al observarlo se
/// inicia la descarga en segundo plano.
final initialCatalogSyncProvider = FutureProvider<CatalogSyncResult>((ref) {
  return ref.watch(catalogSyncCoordinatorProvider).syncInitialCatalog();
});
