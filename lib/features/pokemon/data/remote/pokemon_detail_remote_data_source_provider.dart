import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/network/ferry_client_provider.dart';
import 'pokemon_detail_remote_data_source.dart';

final pokemonDetailRemoteDataSourceProvider =
    Provider<PokemonDetailRemoteDataSource>((ref) {
  final client = ref.watch(ferryClientProvider);

  return PokemonDetailGraphqlRemoteDataSource(client: client);
});
