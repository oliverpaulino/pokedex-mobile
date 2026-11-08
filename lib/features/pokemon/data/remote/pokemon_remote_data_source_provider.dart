import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/network/ferry_client_provider.dart';
import 'pokemon_remote_data_source.dart';

final pokemonRemoteDataSourceProvider = Provider<PokemonRemoteDataSource>((ref) {
  final client = ref.watch(ferryClientProvider);

  return PokemonRemoteDataSource(client: client);
});
