import 'package:ferry/ferry.dart';
import 'package:gql_http_link/gql_http_link.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokedex/graphql/__generated__/schema.schema.gql.dart' show possibleTypesMap;

final ferryClientProvider = Provider<Client>((ref) {
  final httpLink = HttpLink('https://graphql.pokeapi.co/v1beta2');
  final cache = Cache(possibleTypes: possibleTypesMap);

  return Client(
    link: httpLink,
    cache: cache,
  );
});