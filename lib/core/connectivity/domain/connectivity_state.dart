import 'service_availability.dart';
import 'sync_activity.dart';

/// Estado global que consume el indicador de conectividad.
class ConnectivityState {
  final ServiceAvailability availability;
  final SyncActivity syncActivity;
  final DateTime? lastSuccessAt;

  const ConnectivityState({
    this.availability = ServiceAvailability.checking,
    this.syncActivity = SyncActivity.idle,
    this.lastSuccessAt,
  });

  bool get isOnline => availability == ServiceAvailability.online;

  bool get isOffline => availability == ServiceAvailability.offline;

  bool get isServiceUnavailable =>
      availability == ServiceAvailability.serviceUnavailable;

  bool get isChecking => availability == ServiceAvailability.checking;

  bool get isSyncing => syncActivity == SyncActivity.syncing;

  ConnectivityState copyWith({
    ServiceAvailability? availability,
    SyncActivity? syncActivity,
    DateTime? lastSuccessAt,
  }) {
    return ConnectivityState(
      availability: availability ?? this.availability,
      syncActivity: syncActivity ?? this.syncActivity,
      lastSuccessAt: lastSuccessAt ?? this.lastSuccessAt,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is ConnectivityState &&
            other.availability == availability &&
            other.syncActivity == syncActivity &&
            other.lastSuccessAt == lastSuccessAt;
  }

  @override
  int get hashCode => Object.hash(availability, syncActivity, lastSuccessAt);

  @override
  String toString() {
    return 'ConnectivityState('
        'availability: $availability, '
        'syncActivity: $syncActivity, '
        'lastSuccessAt: $lastSuccessAt)';
  }
}
