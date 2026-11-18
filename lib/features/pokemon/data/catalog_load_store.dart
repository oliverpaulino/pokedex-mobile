import 'package:drift/drift.dart';

import '../../../core/database/app_database.dart' hide Pokemon, PokemonType;
import '../domain/catalog_load.dart';

const String catalogLoadResourceKey = 'pokemon_catalog';

class CatalogLoadStore {
  final AppDatabase db;

  const CatalogLoadStore(this.db);

  Future<CatalogLoadInfo> read() async {
    final row = await _query().getSingleOrNull();
    return _fromRow(row);
  }

  Stream<CatalogLoadInfo> watch() {
    return _query().watchSingleOrNull().map(_fromRow);
  }

  Future<void> markRunning() {
    return _write(status: CatalogLoadStatus.running);
  }

  Future<void> markSuccess(DateTime now) {
    return _write(status: CatalogLoadStatus.success, lastSuccessAt: now);
  }

  Future<void> markFailed() {
    return _write(status: CatalogLoadStatus.failed);
  }

  SimpleSelectStatement<$SyncMetadataTable, SyncMetadataData> _query() {
    return db.select(db.syncMetadata)
      ..where((table) => table.resourceKey.equals(catalogLoadResourceKey));
  }

  Future<void> _write({
    required CatalogLoadStatus status,
    DateTime? lastSuccessAt,
  }) {
    return db.into(db.syncMetadata).insertOnConflictUpdate(
          SyncMetadataCompanion.insert(
            resourceKey: catalogLoadResourceKey,
            status: Value(status.name),
            lastSuccessAt: lastSuccessAt == null
                ? const Value.absent()
                : Value(lastSuccessAt),
          ),
        );
  }

  CatalogLoadInfo _fromRow(SyncMetadataData? row) {
    if (row == null) {
      return const CatalogLoadInfo();
    }

    final status = CatalogLoadStatus.values.firstWhere(
      (value) => value.name == row.status,
      orElse: () => CatalogLoadStatus.pending,
    );

    return CatalogLoadInfo(
      status: status,
      lastSuccessAt: row.lastSuccessAt,
    );
  }
}
