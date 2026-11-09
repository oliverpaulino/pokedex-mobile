import 'dart:async';

import 'package:drift/drift.dart' show Value;
import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pokedex/core/database/app_database.dart'
    hide Pokemon, PokemonType;
import 'package:pokedex/features/pokemon/data/sync/catalog_sync_config.dart';
import 'package:pokedex/features/pokemon/data/sync/drift_catalog_sync_metadata_store.dart';
import 'package:pokedex/features/pokemon/domain/catalog_sync.dart';

void main() {
  late AppDatabase db;
  late DriftCatalogSyncMetadataStore store;

  setUp(() {
    db = AppDatabase(NativeDatabase.memory());
    store = DriftCatalogSyncMetadataStore(db);
  });

  tearDown(() async {
    await db.close();
  });

  test('lee un estado pending cuando no existe la fila', () async {
    final metadata = await store.read();

    expect(metadata.status, CatalogSyncStatus.pending);
    expect(metadata.offset, 0);
    expect(metadata.lastSuccessAt, isNull);
  });

  test('markRunning persiste el estado y el offset', () async {
    await store.markRunning(offset: 40);

    final metadata = await store.read();

    expect(metadata.status, CatalogSyncStatus.running);
    expect(metadata.offset, 40);
    expect(metadata.lastSuccessAt, isNull);
  });

  test('saveProgress conserva lastSuccessAt', () async {
    final completedAt = DateTime(2026, 1, 2, 3, 4, 5);
    await store.markSuccess(completedAt: completedAt);
    await store.markRunning(offset: 20);
    await store.saveProgress(offset: 40);

    final metadata = await store.read();

    expect(metadata.status, CatalogSyncStatus.running);
    expect(metadata.offset, 40);
    expect(
      metadata.lastSuccessAt?.millisecondsSinceEpoch,
      completedAt.millisecondsSinceEpoch,
    );
  });

  test('markFailed conserva el ultimo offset y lastSuccessAt', () async {
    final completedAt = DateTime(2026, 1, 2);
    await store.markSuccess(completedAt: completedAt);
    await store.markRunning(offset: 20);
    await store.markFailed(offset: 20);

    final metadata = await store.read();

    expect(metadata.status, CatalogSyncStatus.failed);
    expect(metadata.offset, 20);
    expect(
      metadata.lastSuccessAt?.millisecondsSinceEpoch,
      completedAt.millisecondsSinceEpoch,
    );
  });

  test('markSuccess limpia el cursor y actualiza lastSuccessAt', () async {
    await store.markRunning(offset: 40);
    final completedAt = DateTime(2026, 1, 3);
    await store.markSuccess(completedAt: completedAt);

    final metadata = await store.read();
    final row = await db.select(db.syncMetadata).getSingle();

    expect(metadata.status, CatalogSyncStatus.success);
    expect(metadata.offset, 0);
    expect(
      metadata.lastSuccessAt?.millisecondsSinceEpoch,
      completedAt.millisecondsSinceEpoch,
    );
    expect(row.cursorOrOffset, isNull);
  });

  test('watch emite el estado inicial y los cambios', () async {
    final iterator = StreamIterator(store.watch());

    expect(await iterator.moveNext(), isTrue);
    expect(iterator.current.status, CatalogSyncStatus.pending);

    final next = iterator.moveNext();
    await store.markRunning(offset: 20);

    expect(await next, isTrue);
    expect(iterator.current.status, CatalogSyncStatus.running);
    expect(iterator.current.offset, 20);

    await iterator.cancel();
  });

  test('un offset invalido se interpreta como cero', () async {
    await db.into(db.syncMetadata).insert(
          SyncMetadataCompanion.insert(
            resourceKey: catalogResourceKey,
            status: const Value('failed'),
            cursorOrOffset: const Value('no-es-un-numero'),
          ),
        );

    final metadata = await store.read();

    expect(metadata.status, CatalogSyncStatus.failed);
    expect(metadata.offset, 0);
  });
}
