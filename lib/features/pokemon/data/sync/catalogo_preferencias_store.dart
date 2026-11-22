import 'dart:convert';

import 'package:drift/drift.dart';

import '../../../../core/database/app_database.dart';
import '../../domain/pokemon_orden.dart';

// Los valores que queremos conservar al cerrar la app.
class PreferenciasCatalogo {
  final String busqueda;
  final int? tipoId;
  final OrdenPokemon orden;
  final bool ascendente;

  const PreferenciasCatalogo({
    this.busqueda = '',
    this.tipoId,
    this.orden = OrdenPokemon.numero,
    this.ascendente = true,
  });
}

// Guarda y recupera las preferencias desde SQLite.
class CatalogoPreferenciasStore {
  final AppDatabase db;

  CatalogoPreferenciasStore(this.db);

  static const _clave = 'catalogo_preferencias';

  // Recuperar las preferencias guardadas.
  Future<PreferenciasCatalogo> cargar() async {
    final fila = await (db.select(db.appSettings)
          ..where((tabla) => tabla.key.equals(_clave)))
        .getSingleOrNull();

    // Si nunca se han guardado, usar los valores iniciales.
    if (fila == null) {
      return const PreferenciasCatalogo();
    }

    try {
      final datos = jsonDecode(fila.value) as Map<String, dynamic>;

      final nombreOrden = datos['orden'];
      final tipo = datos['tipoId'];

      final orden = OrdenPokemon.values.firstWhere(
        (opcion) => opcion.name == nombreOrden,
        orElse: () => OrdenPokemon.numero,
      );

      return PreferenciasCatalogo(
        busqueda:
            datos['busqueda'] is String ? datos['busqueda'] as String : '',
        tipoId: tipo is int && tipo >= 1 && tipo <= 18 ? tipo : null,
        orden: orden,
        ascendente:
            datos['ascendente'] is bool ? datos['ascendente'] as bool : true,
      );
    } catch (_) {
      // Si el JSON no es valido, usar valores seguros.
      return const PreferenciasCatalogo();
    }
  }

  // Guardar o actualizar las preferencias.
  Future<void> guardar(PreferenciasCatalogo preferencias) async {
    final datos = jsonEncode({
      'busqueda': preferencias.busqueda,
      'tipoId': preferencias.tipoId,
      'orden': preferencias.orden.name,
      'ascendente': preferencias.ascendente,
    });

    await db.into(db.appSettings).insertOnConflictUpdate(
          AppSettingsCompanion.insert(
            key: _clave,
            value: datos,
          ),
        );
  }
}
