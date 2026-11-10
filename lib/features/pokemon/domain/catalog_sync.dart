import 'failures.dart';

enum CatalogSyncStatus {
  pending,
  running,
  success,
  failed,
}

class CatalogSyncMetadata {
  final CatalogSyncStatus status;
  final int offset;
  final DateTime? lastSuccessAt;

  const CatalogSyncMetadata({
    this.status = CatalogSyncStatus.pending,
    this.offset = 0,
    this.lastSuccessAt,
  });
}

sealed class CatalogSyncResult {
  final int downloaded;
  final int pages;

  const CatalogSyncResult({
    required this.downloaded,
    required this.pages,
  });
}

class CatalogSyncCompleted extends CatalogSyncResult {
  final DateTime completedAt;
  final bool skipped;

  const CatalogSyncCompleted({
    required super.downloaded,
    required super.pages,
    required this.completedAt,
    this.skipped = false,
  });
}

class CatalogSyncFailed extends CatalogSyncResult {
  final AppFailure failure;
  final int lastOffset;

  const CatalogSyncFailed({
    required super.downloaded,
    required super.pages,
    required this.failure,
    required this.lastOffset,
  });
}

abstract interface class CatalogSyncMetadataStore {
  Future<CatalogSyncMetadata> read();

  Stream<CatalogSyncMetadata> watch();

  Future<void> markRunning({required int offset});

  Future<void> saveProgress({required int offset});

  Future<void> markSuccess({required DateTime completedAt});

  Future<void> markFailed({required int offset});
}
