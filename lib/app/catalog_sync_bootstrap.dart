import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../features/pokemon/data/sync/catalog_sync_provider.dart';

/// Inicio de la sincronizacion inicial del catalogo sin bloquear la UI.
class CatalogSyncBootstrap extends ConsumerWidget {
  final Widget child;

  const CatalogSyncBootstrap({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(initialCatalogSyncProvider, (previous, next) {});

    return child;
  }
}
