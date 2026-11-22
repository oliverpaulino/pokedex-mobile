import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokedex/features/pokemon/domain/pokemon_orden.dart';
import 'package:pokedex/graphql/__generated__/schema.ast.gql.dart';

// IDs oficiales de tipos utilizados por PokeAPI.
const tiposPokemon = <int, String>{
  1: 'Normal',
  2: 'Fighting',
  3: 'Flying',
  4: 'Poison',
  5: 'Ground',
  6: 'Rock',
  7: 'Bug',
  8: 'Ghost',
  9: 'Steel',
  10: 'Fire',
  11: 'Water',
  12: 'Grass',
  13: 'Electric',
  14: 'Psychic',
  15: 'Ice',
  16: 'Dragon',
  17: 'Dark',
  18: 'Fairy',
};

// Las opciones seleccionadas.
class FiltrosCatalogo {
  final int? tipoId;
  final OrdenPokemon orden;
  final bool ascendente;

  const FiltrosCatalogo({
    this.tipoId,
    this.orden = OrdenPokemon.numero,
    this.ascendente = true,
  });
}

// Permite cambiar los filtros desde Flutter.
class FiltrosCatalogoNotifier extends Notifier<FiltrosCatalogo> {
  @override
  FiltrosCatalogo build() {
    return const FiltrosCatalogo();
  }

  void cambiarTipo(int? tipoId) {
    state = FiltrosCatalogo(
      tipoId: tipoId,
      orden: state.orden,
      ascendente: state.ascendente,
    );
  }

  void cambiarOrden(OrdenPokemon orden) {
    state = FiltrosCatalogo(
      tipoId: state.tipoId,
      orden: orden,
      ascendente: orden != OrdenPokemon.totalBase,
    );
  }

  void cambiarDireccion(bool ascendente) {
    state = FiltrosCatalogo(
      tipoId: state.tipoId,
      orden: state.orden,
      ascendente: ascendente
    );
  }


  void limpiar() {
    state = const FiltrosCatalogo();
  }
}

final filtrosCatalogoProvider =
    NotifierProvider<FiltrosCatalogoNotifier, FiltrosCatalogo>(
  FiltrosCatalogoNotifier.new,
);
