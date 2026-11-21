// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:gql/ast.dart' as _i1;

const PokemonDetail = _i1.OperationDefinitionNode(
  type: _i1.OperationType.query,
  name: _i1.NameNode(value: 'PokemonDetail'),
  variableDefinitions: [
    _i1.VariableDefinitionNode(
      variable: _i1.VariableNode(name: _i1.NameNode(value: 'id')),
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Int'),
        isNonNull: true,
      ),
      defaultValue: _i1.DefaultValueNode(value: null),
      directives: [],
    ),
    _i1.VariableDefinitionNode(
      variable: _i1.VariableNode(name: _i1.NameNode(value: 'versionGroups')),
      type: _i1.ListTypeNode(
        type: _i1.NamedTypeNode(
          name: _i1.NameNode(value: 'String'),
          isNonNull: true,
        ),
        isNonNull: true,
      ),
      defaultValue: _i1.DefaultValueNode(value: null),
      directives: [],
    ),
  ],
  directives: [],
  selectionSet: _i1.SelectionSetNode(selections: [
    _i1.FieldNode(
      name: _i1.NameNode(value: 'pokemon'),
      alias: null,
      arguments: [
        _i1.ArgumentNode(
          name: _i1.NameNode(value: 'where'),
          value: _i1.ObjectValueNode(fields: [
            _i1.ObjectFieldNode(
              name: _i1.NameNode(value: 'id'),
              value: _i1.ObjectValueNode(fields: [
                _i1.ObjectFieldNode(
                  name: _i1.NameNode(value: '_eq'),
                  value: _i1.VariableNode(name: _i1.NameNode(value: 'id')),
                )
              ]),
            )
          ]),
        ),
        _i1.ArgumentNode(
          name: _i1.NameNode(value: 'limit'),
          value: _i1.IntValueNode(value: '1'),
        ),
      ],
      directives: [],
      selectionSet: _i1.SelectionSetNode(selections: [
        _i1.FieldNode(
          name: _i1.NameNode(value: 'id'),
          alias: null,
          arguments: [],
          directives: [],
          selectionSet: null,
        ),
        _i1.FieldNode(
          name: _i1.NameNode(value: 'name'),
          alias: null,
          arguments: [],
          directives: [],
          selectionSet: null,
        ),
        _i1.FieldNode(
          name: _i1.NameNode(value: 'is_default'),
          alias: null,
          arguments: [],
          directives: [],
          selectionSet: null,
        ),
        _i1.FieldNode(
          name: _i1.NameNode(value: 'height'),
          alias: null,
          arguments: [],
          directives: [],
          selectionSet: null,
        ),
        _i1.FieldNode(
          name: _i1.NameNode(value: 'weight'),
          alias: null,
          arguments: [],
          directives: [],
          selectionSet: null,
        ),
        _i1.FieldNode(
          name: _i1.NameNode(value: 'pokemon_species_id'),
          alias: null,
          arguments: [],
          directives: [],
          selectionSet: null,
        ),
        _i1.FieldNode(
          name: _i1.NameNode(value: 'pokemonspecy'),
          alias: _i1.NameNode(value: 'species'),
          arguments: [],
          directives: [],
          selectionSet: _i1.SelectionSetNode(selections: [
            _i1.FieldNode(
              name: _i1.NameNode(value: 'id'),
              alias: null,
              arguments: [],
              directives: [],
              selectionSet: null,
            ),
            _i1.FieldNode(
              name: _i1.NameNode(value: 'name'),
              alias: null,
              arguments: [],
              directives: [],
              selectionSet: null,
            ),
            _i1.FieldNode(
              name: _i1.NameNode(value: 'generation_id'),
              alias: null,
              arguments: [],
              directives: [],
              selectionSet: null,
            ),
            _i1.FieldNode(
              name: _i1.NameNode(value: 'evolution_chain_id'),
              alias: null,
              arguments: [],
              directives: [],
              selectionSet: null,
            ),
            _i1.FieldNode(
              name: _i1.NameNode(value: 'evolves_from_species_id'),
              alias: null,
              arguments: [],
              directives: [],
              selectionSet: null,
            ),
            _i1.FieldNode(
              name: _i1.NameNode(value: 'pokemonegggroups'),
              alias: _i1.NameNode(value: 'eggGroups'),
              arguments: [],
              directives: [],
              selectionSet: _i1.SelectionSetNode(selections: [
                _i1.FieldNode(
                  name: _i1.NameNode(value: 'egggroup'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: _i1.SelectionSetNode(selections: [
                    _i1.FieldNode(
                      name: _i1.NameNode(value: 'id'),
                      alias: null,
                      arguments: [],
                      directives: [],
                      selectionSet: null,
                    ),
                    _i1.FieldNode(
                      name: _i1.NameNode(value: 'name'),
                      alias: null,
                      arguments: [],
                      directives: [],
                      selectionSet: null,
                    ),
                  ]),
                )
              ]),
            ),
            _i1.FieldNode(
              name: _i1.NameNode(value: 'pokemons'),
              alias: _i1.NameNode(value: 'variants'),
              arguments: [
                _i1.ArgumentNode(
                  name: _i1.NameNode(value: 'order_by'),
                  value: _i1.ObjectValueNode(fields: [
                    _i1.ObjectFieldNode(
                      name: _i1.NameNode(value: 'id'),
                      value:
                          _i1.EnumValueNode(name: _i1.NameNode(value: 'asc')),
                    )
                  ]),
                )
              ],
              directives: [],
              selectionSet: _i1.SelectionSetNode(selections: [
                _i1.FieldNode(
                  name: _i1.NameNode(value: 'id'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                _i1.FieldNode(
                  name: _i1.NameNode(value: 'name'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                _i1.FieldNode(
                  name: _i1.NameNode(value: 'is_default'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
              ]),
            ),
            _i1.FieldNode(
              name: _i1.NameNode(value: 'evolutionchain'),
              alias: _i1.NameNode(value: 'evolutionChain'),
              arguments: [],
              directives: [],
              selectionSet: _i1.SelectionSetNode(selections: [
                _i1.FieldNode(
                  name: _i1.NameNode(value: 'pokemonspecies'),
                  alias: _i1.NameNode(value: 'species'),
                  arguments: [
                    _i1.ArgumentNode(
                      name: _i1.NameNode(value: 'order_by'),
                      value: _i1.ObjectValueNode(fields: [
                        _i1.ObjectFieldNode(
                          name: _i1.NameNode(value: 'id'),
                          value: _i1.EnumValueNode(
                              name: _i1.NameNode(value: 'asc')),
                        )
                      ]),
                    )
                  ],
                  directives: [],
                  selectionSet: _i1.SelectionSetNode(selections: [
                    _i1.FieldNode(
                      name: _i1.NameNode(value: 'id'),
                      alias: null,
                      arguments: [],
                      directives: [],
                      selectionSet: null,
                    ),
                    _i1.FieldNode(
                      name: _i1.NameNode(value: 'name'),
                      alias: null,
                      arguments: [],
                      directives: [],
                      selectionSet: null,
                    ),
                    _i1.FieldNode(
                      name: _i1.NameNode(value: 'evolves_from_species_id'),
                      alias: null,
                      arguments: [],
                      directives: [],
                      selectionSet: null,
                    ),
                    _i1.FieldNode(
                      name: _i1.NameNode(value: 'pokemonevolutions'),
                      alias: _i1.NameNode(value: 'evolutions'),
                      arguments: [
                        _i1.ArgumentNode(
                          name: _i1.NameNode(value: 'order_by'),
                          value: _i1.ObjectValueNode(fields: [
                            _i1.ObjectFieldNode(
                              name: _i1.NameNode(value: 'id'),
                              value: _i1.EnumValueNode(
                                  name: _i1.NameNode(value: 'asc')),
                            )
                          ]),
                        )
                      ],
                      directives: [],
                      selectionSet: _i1.SelectionSetNode(selections: [
                        _i1.FieldNode(
                          name: _i1.NameNode(value: 'min_level'),
                          alias: null,
                          arguments: [],
                          directives: [],
                          selectionSet: null,
                        ),
                        _i1.FieldNode(
                          name: _i1.NameNode(value: 'condition_expression'),
                          alias: null,
                          arguments: [],
                          directives: [],
                          selectionSet: null,
                        ),
                        _i1.FieldNode(
                          name: _i1.NameNode(value: 'evolutiontrigger'),
                          alias: _i1.NameNode(value: 'trigger'),
                          arguments: [],
                          directives: [],
                          selectionSet: _i1.SelectionSetNode(selections: [
                            _i1.FieldNode(
                              name: _i1.NameNode(value: 'name'),
                              alias: null,
                              arguments: [],
                              directives: [],
                              selectionSet: null,
                            )
                          ]),
                        ),
                      ]),
                    ),
                  ]),
                )
              ]),
            ),
          ]),
        ),
        _i1.FieldNode(
          name: _i1.NameNode(value: 'pokemontypes'),
          alias: _i1.NameNode(value: 'types'),
          arguments: [
            _i1.ArgumentNode(
              name: _i1.NameNode(value: 'order_by'),
              value: _i1.ObjectValueNode(fields: [
                _i1.ObjectFieldNode(
                  name: _i1.NameNode(value: 'slot'),
                  value: _i1.EnumValueNode(name: _i1.NameNode(value: 'asc')),
                )
              ]),
            )
          ],
          directives: [],
          selectionSet: _i1.SelectionSetNode(selections: [
            _i1.FieldNode(
              name: _i1.NameNode(value: 'slot'),
              alias: null,
              arguments: [],
              directives: [],
              selectionSet: null,
            ),
            _i1.FieldNode(
              name: _i1.NameNode(value: 'type'),
              alias: null,
              arguments: [],
              directives: [],
              selectionSet: _i1.SelectionSetNode(selections: [
                _i1.FieldNode(
                  name: _i1.NameNode(value: 'id'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                _i1.FieldNode(
                  name: _i1.NameNode(value: 'name'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
              ]),
            ),
          ]),
        ),
        _i1.FieldNode(
          name: _i1.NameNode(value: 'pokemonsprites'),
          alias: _i1.NameNode(value: 'sprites'),
          arguments: [
            _i1.ArgumentNode(
              name: _i1.NameNode(value: 'limit'),
              value: _i1.IntValueNode(value: '1'),
            )
          ],
          directives: [],
          selectionSet: _i1.SelectionSetNode(selections: [
            _i1.FieldNode(
              name: _i1.NameNode(value: 'sprites'),
              alias: _i1.NameNode(value: 'artwork'),
              arguments: [
                _i1.ArgumentNode(
                  name: _i1.NameNode(value: 'path'),
                  value: _i1.StringValueNode(
                    value: 'other.official-artwork.front_default',
                    isBlock: false,
                  ),
                )
              ],
              directives: [],
              selectionSet: null,
            ),
            _i1.FieldNode(
              name: _i1.NameNode(value: 'sprites'),
              alias: _i1.NameNode(value: 'front'),
              arguments: [
                _i1.ArgumentNode(
                  name: _i1.NameNode(value: 'path'),
                  value: _i1.StringValueNode(
                    value: 'front_default',
                    isBlock: false,
                  ),
                )
              ],
              directives: [],
              selectionSet: null,
            ),
            _i1.FieldNode(
              name: _i1.NameNode(value: 'sprites'),
              alias: _i1.NameNode(value: 'shinyArtwork'),
              arguments: [
                _i1.ArgumentNode(
                  name: _i1.NameNode(value: 'path'),
                  value: _i1.StringValueNode(
                    value: 'other.official-artwork.front_shiny',
                    isBlock: false,
                  ),
                )
              ],
              directives: [],
              selectionSet: null,
            ),
            _i1.FieldNode(
              name: _i1.NameNode(value: 'sprites'),
              alias: _i1.NameNode(value: 'shinyFront'),
              arguments: [
                _i1.ArgumentNode(
                  name: _i1.NameNode(value: 'path'),
                  value: _i1.StringValueNode(
                    value: 'front_shiny',
                    isBlock: false,
                  ),
                )
              ],
              directives: [],
              selectionSet: null,
            ),
          ]),
        ),
        _i1.FieldNode(
          name: _i1.NameNode(value: 'pokemonstats'),
          alias: _i1.NameNode(value: 'stats'),
          arguments: [
            _i1.ArgumentNode(
              name: _i1.NameNode(value: 'order_by'),
              value: _i1.ObjectValueNode(fields: [
                _i1.ObjectFieldNode(
                  name: _i1.NameNode(value: 'stat_id'),
                  value: _i1.EnumValueNode(name: _i1.NameNode(value: 'asc')),
                )
              ]),
            )
          ],
          directives: [],
          selectionSet: _i1.SelectionSetNode(selections: [
            _i1.FieldNode(
              name: _i1.NameNode(value: 'base_stat'),
              alias: null,
              arguments: [],
              directives: [],
              selectionSet: null,
            ),
            _i1.FieldNode(
              name: _i1.NameNode(value: 'stat'),
              alias: null,
              arguments: [],
              directives: [],
              selectionSet: _i1.SelectionSetNode(selections: [
                _i1.FieldNode(
                  name: _i1.NameNode(value: 'id'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                _i1.FieldNode(
                  name: _i1.NameNode(value: 'name'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
              ]),
            ),
          ]),
        ),
        _i1.FieldNode(
          name: _i1.NameNode(value: 'pokemonabilities'),
          alias: _i1.NameNode(value: 'abilities'),
          arguments: [
            _i1.ArgumentNode(
              name: _i1.NameNode(value: 'order_by'),
              value: _i1.ObjectValueNode(fields: [
                _i1.ObjectFieldNode(
                  name: _i1.NameNode(value: 'slot'),
                  value: _i1.EnumValueNode(name: _i1.NameNode(value: 'asc')),
                )
              ]),
            )
          ],
          directives: [],
          selectionSet: _i1.SelectionSetNode(selections: [
            _i1.FieldNode(
              name: _i1.NameNode(value: 'slot'),
              alias: null,
              arguments: [],
              directives: [],
              selectionSet: null,
            ),
            _i1.FieldNode(
              name: _i1.NameNode(value: 'is_hidden'),
              alias: null,
              arguments: [],
              directives: [],
              selectionSet: null,
            ),
            _i1.FieldNode(
              name: _i1.NameNode(value: 'ability'),
              alias: null,
              arguments: [],
              directives: [],
              selectionSet: _i1.SelectionSetNode(selections: [
                _i1.FieldNode(
                  name: _i1.NameNode(value: 'id'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                _i1.FieldNode(
                  name: _i1.NameNode(value: 'name'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                _i1.FieldNode(
                  name: _i1.NameNode(value: 'abilityeffecttexts'),
                  alias: _i1.NameNode(value: 'effects'),
                  arguments: [
                    _i1.ArgumentNode(
                      name: _i1.NameNode(value: 'where'),
                      value: _i1.ObjectValueNode(fields: [
                        _i1.ObjectFieldNode(
                          name: _i1.NameNode(value: 'language'),
                          value: _i1.ObjectValueNode(fields: [
                            _i1.ObjectFieldNode(
                              name: _i1.NameNode(value: 'name'),
                              value: _i1.ObjectValueNode(fields: [
                                _i1.ObjectFieldNode(
                                  name: _i1.NameNode(value: '_eq'),
                                  value: _i1.StringValueNode(
                                    value: 'en',
                                    isBlock: false,
                                  ),
                                )
                              ]),
                            )
                          ]),
                        )
                      ]),
                    ),
                    _i1.ArgumentNode(
                      name: _i1.NameNode(value: 'limit'),
                      value: _i1.IntValueNode(value: '1'),
                    ),
                  ],
                  directives: [],
                  selectionSet: _i1.SelectionSetNode(selections: [
                    _i1.FieldNode(
                      name: _i1.NameNode(value: 'effect'),
                      alias: null,
                      arguments: [],
                      directives: [],
                      selectionSet: null,
                    ),
                    _i1.FieldNode(
                      name: _i1.NameNode(value: 'short_effect'),
                      alias: null,
                      arguments: [],
                      directives: [],
                      selectionSet: null,
                    ),
                  ]),
                ),
              ]),
            ),
          ]),
        ),
        _i1.FieldNode(
          name: _i1.NameNode(value: 'pokemonmoves'),
          alias: _i1.NameNode(value: 'moves'),
          arguments: [
            _i1.ArgumentNode(
              name: _i1.NameNode(value: 'where'),
              value: _i1.ObjectValueNode(fields: [
                _i1.ObjectFieldNode(
                  name: _i1.NameNode(value: 'versiongroup'),
                  value: _i1.ObjectValueNode(fields: [
                    _i1.ObjectFieldNode(
                      name: _i1.NameNode(value: 'name'),
                      value: _i1.ObjectValueNode(fields: [
                        _i1.ObjectFieldNode(
                          name: _i1.NameNode(value: '_in'),
                          value: _i1.VariableNode(
                              name: _i1.NameNode(value: 'versionGroups')),
                        )
                      ]),
                    )
                  ]),
                )
              ]),
            ),
            _i1.ArgumentNode(
              name: _i1.NameNode(value: 'order_by'),
              value: _i1.ObjectValueNode(fields: [
                _i1.ObjectFieldNode(
                  name: _i1.NameNode(value: 'version_group_id'),
                  value: _i1.EnumValueNode(name: _i1.NameNode(value: 'asc')),
                ),
                _i1.ObjectFieldNode(
                  name: _i1.NameNode(value: 'move_learn_method_id'),
                  value: _i1.EnumValueNode(name: _i1.NameNode(value: 'asc')),
                ),
                _i1.ObjectFieldNode(
                  name: _i1.NameNode(value: 'level'),
                  value: _i1.EnumValueNode(name: _i1.NameNode(value: 'asc')),
                ),
                _i1.ObjectFieldNode(
                  name: _i1.NameNode(value: 'move_id'),
                  value: _i1.EnumValueNode(name: _i1.NameNode(value: 'asc')),
                ),
              ]),
            ),
          ],
          directives: [],
          selectionSet: _i1.SelectionSetNode(selections: [
            _i1.FieldNode(
              name: _i1.NameNode(value: 'level'),
              alias: null,
              arguments: [],
              directives: [],
              selectionSet: null,
            ),
            _i1.FieldNode(
              name: _i1.NameNode(value: 'move'),
              alias: null,
              arguments: [],
              directives: [],
              selectionSet: _i1.SelectionSetNode(selections: [
                _i1.FieldNode(
                  name: _i1.NameNode(value: 'id'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
                _i1.FieldNode(
                  name: _i1.NameNode(value: 'name'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                ),
              ]),
            ),
            _i1.FieldNode(
              name: _i1.NameNode(value: 'movelearnmethod'),
              alias: _i1.NameNode(value: 'method'),
              arguments: [],
              directives: [],
              selectionSet: _i1.SelectionSetNode(selections: [
                _i1.FieldNode(
                  name: _i1.NameNode(value: 'name'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                )
              ]),
            ),
            _i1.FieldNode(
              name: _i1.NameNode(value: 'versiongroup'),
              alias: _i1.NameNode(value: 'versionGroup'),
              arguments: [],
              directives: [],
              selectionSet: _i1.SelectionSetNode(selections: [
                _i1.FieldNode(
                  name: _i1.NameNode(value: 'name'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null,
                )
              ]),
            ),
          ]),
        ),
      ]),
    ),
    _i1.FieldNode(
      name: _i1.NameNode(value: 'typeefficacy'),
      alias: _i1.NameNode(value: 'typeEfficacies'),
      arguments: [
        _i1.ArgumentNode(
          name: _i1.NameNode(value: 'order_by'),
          value: _i1.ObjectValueNode(fields: [
            _i1.ObjectFieldNode(
              name: _i1.NameNode(value: 'id'),
              value: _i1.EnumValueNode(name: _i1.NameNode(value: 'asc')),
            )
          ]),
        )
      ],
      directives: [],
      selectionSet: _i1.SelectionSetNode(selections: [
        _i1.FieldNode(
          name: _i1.NameNode(value: 'damage_factor'),
          alias: null,
          arguments: [],
          directives: [],
          selectionSet: null,
        ),
        _i1.FieldNode(
          name: _i1.NameNode(value: 'type'),
          alias: _i1.NameNode(value: 'attackingType'),
          arguments: [],
          directives: [],
          selectionSet: _i1.SelectionSetNode(selections: [
            _i1.FieldNode(
              name: _i1.NameNode(value: 'id'),
              alias: null,
              arguments: [],
              directives: [],
              selectionSet: null,
            ),
            _i1.FieldNode(
              name: _i1.NameNode(value: 'name'),
              alias: null,
              arguments: [],
              directives: [],
              selectionSet: null,
            ),
          ]),
        ),
        _i1.FieldNode(
          name: _i1.NameNode(value: 'TypeByTargetTypeId'),
          alias: _i1.NameNode(value: 'defendingType'),
          arguments: [],
          directives: [],
          selectionSet: _i1.SelectionSetNode(selections: [
            _i1.FieldNode(
              name: _i1.NameNode(value: 'id'),
              alias: null,
              arguments: [],
              directives: [],
              selectionSet: null,
            ),
            _i1.FieldNode(
              name: _i1.NameNode(value: 'name'),
              alias: null,
              arguments: [],
              directives: [],
              selectionSet: null,
            ),
          ]),
        ),
      ]),
    ),
  ]),
);
const document = _i1.DocumentNode(definitions: [PokemonDetail]);
