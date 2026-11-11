import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokedex/app/connectivity_providers.dart';
import 'package:pokedex/core/connectivity/domain/service_availability.dart';

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

    // Vuelve a intentar cuando PokeAPI esta Online.
    ref.listen(serviceAvailabilityProvider, (previous, next) {
      if (next.asData?.value == ServiceAvailability.online) {
        ref.read(catalogSyncCoordinatorProvider).syncInitialCatalog();
      }
    });
    return child;
  }
}
