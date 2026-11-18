import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../app/providers.dart';
import '../../features/pokemon/data/sync/connection_checker.dart';
import '../../features/pokemon/domain/catalog_load.dart';

class IndicadorConectividad extends ConsumerWidget {
  const IndicadorConectividad({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final connectionAsync = ref.watch(connectionStatusProvider);
    final loadAsync = ref.watch(catalogLoadStatusProvider);

    final connection =
        connectionAsync.asData?.value ?? ConnectionStatus.checking;
    final load = loadAsync.asData?.value ?? const CatalogLoadInfo();

    final isSyncing = load.status == CatalogLoadStatus.running;
    final presentation = _presentation(connection, isSyncing);
    final lastSyncText = _formatLastSync(load.lastSuccessAt);

    return Semantics(
      label:
          '${presentation.label}. SQLite. Última sincronización: ${lastSyncText ?? 'sin datos'}.',
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(presentation.icon, size: 18, color: Colors.white),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  presentation.label,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  'SQLite · Última sync: ${lastSyncText ?? '--/--/---- --:--'}',
                  style: const TextStyle(
                    color: Colors.white70,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          if (load.status == CatalogLoadStatus.failed)
            TextButton(
              onPressed: () {
                ref.read(catalogLoaderProvider).load();
              },
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 8),
                minimumSize: const Size(0, 32),
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              child: const Text('Reintentar'),
            ),
        ],
      ),
    );
  }

  _IndicatorPresentation _presentation(
    ConnectionStatus connection,
    bool isSyncing,
  ) {
    // Dimensiones separadas (conexión y sincronización): la sincronización se
    // presenta como capa/estado principal solo cuando está en curso.
    if (isSyncing) {
      return const _IndicatorPresentation(
        label: 'Sincronizando',
        icon: Icons.sync,
      );
    }

    switch (connection) {
      case ConnectionStatus.online:
        return const _IndicatorPresentation(
          label: 'Online',
          icon: Icons.cloud_done,
        );
      case ConnectionStatus.offline:
        return const _IndicatorPresentation(
          label: 'Offline',
          icon: Icons.cloud_off,
        );
      case ConnectionStatus.serviceUnavailable:
        return const _IndicatorPresentation(
          label: 'Servicio no disponible',
          icon: Icons.error_outline,
        );
      case ConnectionStatus.checking:
        return const _IndicatorPresentation(
          label: 'Verificando conexión',
          icon: Icons.hourglass_top,
        );
    }
  }

  String? _formatLastSync(DateTime? value) {
    if (value == null) return null;
    final local = value.toLocal();
    String two(int n) => n.toString().padLeft(2, '0');
    return '${two(local.day)}/${two(local.month)}/${local.year} '
        '${two(local.hour)}:${two(local.minute)}';
  }
}

class _IndicatorPresentation {
  final String label;
  final IconData icon;

  const _IndicatorPresentation({required this.label, required this.icon});
}
