import 'dart:async';

import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:pokedex/core/database/app_database.dart'
    hide Pokemon, PokemonType;
import 'package:pokedex/features/pokemon/data/sync/pokemon_local_repository.dart';
import 'package:pokedex/features/pokemon/domain/entities.dart';
import 'package:pokedex/features/pokemon/domain/failures.dart';
import 'package:drift/drift.dart' hide isNotNull;
import 'package:pokedex/features/pokemon/domain/pokemon_orden.dart';

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
    // Ya existe Pikachu y el tipo electric con ID 13.
    await repositorio.savePokemon([pikachu]);

    const primero = Pokemon(
      id: 1,
      number: 1,
      name: 'Bulbasaur',
      types: [
        PokemonType(id: 12, name: 'grass'),
      ],
    );

    // La tabla type exige que name sea unico. Electric ya existe con ID 13,
    // por lo que intentar guardarlo con ID 999 debe fallar en plena escritura.
    const segundo = Pokemon(
      id: 99,
      number: 99,
      name: 'Otro Pokemon',
      types: [
        PokemonType(id: 999, name: 'electric'),
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

  test('Admite variantes con el mismo numero nacional', () async {
    const normal = Pokemon(
      id: 52,
      number: 52,
      name: 'meowth',
      types: [PokemonType(id: 1, name: 'normal')],
    );
    const alola = Pokemon(
      id: 10152,
      number: 52,
      name: 'meowth-alola',
      types: [PokemonType(id: 17, name: 'dark')],
    );
    await repositorio.savePokemon([normal, alola]);

    final registros = await db.select(db.pokemons).get();
    expect(registros.length, 2);
    expect(registros.every((p) => p.nationalDexNumber == 52), isTrue);
    expect((await repositorio.getPokemon(52))?.name, 'meowth');
    expect((await repositorio.getPokemon(10152))?.name, 'meowth-alola');
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

  test('Filtra por tipo y conserva ambos tipos', () async {
    const charizard = Pokemon(
      id: 6,
      number: 6,
      name: 'charizard',
      types: [
        PokemonType(id: 10, name: 'fire'),
        PokemonType(id: 3, name: 'flying'),
      ],
    );

    const squirtle = Pokemon(
      id: 7,
      number: 7,
      name: 'squirtle',
      types: [
        PokemonType(id: 11, name: 'water'),
      ],
    );

    await repositorio.savePokemon([charizard, squirtle]);

    final resultado = await repositorio.watchPokemon(tipoId: 10).first;

    expect(resultado.length, 1);
    expect(resultado.first.name, 'charizard');

    // Charizard conserva Fire y Flying.
    expect(
      resultado.first.types.map((tipo) => tipo.name).toSet(),
      {'fire', 'flying'},
    );

    // Tambien se puede combinar busqueda y filtro.
    final combinado = await repositorio
        .watchPokemon(
          search: 'char',
          tipoId: 10,
        )
        .first;

    expect(combinado.length, 1);
  });

  test('Ordena por numero y nombre', () async {
    const zubat = Pokemon(
      id: 41,
      number: 41,
      name: 'zubat',
      types: [PokemonType(id: 3, name: 'flying')],
    );

    const abra = Pokemon(
      id: 63,
      number: 63,
      name: 'abra',
      types: [PokemonType(id: 14, name: 'psychic')],
    );

    await repositorio.savePokemon([zubat, abra]);

    final porNumero = await repositorio
        .watchPokemon(
          orden: OrdenPokemon.numero,
        )
        .first;

    final porNombre = await repositorio
        .watchPokemon(
          orden: OrdenPokemon.nombre,
        )
        .first;

    expect(
      porNumero.map((p) => p.name).toList(),
      ['zubat', 'abra'],
    );

    expect(
      porNombre.map((p) => p.name).toList(),
      ['abra', 'zubat'],
    );
  });

  test('Ordena por total base y deja datos faltantes al final', () async {
    const charizard = Pokemon(
      id: 6,
      number: 6,
      name: 'charizard',
      types: [PokemonType(id: 10, name: 'fire')],
    );

    const bulbasaur = Pokemon(
      id: 1,
      number: 1,
      name: 'bulbasaur',
      types: [PokemonType(id: 12, name: 'grass')],
    );

    const squirtle = Pokemon(
      id: 7,
      number: 7,
      name: 'squirtle',
      types: [PokemonType(id: 11, name: 'water')],
    );

    await repositorio.savePokemon([
      charizard,
      bulbasaur,
      squirtle,
    ]);

    await db.into(db.pokemonStats).insert(
          PokemonStatsCompanion.insert(
            pokemonId: const Value(6),
            hp: 78,
            attack: 84,
            defense: 78,
            specialAttack: 109,
            specialDefense: 85,
            speed: 100,
          ),
        );

    await db.into(db.pokemonStats).insert(
          PokemonStatsCompanion.insert(
            pokemonId: const Value(1),
            hp: 45,
            attack: 49,
            defense: 49,
            specialAttack: 65,
            specialDefense: 65,
            speed: 45,
          ),
        );

    final resultado = await repositorio
        .watchPokemon(
          orden: OrdenPokemon.totalBase,
        )
        .first;

    // Charizard: 534; Bulbasaur: 318.
    // Squirtle no tiene estadisticas guardadas.
    expect(
      resultado.map((p) => p.name).toList(),
      ['charizard', 'bulbasaur', 'squirtle'],
    );
  });
}
