import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'features/pokemon/presentation/catalogo_pantalla.dart';

import 'app/catalog_sync_bootstrap.dart';
import 'app/connectivity_bootstrap.dart';

void main() {
  runApp(
    const ProviderScope(
      child: ConnectivityBootstrap(
        child: CatalogSyncBootstrap(
          child: MyApp(),
        ),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pokédex',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.red,
        ),
        useMaterial3: true,
      ),
      home: const CatalogoPantalla(),
    );
  }
}
