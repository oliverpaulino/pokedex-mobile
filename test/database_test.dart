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

  test('Existen las cinco tablas', () async {
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
      ]),
    );
  });

  test('La base usa la version 1', () {
    expect(db.schemaVersion, 1);
  });

  test('No permite numeros duplicados', () async {
    await db.customStatement('''
      INSERT INTO pokemon
        (id, national_dex_number, name)
      VALUES (25, 25, 'Pikachu')
    ''');

    await expectLater(
      db.customStatement('''
        INSERT INTO pokemon
          (id, national_dex_number, name)
        VALUES (26, 25, 'Otro Pokemon')
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
