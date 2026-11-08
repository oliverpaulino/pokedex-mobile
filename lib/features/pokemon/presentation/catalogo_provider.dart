import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../app/providers.dart';
import '../domain/entities.dart';

// Los cuatro estados posibles del catalogo.
enum CatalogoStatus {
  loading,
  success,
  empty,
  error,
}

// Informacion que necesita la pantalla del catalogo.
class CatalogoState {
  final CatalogoStatus status;
  final List<Pokemon> pokemons;
  final String? message;

  const CatalogoState({
    required this.status,
    this.pokemons = const [],
    this.message,
  });
}

// Escucha los Pokemon directamente desde el repositorio local.
final catalogoStreamProvider =
StreamProvider.autoDispose.family<List<Pokemon>, String>(
      (ref, search) {
    final repository = ref.watch(pokemonRepositoryProvider);

    return repository.watchPokemon(
      search: search.trim(),
    );
  },
  retry: (retryCount, error) => null,
);

// Transforma el resultado de Riverpod en un estado sencillo.
final catalogoStateProvider =
    Provider.autoDispose.family<CatalogoState, String>(
  (ref, search) {
    final result = ref.watch(catalogoStreamProvider(search));

    return result.when(
      loading: () {
        return const CatalogoState(
          status: CatalogoStatus.loading,
        );
      },
      data: (pokemons) {
        if (pokemons.isEmpty) {
          return const CatalogoState(
            status: CatalogoStatus.empty,
          );
        }

        return CatalogoState(
          status: CatalogoStatus.success,
          pokemons: pokemons,
        );
      },
      error: (error, stackTrace) {
        print('ERROR REAL DEL CATALOGO: $error');

        return const CatalogoState(
          status: CatalogoStatus.error,
          message: 'No se pudo cargar el catálogo.',
        );
      },
      skipLoadingOnRefresh: false,
      skipLoadingOnReload: false,
    );
  },
);
