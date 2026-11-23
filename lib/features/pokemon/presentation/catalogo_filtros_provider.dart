import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../app/providers.dart';
import '../data/sync/catalogo_preferencias_store.dart';
import '../domain/pokemon_orden.dart';

// IDs de tipos utilizados por PokeAPI.
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

// Estado de las preferencias del catalogo.
class FiltrosCatalogo {
  final String busqueda;
  final int? tipoId;
  final OrdenPokemon orden;
  final bool ascendente;

  const FiltrosCatalogo({
    this.busqueda = '',
    this.tipoId,
    this.orden = OrdenPokemon.numero,
    this.ascendente = true,
  });
}

class FiltrosCatalogoNotifier extends Notifier<FiltrosCatalogo> {
  Future<void>? _carga;
  Future<void> _ultimoGuardado = Future<void>.value();

  @override
  FiltrosCatalogo build() {
    return const FiltrosCatalogo();
  }

  // Restaurar las preferencias de SQLite una sola vez.
  Future<void> cargar() {
    return _carga ??= _cargarDesdeSQLite();
  }

  Future<void> _cargarDesdeSQLite() async {
    final guardadas =
        await ref.read(catalogoPreferenciasStoreProvider).cargar();

    state = FiltrosCatalogo(
      busqueda: guardadas.busqueda,
      tipoId: guardadas.tipoId,
      orden: guardadas.orden,
      ascendente: guardadas.ascendente,
    );
  }

  void cambiarBusqueda(String busqueda) {
    _actualizar(
      FiltrosCatalogo(
        busqueda: busqueda,
        tipoId: state.tipoId,
        orden: state.orden,
        ascendente: state.ascendente,
      ),
    );
  }

  void cambiarTipo(int? tipoId) {
    _actualizar(
      FiltrosCatalogo(
        busqueda: state.busqueda,
        tipoId: tipoId,
        orden: state.orden,
        ascendente: state.ascendente,
      ),
    );
  }

  void cambiarOrden(OrdenPokemon orden) {
    _actualizar(
      FiltrosCatalogo(
        busqueda: state.busqueda,
        tipoId: state.tipoId,
        orden: orden,
        ascendente: orden != OrdenPokemon.totalBase,
      ),
    );
  }

  void cambiarDireccion(bool ascendente) {
    _actualizar(
      FiltrosCatalogo(
        busqueda: state.busqueda,
        tipoId: state.tipoId,
        orden: state.orden,
        ascendente: ascendente,
      ),
    );
  }

  void limpiar() {
    // Conservamos la busqueda, como hacia el boton anterior.
    _actualizar(
      const FiltrosCatalogo()
    );
  }

  // Actualizar Riverpod y guardar en SQLite.
  void _actualizar(FiltrosCatalogo nuevosFiltros) {
    state = nuevosFiltros;

    final preferencias = PreferenciasCatalogo(
      busqueda: state.busqueda,
      tipoId: state.tipoId,
      orden: state.orden,
      ascendente: state.ascendente,
    );

    final store = ref.read(catalogoPreferenciasStoreProvider);

    // Las escrituras se realizan en el mismo orden
    // en que el usuario cambia las preferencias.
    _ultimoGuardado = _ultimoGuardado
        .then((_) => store.guardar(preferencias))
        .catchError((Object error, StackTrace stackTrace) {
      debugPrint('Error guardando preferencias: $error');
    });
  }
}

final filtrosCatalogoProvider =
    NotifierProvider<FiltrosCatalogoNotifier, FiltrosCatalogo>(
  FiltrosCatalogoNotifier.new,
);
