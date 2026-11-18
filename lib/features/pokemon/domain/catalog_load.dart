enum CatalogLoadStatus { pending, running, success, failed }

class CatalogLoadInfo {
  final CatalogLoadStatus status;
  final DateTime? lastSuccessAt;

  const CatalogLoadInfo({
    this.status = CatalogLoadStatus.pending,
    this.lastSuccessAt,
  });

  CatalogLoadInfo copyWith({
    CatalogLoadStatus? status,
    DateTime? lastSuccessAt,
  }) {
    return CatalogLoadInfo(
      status: status ?? this.status,
      lastSuccessAt: lastSuccessAt ?? this.lastSuccessAt,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is CatalogLoadInfo &&
            other.status == status &&
            other.lastSuccessAt == lastSuccessAt;
  }

  @override
  int get hashCode => Object.hash(status, lastSuccessAt);

  @override
  String toString() {
    return 'CatalogLoadInfo(status: $status, lastSuccessAt: $lastSuccessAt)';
  }
}
