
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../app/providers.dart';
import '../../favorites/domain/entities.dart';

// Los cuatro estados posibles del catalogo.
enum CatalogStatus {
  loading,
  success,
  empty,
  error,
}

// Informacion que necesita la pantalla del catalogo.
class CatalogState {
  final CatalogStatus status;
  final List<Pokemon> pokemons;
  final String? message;

  const CatalogState({
    required this.status,
    this.pokemons = const [],
    this.message,
  });
}

// Escucha los Pokemon directamente desde el repositorio local.
final catalogStreamProvider =
StreamProvider.autoDispose.family<List<Pokemon>, String>(
      (ref, search) {
    final repository = ref.watch(pokemonRepositoryProvider);

    return repository.watchPokemon(
      search: search.trim(),
    );
  },
);

// Transforma el resultado de Riverpod en un estado sencillo.
final catalogStateProvider =
Provider.autoDispose.family<CatalogState, String>(
      (ref, search) {
    final result = ref.watch(catalogStreamProvider(search));

    return result.when(
      loading: () {
        return const CatalogState(
          status: CatalogStatus.loading,
        );
      },

      data: (pokemons) {
        if (pokemons.isEmpty) {
          return const CatalogState(
            status: CatalogStatus.empty,
          );
        }

        return CatalogState(
          status: CatalogStatus.success,
          pokemons: pokemons,
        );
      },

      error: (error, stackTrace) {
        return const CatalogState(
          status: CatalogStatus.error,
          message: 'No se pudo cargar el catalogo.',
        );
      },

      skipLoadingOnRefresh: false,
      skipLoadingOnReload: false,
    );
  },
);
