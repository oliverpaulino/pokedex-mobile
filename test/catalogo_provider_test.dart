import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:pokedex/app/providers.dart';
import 'package:pokedex/features/pokemon/domain/entities.dart';
import 'package:pokedex/features/pokemon/domain/pokemon_repository.dart';
import 'package:pokedex/features/pokemon/presentation/catalogo_provider.dart';

// Repositorio de prueba.
class FakePokemonRepository implements PokemonRepository {
  final Stream<List<Pokemon>> Function(String) responder;

  String? ultimaBusqueda;
  int consultas = 0;

  FakePokemonRepository(this.responder);

  @override
  Stream<List<Pokemon>> watchPokemon({
    String search = '',
  }) {
    consultas++;
    ultimaBusqueda = search;
    return responder(search);
  }

  @override
  Future<Pokemon?> getPokemon(int id) async => null;

  @override
  Future<void> savePokemon(List<Pokemon> pokemon) async {}
}

void main() {
  const pikachu = Pokemon(
    id: 25,
    number: 25,
    name: 'Pikachu',
    types: [
      PokemonType(id: 13, name: 'electric'),
    ],
  );

  ProviderContainer crearContenedor(FakePokemonRepository repo) {
    return ProviderContainer.test(
      retry: (retryCount, error) => null,
      overrides: [
        pokemonRepositoryProvider.overrideWith(
          (ref) => repo,
        ),
      ],
    );
  }

  void escuchar(ProviderContainer container, String search) {
    final subscription = container.listen(
      catalogoStateProvider(search),
      (previous, next) {},
    );

    addTearDown(subscription.close);
  }

  test('1. Muestra carga inicial', () {
    final controller = StreamController<List<Pokemon>>();
    addTearDown(controller.close);

    final repo = FakePokemonRepository(
      (_) => controller.stream,
    );

    final container = crearContenedor(repo);
    escuchar(container, '');

    expect(
      container.read(catalogoStateProvider('')).status,
      CatalogoStatus.loading,
    );
  });

  test('2. Muestra estado vacio', () async {
    final repo = FakePokemonRepository(
      (_) => Stream.value(<Pokemon>[]),
    );

    final container = crearContenedor(repo);
    escuchar(container, '');

    await container.read(catalogoStreamProvider('').future);
    await container.pump();

    expect(
      container.read(catalogoStateProvider('')).status,
      CatalogoStatus.empty,
    );
  });

  test('3. Muestra los Pokemon existentes', () async {
    final repo = FakePokemonRepository(
      (_) => Stream.value([pikachu]),
    );

    final container = crearContenedor(repo);
    escuchar(container, '');

    await container.read(catalogoStreamProvider('').future);
    await container.pump();

    final estado = container.read(catalogoStateProvider(''));

    expect(estado.status, CatalogoStatus.success);
    expect(estado.pokemons.length, 1);
    expect(estado.pokemons.first.name, 'Pikachu');
  });

  test('4. Muestra error cuando falla la lectura', () async {
    final repo = FakePokemonRepository(
      (_) => Stream<List<Pokemon>>.error(
        Exception('Error de SQLite'),
      ),
    );

    final container = crearContenedor(repo);
    escuchar(container, '');

    await expectLater(
      container.read(catalogoStreamProvider('').future),
      throwsA(anything),
    );

    await container.pump();

    final estado = container.read(catalogoStateProvider(''));

    expect(estado.status, CatalogoStatus.error);
    expect(estado.message, isNotEmpty);
  });

  test('5. Envia la busqueda al repositorio', () async {
    final repo = FakePokemonRepository(
      (_) => Stream.value([pikachu]),
    );

    final container = crearContenedor(repo);
    escuchar(container, '  pika  ');

    await container.read(
      catalogoStreamProvider('  pika  ').future,
    );

    expect(repo.ultimaBusqueda, 'pika');
  });

  test('6. Permite reintentar despues de un error', () async {
    var intentos = 0;

    final repo = FakePokemonRepository((_) {
      intentos++;

      if (intentos == 1) {
        return Stream<List<Pokemon>>.error(
          Exception('Error temporal'),
        );
      }

      return Stream.value([pikachu]);
    });

    final container = crearContenedor(repo);
    escuchar(container, '');

    // Primera consulta: error.
    await expectLater(
      container.read(catalogoStreamProvider('').future),
      throwsA(anything),
    );

    await container.pump();

    expect(
      container.read(catalogoStateProvider('')).status,
      CatalogoStatus.error,
    );

    // Reintentar.
    container.invalidate(catalogoStreamProvider(''));

    await container.pump();

    await container.read(catalogoStreamProvider('').future);
    await container.pump();

    expect(
      container.read(catalogoStateProvider('')).status,
      CatalogoStatus.success,
    );

    expect(intentos, 2);
  });

  test('7. Reacciona a cambios del repositorio', () async {
    final controller = StreamController<List<Pokemon>>();
    addTearDown(controller.close);

    final repo = FakePokemonRepository(
      (_) => controller.stream,
    );

    final container = crearContenedor(repo);
    escuchar(container, '');

    final primeraLectura = container.read(catalogoStreamProvider('').future);

    // Inicialmente no hay Pokemon.
    controller.add([]);
    await primeraLectura;
    await container.pump();

    expect(
      container.read(catalogoStateProvider('')).status,
      CatalogoStatus.empty,
    );

    // Aparece Pikachu sin reconstruir manualmente el provider.
    controller.add([pikachu]);
    await container.pump();

    final estado = container.read(catalogoStateProvider(''));

    expect(estado.status, CatalogoStatus.success);
    expect(estado.pokemons.first.name, 'Pikachu');
  });
}
