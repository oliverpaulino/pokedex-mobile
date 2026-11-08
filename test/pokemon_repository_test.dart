import 'dart:async';

import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:pokedex/core/database/app_database.dart'
    hide Pokemon, PokemonType;
import 'package:pokedex/features/pokemon/data/pokemon_local_repository.dart';
import 'package:pokedex/features/pokemon/domain/entities.dart';
import 'package:pokedex/features/pokemon/domain/failures.dart';

void main() {
  late AppDatabase db;
  late PokemonLocalRepository repositorio;

  const pikachu = Pokemon(
    id: 25,
    number: 25,
    name: 'Pikachu',
    types: [
      PokemonType(id: 13, name: 'electric'),
    ],
  );

  setUp(() {
    db = AppDatabase(NativeDatabase.memory());
    repositorio = PokemonLocalRepository(db);
  });

  tearDown(() async {
    await db.close();
  });

  test('Guardar Pokemon y sus tipos', () async {
    await repositorio.savePokemon([pikachu]);

    final pokemon = await repositorio.getPokemon(25);

    expect(pokemon, isNotNull);
    expect(pokemon!.name, 'Pikachu');
    expect(pokemon.types.first.name, 'electric');
  });

  test('No duplicar Pokemon', () async {
    await repositorio.savePokemon([pikachu]);
    await repositorio.savePokemon([pikachu]);

    final pokemon = await db.select(db.pokemons).get();
    final tipos = await db.select(db.pokemonTypes).get();

    expect(pokemon.length, 1);
    expect(tipos.length, 1);
  });

  test('Actualizar Pokemon existente', () async {
    await repositorio.savePokemon([pikachu]);

    const actualizado = Pokemon(
      id: 25,
      number: 25,
      name: 'Pikachu actualizado',
      types: [
        PokemonType(id: 13, name: 'electric'),
      ],
    );

    await repositorio.savePokemon([actualizado]);

    final pokemon = await repositorio.getPokemon(25);

    expect(pokemon!.name, 'Pikachu actualizado');
  });

  test('Rechazar datos invalidos', () async {
    const invalido = Pokemon(
      id: -1,
      number: -1,
      name: '',
      types: [],
    );

    await expectLater(
      repositorio.savePokemon([invalido]),
      throwsA(isA<ValidationFailure>()),
    );

    final filas = await db.select(db.pokemons).get();
    expect(filas, isEmpty);
  });

  test('Buscar por nombre en SQLite', () async {
    await repositorio.savePokemon([pikachu]);

    final resultado = await repositorio.watchPokemon(search: 'Pika').first;

    expect(resultado.length, 1);
    expect(resultado.first.id, 25);
  });

  test('Revertir todo el lote si falla una escritura', () async {
    // Ya existe Pikachu con numero nacional 25.
    await repositorio.savePokemon([pikachu]);

    const primero = Pokemon(
      id: 1,
      number: 1,
      name: 'Bulbasaur',
      types: [
        PokemonType(id: 12, name: 'grass'),
      ],
    );

    // ID diferente, pero numero nacional repetido.
    const segundo = Pokemon(
      id: 99,
      number: 25,
      name: 'Otro Pokemon',
      types: [
        PokemonType(id: 10, name: 'fire'),
      ],
    );

    await expectLater(
      repositorio.savePokemon([primero, segundo]),
      throwsA(isA<Exception>()),
    );

    final filas = await db.select(db.pokemons).get();

    // El lote fallo y Bulbasaur tampoco debe quedar.
    expect(filas.length, 1);
    expect(filas.first.id, 25);
  });

  test('El Stream avisa cuando cambia la base', () async {
    final iterator = StreamIterator(
      repositorio.watchPokemon(),
    );

    // Antes de guardar, la base esta vacia.
    expect(await iterator.moveNext(), isTrue);
    expect(iterator.current, isEmpty);

    // Esperamos la siguiente emision.
    final siguiente = iterator.moveNext();

    await repositorio.savePokemon([pikachu]);

    expect(await siguiente, isTrue);
    expect(iterator.current.length, 1);
    expect(iterator.current.first.name, 'Pikachu');

    await iterator.cancel();
  });
}
