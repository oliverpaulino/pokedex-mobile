import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pokedex/core/database/app_database.dart';

void main() {
  late AppDatabase db;
  setUp(() => db = AppDatabase(NativeDatabase.memory()));
  tearDown(() async => db.close());

  test('Las formas comparten especie y numero nacional sin duplicar ID', () async {
    await db.customStatement("""
      INSERT INTO pokemon_species (id, name) VALUES (52, 'meowth')
    """);
    await db.customStatement("""
      INSERT INTO pokemon
        (id, national_dex_number, species_id, is_default, name)
      VALUES
        (52, 52, 52, 1, 'meowth'),
        (10152, 52, 52, 0, 'meowth-alola')
    """);
    final rows = await db.customSelect('''
      SELECT id FROM pokemon WHERE species_id = 52 ORDER BY id
    ''').get();
    expect(rows.length, 2);
  });

  test('Las estadisticas se guardan por forma', () async {
    await db.customStatement("""
      INSERT INTO pokemon(id, national_dex_number, name)
      VALUES (25, 25, 'pikachu')
    """);
    await db.customStatement('''
      INSERT INTO pokemon_stats
        (pokemon_id, hp, attack, defense, special_attack, special_defense, speed)
      VALUES (25, 35, 55, 40, 50, 50, 90)
    ''');
    final stats = await db.customSelect('''
      SELECT hp + attack + defense + special_attack + special_defense + speed
        AS total FROM pokemon_stats WHERE pokemon_id = 25
    ''').getSingle();
    expect(stats.read<int>('total'), 320);
  });

  test('Movimiento por version y metodo sin filas duplicadas', () async {
    await db.customStatement("""
      INSERT INTO pokemon(id, national_dex_number, name)
      VALUES (25, 25, 'pikachu')
    """);
    await db.customStatement("""
      INSERT INTO move(id, name) VALUES (85, 'thunderbolt')
    """);
    const moveSql = '''
      INSERT INTO pokemon_move
        (pokemon_id, move_id, version_group, learn_method, level_learned)
      VALUES (25, 85, 'scarlet-violet', 'machine', 0)
    ''';
    await db.customStatement(moveSql);
    await expectLater(db.customStatement(moveSql), throwsA(isA<Exception>()));
  });

  test('Claves foraneas activas y relaciones validas', () async {
    final fk = await db.customSelect('PRAGMA foreign_keys').getSingle();
    expect(fk.read<int>('foreign_keys'), 1);
    await expectLater(
      db.customStatement('''
        INSERT INTO pokemon_stats
          (pokemon_id, hp, attack, defense, special_attack, special_defense, speed)
        VALUES (99999, 1, 1, 1, 1, 1, 1)
      '''),
      throwsA(isA<Exception>()),
    );
    expect(await db.customSelect('PRAGMA foreign_key_check').get(), isEmpty);
  });
}
