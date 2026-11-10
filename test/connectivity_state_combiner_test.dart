import 'dart:async';

import 'package:flutter_test/flutter_test.dart';

import 'package:pokedex/app/connectivity_providers.dart';
import 'package:pokedex/core/connectivity/domain/connectivity_state.dart';
import 'package:pokedex/core/connectivity/domain/service_availability.dart';
import 'package:pokedex/core/connectivity/domain/sync_activity.dart';
import 'package:pokedex/features/pokemon/domain/catalog_sync.dart';

void main() {
  test('combina disponibilidad y sincronizacion como dimensiones separadas',
      () async {
    final availability = StreamController<ServiceAvailability>();
    final metadata = StreamController<CatalogSyncMetadata>();

    final states = combineConnectivityState(
      availability: availability.stream,
      metadata: metadata.stream,
    ).take(3).toList();

    availability.add(ServiceAvailability.online);
    metadata.add(
      const CatalogSyncMetadata(
        status: CatalogSyncStatus.running,
        offset: 20,
      ),
    );

    await Future<void>.delayed(Duration.zero);

    availability.add(ServiceAvailability.offline);

    final result = await states;

    expect(result, hasLength(3));
    expect(result[0].availability, ServiceAvailability.online);
    expect(result[0].syncActivity, SyncActivity.idle);
    expect(result[1].availability, ServiceAvailability.online);
    expect(result[1].syncActivity, SyncActivity.syncing);
    expect(result[2].availability, ServiceAvailability.offline);
    expect(result[2].syncActivity, SyncActivity.syncing);
  });

  test('mapea cada estado de sincronizacion a SyncActivity', () async {
    final availability = StreamController<ServiceAvailability>();
    final metadata = StreamController<CatalogSyncMetadata>();
    final states = <ConnectivityState>[];

    final subscription = combineConnectivityState(
      availability: availability.stream,
      metadata: metadata.stream,
    ).listen(states.add);

    availability.add(ServiceAvailability.online);
    await Future<void>.delayed(Duration.zero);

    for (final status in CatalogSyncStatus.values) {
      metadata.add(CatalogSyncMetadata(status: status));
      await Future<void>.delayed(Duration.zero);
    }

    expect(
      states.map((state) => state.syncActivity).toList(),
      [
        SyncActivity.idle,
        SyncActivity.idle,
        SyncActivity.syncing,
        SyncActivity.completed,
        SyncActivity.failed,
      ],
    );

    await subscription.cancel();
    await availability.close();
    await metadata.close();
  });

  test('propaga lastSuccessAt desde los metadatos', () async {
    final availability = StreamController<ServiceAvailability>();
    final metadata = StreamController<CatalogSyncMetadata>();
    final completedAt = DateTime(2026, 5, 1);

    final stateFuture = combineConnectivityState(
      availability: availability.stream,
      metadata: metadata.stream,
    ).firstWhere((state) => state.lastSuccessAt != null);

    availability.add(ServiceAvailability.online);
    metadata.add(
      CatalogSyncMetadata(
        status: CatalogSyncStatus.success,
        lastSuccessAt: completedAt,
      ),
    );

    final state = await stateFuture;

    expect(state.syncActivity, SyncActivity.completed);
    expect(state.lastSuccessAt, completedAt);

    await availability.close();
    await metadata.close();
  });
}
