import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:pokedex/features/pokemon/domain/pokemon_orden.dart';
import 'package:pokedex/features/pokemon/presentation/catalogo_filtros_provider.dart';

import '../../../app/providers.dart';
import '../../../core/widgets/indicador_conectividad.dart';
import 'catalogo_provider.dart';

class CatalogoPantalla extends ConsumerStatefulWidget {
  const CatalogoPantalla({super.key});

  @override
  ConsumerState<CatalogoPantalla> createState() => _CatalogoPantallaState();
}

class _CatalogoPantallaState extends ConsumerState<CatalogoPantalla> {
  final TextEditingController _busquedaController = TextEditingController();

  bool _cargado = false;
  bool _preferenciasListas = false;

  Timer? _debounce;
  void _buscarPokemon(String texto) {
    // Cancelamos la búsqueda anterior.
    _debounce?.cancel();

    // Esperamos 400 ms desde la última tecla.
    _debounce = Timer(const Duration(milliseconds: 400), () {
      if (!mounted) return;

      ref.read(filtrosCatalogoProvider.notifier).cambiarBusqueda(texto.trim());
    });
  }

  Future<void> _restaurarPreferencias() async {
    try {
      // Recuperar los valores guardados desde SQLite.
      await ref.read(filtrosCatalogoProvider.notifier).cargar();

      if (!mounted) return;

      // Restaurar el texto visible del buscador.
      final filtros = ref.read(filtrosCatalogoProvider);

      _busquedaController.text = filtros.busqueda;
    } catch (error) {
      debugPrint('Error restaurando preferencias: $error');
    } finally {
      if (mounted) {
        setState(() {
          _preferenciasListas = true;
        });
      }
    }
  }

  @override
  void initState() {
    super.initState();
    if (!_cargado) {
      _cargado = true;
      Future<void>.microtask(() => ref.read(catalogLoaderProvider).load());
      // Restaurar las preferencias desde SQLite.
    }
    unawaited(_restaurarPreferencias());
  }

