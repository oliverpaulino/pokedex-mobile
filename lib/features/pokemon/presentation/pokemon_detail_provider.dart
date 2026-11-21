import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../app/providers.dart';
import '../domain/pokemon_detail.dart';

/// La pantalla de detalle observa este Stream: siempre sale de Drift.
/// Para refrescar se llama a
/// `ref.read(pokemonDetailRepositoryProvider).refreshDetail(id)`.
final pokemonDetailProvider =
    StreamProvider.autoDispose.family<PokemonDetail?, int>((ref, id) {
  return ref.watch(pokemonDetailRepositoryProvider).watchDetail(id);
});
