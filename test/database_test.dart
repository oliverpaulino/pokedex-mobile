import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pokedex/core/database/app_database.dart';

void main() {
  late AppDatabase db;

  setUp(() {
    db = AppDatabase(NativeDatabase.memory());
  });

  tearDown(() async {
    await db.close();
  });

  test('Existen las tablas del catalogo y del detalle', () async {
    final rows = await db.customSelect('''
      SELECT name FROM sqlite_master
      WHERE type = 'table'
    ''').get();

    final names = rows.map((row) => row.read<String>('name')).toList();

    expect(
      names,
      containsAll([
        'pokemon',
        'type',
        'pokemon_type',
        'favorite',
        'sync_metadata',
        'pokemon_species',
        'pokemon_stats',
        'ability',
        'pokemon_ability',
        'move',
        'pokemon_move',
        'evolution',
        'type_efficacy',
        'trivia_result',
        'trivia_answer',
        'app_setting',
      ]),
    );
  });

  test('La base usa la version 2', () {
    expect(db.schemaVersion, 2);
  });

  test('Permite formas con el mismo numero nacional', () async {
    await db.customStatement('''
      INSERT INTO pokemon (id, national_dex_number, name)
      VALUES (52, 52, 'meowth')
    ''');
    await db.customStatement('''
      INSERT INTO pokemon (id, national_dex_number, name)
      VALUES (10152, 52, 'meowth-alola')
    ''');

    final rows = await db.customSelect('''
      SELECT id FROM pokemon WHERE national_dex_number = 52
    ''').get();
    expect(rows.length, 2);
  });

  test('No permite IDs duplicados', () async {
    await db.customStatement('''
      INSERT INTO pokemon (id, national_dex_number, name)
      VALUES (52, 52, 'meowth')
    ''');
    await expectLater(
      db.customStatement('''
        INSERT INTO pokemon (id, national_dex_number, name)
        VALUES (52, 52, 'meowth-duplicado')
      '''),
      throwsA(isA<Exception>()),
    );
  });

  test('Las claves foraneas funcionan', () async {
    final row = await db.customSelect('PRAGMA foreign_keys').getSingle();

    expect(row.read<int>('foreign_keys'), 1);

    await expectLater(
      db.customStatement('''
        INSERT INTO favorite (pokemon_id)
        VALUES (99999)
      '''),
      throwsA(isA<Exception>()),
    );
  });

  test('Existe el indice del nombre', () async {
    final rows = await db.customSelect("PRAGMA index_list('pokemon')").get();

    final names = rows.map((row) => row.read<String>('name')).toList();

    expect(names, contains('pokemon_name_index'));
  });

  test('No duplica relaciones Pokemon Tipo', () async {
    await db.customStatement('''
      INSERT INTO pokemon
        (id, national_dex_number, name)
      VALUES (25, 25, 'Pikachu')
    ''');

    await db.customStatement('''
      INSERT INTO type (id, name)
      VALUES (13, 'electric')
    ''');

    await db.customStatement('''
      INSERT INTO pokemon_type
        (pokemon_id, type_id, slot)
      VALUES (25, 13, 1)
    ''');

    await expectLater(
      db.customStatement('''
        INSERT INTO pokemon_type
          (pokemon_id, type_id, slot)
        VALUES (25, 13, 1)
      '''),
      throwsA(isA<Exception>()),
    );
  });
}
