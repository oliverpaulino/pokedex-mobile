import 'dart:async';

import 'connectivity_config.dart';
import 'domain/api_health_checker.dart';
import 'domain/network_status_source.dart';
import 'domain/service_availability.dart';

/// Monitor global de disponibilidad del servicio.
class ConnectivityMonitor {
  final NetworkStatusSource networkStatus;
  final ApiHealthChecker healthChecker;

  /// Si es `null`, no se programan comprobaciones periodicas.
  final Duration? healthCheckInterval;

  final StreamController<ServiceAvailability> _controller =
      StreamController<ServiceAvailability>.broadcast();

  StreamSubscription<bool>? _networkSubscription;
  Timer? _timer;
  ServiceAvailability _current = ServiceAvailability.checking;
  bool _started = false;
  bool _disposed = false;
  int _checkId = 0;

  ConnectivityMonitor({
    required this.networkStatus,
    required this.healthChecker,
    this.healthCheckInterval = connectivityHealthCheckInterval,
  });

  /// Ultima disponibilidad conocida.
  ServiceAvailability get current => _current;

  /// Emite el estado actual al suscribirse y luego cada cambio.
  Stream<ServiceAvailability> get availability {
    final controller = StreamController<ServiceAvailability>();
    StreamSubscription<ServiceAvailability>? subscription;

    controller.onListen = () {
      controller.add(_current);
      subscription = _controller.stream.listen(
        controller.add,
        onError: controller.addError,
        onDone: controller.close,
      );
    };

    controller.onCancel = () async {
      await subscription?.cancel();
    };

    return controller.stream;
  }

  /// Inicia la escucha de red y la primera comprobacion de salud.
  Future<void> start() async {
    if (_started || _disposed) {
      return;
    }
    _started = true;

    _networkSubscription = networkStatus.onNetworkChanged.listen(
      _handleNetworkChange,
      onError: (_) {
        // Si el plugin falla, se conserva el estado actual y el chequeo
        // periodico sigue intentando detectar la disponibilidad real.
      },
    );

    await _refresh(showChecking: true);

    final interval = healthCheckInterval;
    if (interval != null && interval > Duration.zero) {
      _timer = Timer.periodic(
        interval,
        (_) => unawaited(
          _refresh(
            showChecking: _current == ServiceAvailability.offline,
          ),
        ),
      );
    }
  }

  /// Fuerza una comprobacion inmediata de red y salud de la API.
  Future<void> checkNow() {
    return _refresh(showChecking: true);
  }

  void _handleNetworkChange(bool hasNetwork) {
    if (_disposed) {
      return;
    }

    if (!hasNetwork) {
      _checkId++;
      _emit(ServiceAvailability.offline);
      return;
    }

    unawaited(_refresh(showChecking: true, hasNetwork: true));
  }

  Future<void> _refresh({
    required bool showChecking,
    bool? hasNetwork,
  }) async {
    if (_disposed) {
      return;
    }

    final checkId = ++_checkId;

    bool connected;
    if (hasNetwork != null) {
      connected = hasNetwork;
    } else {
      try {
        connected = await networkStatus.hasNetwork();
      } catch (_) {
        connected = false;
      }
    }

    if (_disposed || checkId != _checkId) {
      return;
    }

    if (!connected) {
      _emit(ServiceAvailability.offline);
      return;
    }

    if (showChecking) {
      _emit(ServiceAvailability.checking);
    }

    bool healthy;
    try {
      healthy = await healthChecker.isAvailable();
    } catch (_) {
      healthy = false;
    }

    if (_disposed || checkId != _checkId) {
      return;
    }

    _emit(
      healthy
          ? ServiceAvailability.online
          : ServiceAvailability.serviceUnavailable,
    );
  }

  void _emit(ServiceAvailability next) {
    if (_disposed || _current == next) {
      return;
    }

    _current = next;
    _controller.add(next);
  }

  Future<void> dispose() async {
    if (_disposed) {
      return;
    }
    _disposed = true;
    _timer?.cancel();
    await _networkSubscription?.cancel();
    await _controller.close();
  }
}
