import 'package:drift/drift.dart';

import '../../../../core/database/app_database.dart' hide Pokemon, PokemonType;
import '../../domain/catalog_sync.dart';
import 'catalog_sync_config.dart';

/// Persistencia de los metadatos de sincronizacion sobre Drift.
class DriftCatalogSyncMetadataStore implements CatalogSyncMetadataStore {
  final AppDatabase db;

  const DriftCatalogSyncMetadataStore(this.db);

  @override
  Future<CatalogSyncMetadata> read() async {
    final row = await _rowQuery().getSingleOrNull();
    return _fromRow(row);
  }

  @override
  Stream<CatalogSyncMetadata> watch() {
    return _rowQuery().watchSingleOrNull().map(_fromRow);
  }

  @override
  Future<void> markRunning({required int offset}) {
    return _write(
      status: CatalogSyncStatus.running,
      offset: offset.toString(),
    );
  }

  @override
  Future<void> saveProgress({required int offset}) {
    return _write(
      status: CatalogSyncStatus.running,
      offset: offset.toString(),
    );
  }

  @override
  Future<void> markSuccess({required DateTime completedAt}) {
    return _write(
      status: CatalogSyncStatus.success,
      offset: null,
      lastSuccessAt: completedAt,
    );
  }

  @override
  Future<void> markFailed({required int offset}) {
    return _write(
      status: CatalogSyncStatus.failed,
      offset: offset.toString(),
    );
  }

  SimpleSelectStatement<$SyncMetadataTable, SyncMetadataData> _rowQuery() {
    return db.select(db.syncMetadata)
      ..where((table) => table.resourceKey.equals(catalogResourceKey));
  }

  Future<void> _write({
    required CatalogSyncStatus status,
    required String? offset,
    DateTime? lastSuccessAt,
  }) {
    return db.into(db.syncMetadata).insertOnConflictUpdate(
          SyncMetadataCompanion.insert(
            resourceKey: catalogResourceKey,
            status: Value(status.name),
            cursorOrOffset: Value(offset),
            // Al omitir lastSuccessAt, insertOnConflictUpdate conserva el
            // valor existente. Solo markSuccess lo reemplaza.
            lastSuccessAt: lastSuccessAt == null
                ? const Value.absent()
                : Value(lastSuccessAt),
          ),
        );
  }

  CatalogSyncMetadata _fromRow(SyncMetadataData? row) {
    if (row == null) {
      return const CatalogSyncMetadata();
    }

    final status = CatalogSyncStatus.values.firstWhere(
      (value) => value.name == row.status,
      orElse: () => CatalogSyncStatus.pending,
    );

    return CatalogSyncMetadata(
      status: status,
      offset: int.tryParse(row.cursorOrOffset ?? '') ?? 0,
      lastSuccessAt: row.lastSuccessAt,
    );
  }
}
