import 'dart:async';

import 'package:flutter_test/flutter_test.dart';

import 'package:pokedex/core/connectivity/connectivity_monitor.dart';
import 'package:pokedex/core/connectivity/domain/api_health_checker.dart';
import 'package:pokedex/core/connectivity/domain/network_status_source.dart';
import 'package:pokedex/core/connectivity/domain/service_availability.dart';

class FakeNetworkStatusSource implements NetworkStatusSource {
  bool connected;

  final StreamController<bool> _controller = StreamController<bool>.broadcast();

  FakeNetworkStatusSource({required this.connected});

  @override
  Future<bool> hasNetwork() async => connected;

  @override
  Stream<bool> get onNetworkChanged => _controller.stream;

  void emit(bool value) {
    connected = value;
    _controller.add(value);
  }

  Future<void> dispose() => _controller.close();
}

class FakeApiHealthChecker implements ApiHealthChecker {
  bool available;
  int calls = 0;
  final Completer<bool>? _controlledResult;

  FakeApiHealthChecker({required this.available}) : _controlledResult = null;

  FakeApiHealthChecker.controlled(Completer<bool> result)
      : available = false,
        _controlledResult = result;

  @override
  Future<bool> isAvailable() {
    calls++;

    final controlled = _controlledResult;
    if (controlled != null) {
      return controlled.future;
    }

    return Future.value(available);
  }
}

Future<void> flush() => Future<void>.delayed(Duration.zero);

void main() {
  group('ConnectivityMonitor', () {
    late FakeNetworkStatusSource network;
    late FakeApiHealthChecker health;
    late ConnectivityMonitor monitor;

    setUp(() {
      network = FakeNetworkStatusSource(connected: true);
      health = FakeApiHealthChecker(available: true);
      monitor = ConnectivityMonitor(
        networkStatus: network,
        healthChecker: health,
        healthCheckInterval: null,
      );
    });

    tearDown(() async {
      await monitor.dispose();
      await network.dispose();
    });

    test('inicia en checking y termina online con red y API disponible',
        () async {
      final events = <ServiceAvailability>[];
      final subscription = monitor.availability.listen(events.add);

      expect(monitor.current, ServiceAvailability.checking);

      await monitor.start();
      await flush();

      expect(monitor.current, ServiceAvailability.online);
      expect(events, [
        ServiceAvailability.checking,
        ServiceAvailability.online,
      ]);
      expect(health.calls, 1);

      await subscription.cancel();
    });

    test('sin red queda offline y no consulta la API', () async {
      network.connected = false;

      await monitor.start();

      expect(monitor.current, ServiceAvailability.offline);
      expect(health.calls, 0);
    });

    test('con red pero API caida queda serviceUnavailable', () async {
      health.available = false;

      await monitor.start();

      expect(monitor.current, ServiceAvailability.serviceUnavailable);
      expect(health.calls, 1);
    });

    test('detecta la recuperacion de red y verifica la API', () async {
      network.connected = false;

      final events = <ServiceAvailability>[];
      final subscription = monitor.availability.listen(events.add);

      await monitor.start();
      expect(monitor.current, ServiceAvailability.offline);

      health.available = true;
      network.emit(true);
      await flush();

      expect(monitor.current, ServiceAvailability.online);
      expect(events, [
        ServiceAvailability.checking,
        ServiceAvailability.offline,
        ServiceAvailability.checking,
        ServiceAvailability.online,
      ]);

      await subscription.cancel();
    });

    test('pierde la red y pasa a offline sin consultar la API', () async {
      await monitor.start();
      expect(monitor.current, ServiceAvailability.online);

      final callsBefore = health.calls;
      network.emit(false);
      await flush();

      expect(monitor.current, ServiceAvailability.offline);
      expect(health.calls, callsBefore);
    });

    test('entrega el estado actual a un nuevo suscriptor', () async {
      await monitor.start();
      expect(monitor.current, ServiceAvailability.online);

      final first = await monitor.availability.first;

      expect(first, ServiceAvailability.online);
    });

    test('un cambio de red invalida un chequeo de salud en curso', () async {
      final controlledHealth = Completer<bool>();
      final controlledChecker =
          FakeApiHealthChecker.controlled(controlledHealth);
      final controlledMonitor = ConnectivityMonitor(
        networkStatus: network,
        healthChecker: controlledChecker,
        healthCheckInterval: null,
      );

      final startFuture = controlledMonitor.start();
      await flush();
      expect(controlledMonitor.current, ServiceAvailability.checking);

      network.emit(false);
      await flush();
      expect(controlledMonitor.current, ServiceAvailability.offline);

      controlledHealth.complete(true);
      await startFuture;
      await flush();

      expect(controlledMonitor.current, ServiceAvailability.offline);

      await controlledMonitor.dispose();
    });
  });

  group('ConnectivityMonitor con comprobaciones periodicas', () {
    test('detecta que la API deja de responder y se recupera', () async {
      final network = FakeNetworkStatusSource(connected: true);
      final health = FakeApiHealthChecker(available: true);
      final monitor = ConnectivityMonitor(
        networkStatus: network,
        healthChecker: health,
        healthCheckInterval: const Duration(milliseconds: 20),
      );

      await monitor.start();
      expect(monitor.current, ServiceAvailability.online);

      health.available = false;
      await Future<void>.delayed(const Duration(milliseconds: 70));
      expect(monitor.current, ServiceAvailability.serviceUnavailable);

      health.available = true;
      await Future<void>.delayed(const Duration(milliseconds: 70));
      expect(monitor.current, ServiceAvailability.online);

      await monitor.dispose();
      await network.dispose();
    });
  });
}
