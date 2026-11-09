import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../core/connectivity/connectivity_monitor.dart';
import '../core/connectivity/data/connectivity_plus_network_status_source.dart';
import '../core/connectivity/domain/api_health_checker.dart';
import '../core/connectivity/domain/connectivity_state.dart';
import '../core/connectivity/domain/network_status_source.dart';
import '../core/connectivity/domain/service_availability.dart';
import '../core/connectivity/domain/sync_activity.dart';
import '../features/pokemon/data/remote/graphql_api_health_checker.dart';
import '../features/pokemon/data/remote/pokemon_remote_data_source_provider.dart';
import '../features/pokemon/data/sync/catalog_sync_provider.dart';
import '../features/pokemon/domain/catalog_sync.dart';

/// Fuente de red del dispositivo.
final networkStatusSourceProvider = Provider<NetworkStatusSource>((ref) {
  return ConnectivityPlusNetworkStatusSource();
});

/// Comprobador de salud real contra GraphQL.
final apiHealthCheckerProvider = Provider<ApiHealthChecker>((ref) {
  return GraphqlApiHealthChecker(
    remoteDataSource: ref.watch(pokemonRemoteDataSourceProvider),
  );
});

/// Monitor unico de disponibilidad del servicio.
final connectivityMonitorProvider = Provider<ConnectivityMonitor>((ref) {
  final monitor = ConnectivityMonitor(
    networkStatus: ref.watch(networkStatusSourceProvider),
    healthChecker: ref.watch(apiHealthCheckerProvider),
  );

  ref.onDispose(() {
    unawaited(monitor.dispose());
  });

  return monitor;
});

/// Disponibilidad del servicio.
final serviceAvailabilityProvider = StreamProvider<ServiceAvailability>((ref) {
  final monitor = ref.watch(connectivityMonitorProvider);
  unawaited(monitor.start());

  return monitor.availability;
});

/// Estado global para el indicador: disponibilidad + sincronizacion + vigencia.
final connectivityStateProvider = StreamProvider<ConnectivityState>((ref) {
  final monitor = ref.watch(connectivityMonitorProvider);
  unawaited(monitor.start());

  final metadataStore = ref.watch(catalogSyncMetadataStoreProvider);

  return combineConnectivityState(
    availability: monitor.availability,
    metadata: metadataStore.watch(),
  ).distinct();
});

/// Combina la disponibilidad del servicio con los metadatos de sincronizacion.
Stream<ConnectivityState> combineConnectivityState({
  required Stream<ServiceAvailability> availability,
  required Stream<CatalogSyncMetadata> metadata,
}) {
  late StreamController<ConnectivityState> controller;
  StreamSubscription<ServiceAvailability>? availabilitySubscription;
  StreamSubscription<CatalogSyncMetadata>? metadataSubscription;

  var currentAvailability = ServiceAvailability.checking;
  var currentMetadata = const CatalogSyncMetadata();

  void emit() {
    if (controller.isClosed) {
      return;
    }

    controller.add(
      ConnectivityState(
        availability: currentAvailability,
        syncActivity: _mapSyncActivity(currentMetadata.status),
        lastSuccessAt: currentMetadata.lastSuccessAt,
      ),
    );
  }

  controller = StreamController<ConnectivityState>(
    onListen: () {
      availabilitySubscription = availability.listen(
        (value) {
          currentAvailability = value;
          emit();
        },
      );

      metadataSubscription = metadata.listen(
        (value) {
          currentMetadata = value;
          emit();
        },
      );
    },
    onCancel: () async {
      await availabilitySubscription?.cancel();
      await metadataSubscription?.cancel();
    },
  );

  return controller.stream;
}

SyncActivity _mapSyncActivity(CatalogSyncStatus status) {
  return switch (status) {
    CatalogSyncStatus.pending => SyncActivity.idle,
    CatalogSyncStatus.running => SyncActivity.syncing,
    CatalogSyncStatus.success => SyncActivity.completed,
    CatalogSyncStatus.failed => SyncActivity.failed,
  };
}