  @override
  //Esto evita que el temporizador intente actualizar una pantalla que ya no existe
  void dispose() {
    _debounce?.cancel();
    _busquedaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final filtros = ref.watch(filtrosCatalogoProvider);
    final busqueda = filtros.busqueda;
    final estado = ref.watch(catalogoStateProvider(busqueda));

    final hayFiltrosActivos = busqueda.isNotEmpty || filtros.tipoId != null;
    final carga = ref.watch(catalogLoadStatusProvider);

// Solo sabemos que el catálogo se completó cuando
// existe una sincronización completa registrada.
    final catalogoIncompleto = carga.asData?.value.lastSuccessAt == null;

    Widget contenido;

    // 1. Estado de carga
    if (estado.status == CatalogoStatus.loading) {
      contenido = const Center(
        child: CircularProgressIndicator(),
      );

      // 2. Estado vacio
    } else if (estado.status == CatalogoStatus.empty) {
      contenido = Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              hayFiltrosActivos
                  ? 'No hay coincidencias entre los Pokémon descargados '
                      'para esta búsqueda o estos filtros.'
                  : 'Todavía no hay Pokémon guardados',
              textAlign: TextAlign.center,
            ),
            if (!hayFiltrosActivos) ...[
              const SizedBox(height: 12),
              ElevatedButton(
                onPressed: () {
                  ref.invalidate(catalogoStreamProvider(busqueda));
                },
                child: const Text('Reintentar'),
              ),
            ],
          ],
        ),
      );
      // 3. Estado de error
    } else if (estado.status == CatalogoStatus.error) {
      contenido = Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              estado.message ?? 'Ocurrió un error',
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                ref.invalidate(
                  catalogoStreamProvider(busqueda),
                );
              },
              child: const Text('Reintentar'),
            ),
          ],
        ),
      );

      // 4. Estado de exito
    } else {
      contenido = ListView.builder(
        key: const Key('lista_pokemon'),
        itemCount: estado.pokemons.length,
        itemBuilder: (context, index) {
          final pokemon = estado.pokemons[index];

          return Card(
            child: ListTile(
              leading: SizedBox(
                width: 60,
                height: 60,
                child: pokemon.imageUrl != null && pokemon.imageUrl!.isNotEmpty
                    ? CachedNetworkImage(
                        imageUrl: pokemon.imageUrl!,
                        fit: BoxFit.contain,
                        placeholder: (context, url) => const Center(
                          child: CircularProgressIndicator(),
                        ),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.catching_pokemon),
                      )
                    : const Icon(Icons.catching_pokemon),
              ),
              title: Text(
                pokemon.name,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '#${pokemon.number.toString().padLeft(4, '0')}',
                  ),
                  Wrap(
                    spacing: 5,
                    children: pokemon.types.map((tipo) {
                      return Chip(
                        label: Text(tipo.name),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
          );
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Pokédex'),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(64),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 6,
            ),
            child: IndicadorConectividad(),
          ),
        ),
      ),
      body: !_preferenciasListas
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: TextField(
                    controller: _busquedaController,
                    decoration: const InputDecoration(
                      hintText: 'Buscar Pokémon',
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(),
                    ),
                    onChanged: _buscarPokemon,
                  ),
                ),
                if (catalogoIncompleto)
                  const Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 8,
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.info_outline),
                        SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            'Catálogo local incompleto. '
                            'Solo se muestran los Pokémon descargados.',
                          ),
                        ),
                      ],
                    ),
                  ),
                SizedBox(
                  height: 60,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    children: [
                      // Elegir el tipo.
                      DropdownButton<int?>(
                        value: filtros.tipoId,
                        hint: const Text('Todos los tipos'),
                        items: [
                          const DropdownMenuItem<int?>(
                            value: null,
                            child: Text('Todos los tipos'),
                          ),
                          ...tiposPokemon.entries.map(
                            (tipo) => DropdownMenuItem<int?>(
                              value: tipo.key,
                              child: Text(tipo.value),
                            ),
                          ),
                        ],
                        onChanged: (tipoId) {
                          ref
                              .read(filtrosCatalogoProvider.notifier)
                              .cambiarTipo(tipoId);
                        },
                      ),

                      const SizedBox(width: 16),

                      // Elegir el orden.
                      DropdownButton<OrdenPokemon>(
                        value: filtros.orden,
                        items: const [
                          DropdownMenuItem(
                            value: OrdenPokemon.numero,
                            child: Text('Número'),
                          ),
                          DropdownMenuItem(
                            value: OrdenPokemon.nombre,
                            child: Text('Nombre A-Z'),
                          ),
                          DropdownMenuItem(
                            value: OrdenPokemon.totalBase,
                            child: Text('Total base'),
                          ),
                        ],
                        onChanged: (orden) {
                          if (orden != null) {
                            ref
                                .read(filtrosCatalogoProvider.notifier)
                                .cambiarOrden(orden);
                          }
                        },
                      ),

                      const SizedBox(width: 8),

                      DropdownButton<bool>(
                        value: filtros.ascendente,
                        items: const [
                          DropdownMenuItem(
                            value: true,
                            child: Text('Asc ↑'),
                          ),
                          DropdownMenuItem(
                            value: false,
                            child: Text('Desc ↓'),
                          ),
                        ],
                        onChanged: (valor) {
                          if (valor != null) {
                            ref
                                .read(filtrosCatalogoProvider.notifier)
                                .cambiarDireccion(valor);
                          }
                        },
                      ),

                      const SizedBox(width: 12),

                      TextButton(
                        onPressed: () {
                          ref.read(filtrosCatalogoProvider.notifier).limpiar();
                        },
                        child: const Text('Limpiar'),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: contenido,
                ),
              ],
            ),
    );
  }
}
