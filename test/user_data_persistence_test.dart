import 'dart:io';

import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pokedex/core/database/app_database.dart' hide Pokemon, PokemonType;
import 'package:pokedex/features/pokemon/data/sync/pokemon_local_repository.dart';
import 'package:pokedex/features/pokemon/domain/entities.dart';

void main() {
  test('Favoritos, trivia y preferencias sobreviven a cerrar la base', () async {
    final folder = await Directory.systemTemp.createTemp('pokedex_drift_');
    final file = File('${folder.path}/pokedex.sqlite');
    var db = AppDatabase(NativeDatabase(file));

    const pikachu = Pokemon(
      id: 25,
      number: 25,
      name: 'pikachu',
      types: [PokemonType(id: 13, name: 'electric')],
    );

    try {
      final repo = PokemonLocalRepository(db);
      await repo.savePokemon([pikachu]);
      await db.customStatement('''
        INSERT INTO favorite (pokemon_id) VALUES (25)
      ''');
      await db.customStatement('''
        INSERT INTO trivia_result (score, correct_answers)
        VALUES (100, 1)
      ''');
      await db.customStatement('''
        INSERT INTO trivia_answer (trivia_result_id, pokemon_id, correct)
        VALUES (1, 25, 1)
      ''');
      await db.customStatement('''
        INSERT INTO app_setting (key, value)
        VALUES ('catalog_sort', 'name')
      ''');

      // Actualizar el catalogo NO puede borrar datos del usuario.
      await repo.savePokemon([pikachu]);
      await db.close();

      // Se abre el mismo archivo, como al cerrar y abrir la aplicacion.
      db = AppDatabase(NativeDatabase(file));

      final favorite = await db.customSelect(
        'SELECT pokemon_id FROM favorite',
      ).getSingle();
      expect(favorite.read<int>('pokemon_id'), 25);

      final result = await db.customSelect(
        'SELECT score, correct_answers FROM trivia_result',
      ).getSingle();
      expect(result.read<int>('score'), 100);
      expect(result.read<int>('correct_answers'), 1);

      final answer = await db.customSelect(
        'SELECT correct FROM trivia_answer WHERE pokemon_id = 25',
      ).getSingle();
      expect(answer.read<int>('correct'), 1);

      final setting = await db.customSelect(
        "SELECT value FROM app_setting WHERE key = 'catalog_sort'",
      ).getSingle();
      expect(setting.read<String>('value'), 'name');
    } finally {
      await db.close();
      await folder.delete(recursive: true);
    }
  });
}
