import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../../../app/providers.dart';
import '../../../core/widgets/indicador_conectividad.dart';
import 'catalogo_provider.dart';

class CatalogoPantalla extends ConsumerStatefulWidget {
  const CatalogoPantalla({super.key});

  @override
  ConsumerState<CatalogoPantalla> createState() => _CatalogoPantallaState();
}

class _CatalogoPantallaState extends ConsumerState<CatalogoPantalla> {
  String busqueda = '';
  bool _cargado = false;

  @override
  void initState() {
    super.initState();
    if (!_cargado) {
      _cargado = true;
      Future<void>.microtask(() => ref.read(catalogLoaderProvider).load());
    }
  }

  @override
  Widget build(BuildContext context) {
    final estado = ref.watch(catalogoStateProvider(busqueda));

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
              busqueda.isEmpty
                  ? 'Todavía no hay Pokémon guardados'
                  : 'No se encontraron Pokémon',
            ),
            if (busqueda.isEmpty) ...[
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
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: TextField(
              decoration: const InputDecoration(
                hintText: 'Buscar Pokémon',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
              onChanged: (texto) {
                setState(() {
                  busqueda = texto;
                });
              },
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
