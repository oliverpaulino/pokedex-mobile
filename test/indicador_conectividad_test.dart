import 'dart:async';

import 'package:drift/native.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pokedex/app/providers.dart';
import 'package:pokedex/core/database/app_database.dart';
import 'package:pokedex/core/widgets/indicador_conectividad.dart';
import 'package:pokedex/features/pokemon/data/sync/catalog_load_store.dart';
import 'package:pokedex/features/pokemon/data/sync/catalog_loader.dart';
import 'package:pokedex/features/pokemon/data/sync/connection_checker.dart';
import 'package:pokedex/features/pokemon/data/dto/pokemon_catalog_dto.dart';
import 'package:pokedex/features/pokemon/data/sync/pokemon_local_repository.dart';
import 'package:pokedex/features/pokemon/data/remote/pokemon_remote_data_source.dart';
import 'package:pokedex/features/pokemon/domain/catalog_load.dart';

class _DummyRemote implements PokemonCatalogRemoteDataSource {
  @override
  Future<PokemonCatalogDto> fetchCatalog({
    required int limit,
    required int offset,
  }) {
    throw UnimplementedError();
  }
}

class SpyCatalogLoader extends CatalogLoader {
  SpyCatalogLoader._(AppDatabase db)
      : super(
          remoteDataSource: _DummyRemote(),
          repository: PokemonLocalRepository(db),
          store: CatalogLoadStore(db),
        );

  factory SpyCatalogLoader() =>
      SpyCatalogLoader._(AppDatabase(NativeDatabase.memory()));

  int loadCalls = 0;

  @override
  Future<void> load() async {
    loadCalls++;
  }
}

Widget _buildApp({
  required ConnectionStatus connection,
  required CatalogLoadInfo load,
  CatalogLoader? loader,
}) {
  return ProviderScope(
    overrides: [
      connectionStatusProvider.overrideWith((ref) => Stream.value(connection)),
      catalogLoadStatusProvider.overrideWith((ref) => Stream.value(load)),
      if (loader != null) catalogLoaderProvider.overrideWithValue(loader),
    ],
    child: const MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.indigo,
        body: Center(child: IndicadorConectividad()),
      ),
    ),
  );
}

void main() {
  testWidgets('muestra Online', (tester) async {
    await tester.pumpWidget(_buildApp(
      connection: ConnectionStatus.online,
      load: const CatalogLoadInfo(status: CatalogLoadStatus.success),
    ));
    await tester.pump();

    expect(find.text('Online'), findsOneWidget);
  });

  testWidgets('muestra Offline', (tester) async {
    await tester.pumpWidget(_buildApp(
      connection: ConnectionStatus.offline,
      load: const CatalogLoadInfo(status: CatalogLoadStatus.pending),
    ));
    await tester.pump();

    expect(find.text('Offline'), findsOneWidget);
  });

  testWidgets('muestra Servicio no disponible', (tester) async {
    await tester.pumpWidget(_buildApp(
      connection: ConnectionStatus.serviceUnavailable,
      load: const CatalogLoadInfo(status: CatalogLoadStatus.pending),
    ));
    await tester.pump();

    expect(find.text('Servicio no disponible'), findsOneWidget);
  });

  testWidgets('muestra Sincronizando cuando la carga esta en curso',
      (tester) async {
    await tester.pumpWidget(_buildApp(
      connection: ConnectionStatus.online,
      load: const CatalogLoadInfo(status: CatalogLoadStatus.running),
    ));
    await tester.pump();

    expect(find.text('Sincronizando'), findsOneWidget);
  });

  testWidgets('muestra Reintentar y llama al loader cuando falla',
      (tester) async {
    final loader = SpyCatalogLoader();
    await tester.pumpWidget(_buildApp(
      connection: ConnectionStatus.online,
      load: const CatalogLoadInfo(status: CatalogLoadStatus.failed),
      loader: loader,
    ));
    await tester.pump();

    expect(find.text('Reintentar'), findsOneWidget);
    await tester.tap(find.text('Reintentar'));
    await tester.pump();

    expect(loader.loadCalls, 1);
  });
}
