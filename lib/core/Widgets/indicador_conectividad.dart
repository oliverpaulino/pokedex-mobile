import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../app/connectivity_providers.dart';
import '../../features/pokemon/data/sync/catalog_sync_provider.dart';
import '../connectivity/domain/connectivity_state.dart';
import '../connectivity/domain/service_availability.dart';
import '../connectivity/domain/sync_activity.dart';

class IndicadorConectividad extends ConsumerWidget {
  const IndicadorConectividad({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final estado = ref.watch(connectivityStateProvider).when(
          data: (dato) => dato,
          loading: () => const ConnectivityState(),
          error: (error, stack) => const ConnectivityState(
            availability: ServiceAvailability.serviceUnavailable,
          ),
        );

    String conexion;
    IconData icono;

    if (estado.availability == ServiceAvailability.online) {
      conexion = 'Online';
      icono = Icons.wifi;
    } else if (estado.availability == ServiceAvailability.offline) {
      conexion = 'Offline';
      icono = Icons.wifi_off;
    } else if (estado.availability == ServiceAvailability.serviceUnavailable) {
      conexion = 'Servicio no disponible';
      icono = Icons.cloud_off;
    } else {
      conexion = 'Comprobando';
      icono = Icons.wifi_find;
    }

    String sincronizacion;

    if (estado.syncActivity == SyncActivity.syncing) {
      sincronizacion = 'Sincronizando';
    } else if (estado.syncActivity == SyncActivity.completed) {
      sincronizacion = 'Sincronizado';
    } else if (estado.syncActivity == SyncActivity.failed) {
      sincronizacion = 'Error de sincronización';
    } else {
      sincronizacion = 'Sin sincronizar';
    }

    String fecha = 'Nunca';

    if (estado.lastSuccessAt != null) {
      final dato = estado.lastSuccessAt!.toLocal();

      fecha = '${dato.day}/${dato.month}/${dato.year} '
          '${dato.hour.toString().padLeft(2, '0')}:'
          '${dato.minute.toString().padLeft(2, '0')}';
    }

    return Row(
      children: [
        Expanded(
          child: Semantics(
            label: 'Conexión: $conexion. '
                'Sincronización: $sincronizacion. '
                'Origen: SQLite. Última sincronización: $fecha',
            child: ExcludeSemantics(
              child: Row(
                children: [
                  Icon(
                    icono,
                    color: Colors.white,
                    size: 20,
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          '$conexion · $sincronizacion',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 13,
                          ),
                        ),
                        Text(
                          'SQLite · Última sync: $fecha',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            color: Colors.white70,
                            fontSize: 11,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        if (estado.syncActivity == SyncActivity.failed)
          TextButton(
            onPressed: () async {
              await ref
                  .read(catalogSyncCoordinatorProvider)
                  .syncInitialCatalog();
            },
            style: TextButton.styleFrom(
              foregroundColor: Colors.white,
            ),
            child: const Text('Reintentar'),
          ),
      ],
    );
  }
}
