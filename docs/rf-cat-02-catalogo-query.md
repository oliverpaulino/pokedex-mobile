# RF-CAT-02 / OE-02 — Query del catálogo de Pokémon

## Endpoint

- GraphQL: `https://graphql.pokeapi.co/v1beta2`
- Consola: `https://graphql.pokeapi.co/v1beta2/console`
- Schema local: `lib/graphql/schema.graphql`
- Query: `lib/features/pokemon/data/graphql/pokemon_catalog.graphql`

## Query definida

```graphql
query PokemonCatalog($limit: Int!, $offset: Int!) {
  pokemon(
    limit: $limit
    offset: $offset
    where: { is_default: { _eq: true } }
    order_by: { id: asc }
  ) {
    id
    name
    pokemontypes(order_by: { slot: asc }) {
      slot
      type {
        id
        name
      }
    }
    pokemonsprites(limit: 1) {
      artwork: sprites(path: "other.official-artwork.front_default")
      front: sprites(path: "front_default")
    }
  }
  pokemon_aggregate(where: { is_default: { _eq: true } }) {
    aggregate {
      count
    }
  }
}
```

## Campos mínimos cubiertos

| Dato | Campo GraphQL | Uso |
| --- | --- | --- |
| Identificador | `pokemon.id` | Clave estable para listas, navegación y caché local. |
| Nombre | `pokemon.name` | Texto principal de la tarjeta/fila. |
| Tipos | `pokemontypes { type { id name } }` | Chips/badges de tipo, ordenados por `slot`. |
| Sprite | `pokemonsprites.sprites(path: "front_default")` | Imagen ligera para listas. |
| Artwork | `pokemonsprites.sprites(path: "other.official-artwork.front_default")` | Imagen de mayor calidad para detalle o tarjetas grandes. |
| Total | `pokemon_aggregate.aggregate.count` | Saber cuántos elementos existen y si hay más páginas. |

### Notas de campos

- `sprites` es un escalar `jsonb`; se consulta con `path` para extraer solo las URLs necesarias.
- En Ferry, `artwork` y `front` se generan como `Gjsonb`; la URL se obtiene con `.value`.
- Se piden `artwork` y `front` en la misma fila de `pokemonsprites` para poder aplicar fallback en el cliente:
  1. `artwork`, si existe.
  2. `front`, si no hay artwork.
  3. Placeholder local, si no hay ninguna.
- `pokemonsprites(limit: 1)` evita traer filas duplicadas si el backend devuelve más de una.
- `pokemontypes(order_by: { slot: asc })` conserva el orden oficial de los tipos (tipo primario primero).

## Filtro del catálogo

Se filtra por `is_default: { _eq: true }`:

- Excluye formas alternativas (Mega, regionales, Deoxys, etc.) de la lista principal.
- El total estable observado es **1025 Pokémon por defecto**.
- Si en el futuro se necesita un catálogo de formas, se debe crear una query distinta o quitar el filtro.

## Estrategia de paginación

### Decisión: paginación por `limit` / `offset`

- `limit`: tamaño de página. **Valor recomendado: 20**.
- `offset`: cantidad de elementos ya cargados. Para la página `n` (base 0):
  - `offset = n * limit`
- Orden estable: `order_by: { id: asc }`.
  - `id` es único e inmutable, por lo que no hay empates ni reordenamientos entre páginas.
- El cliente sabe si hay más páginas comparando:
  - `offset + pokemon.length < pokemon_aggregate.aggregate.count`

### Flujo recomendado en el cliente

1. Primera carga: `limit = 20`, `offset = 0`.
2. Al llegar al final de la lista o hacer scroll:
   - `offset = offset + limit`
   - volver a ejecutar la misma query.
3. Detener las cargas cuando:
   - `offset + pokemon.length >= count`, o
   - la respuesta trae menos elementos que `limit`.

### Por qué `limit` / `offset`

- La API de PokeAPI expone directamente `limit` y `offset` en la raíz `pokemon`.
- El catálogo es prácticamente estático; el riesgo de desplazamiento por inserciones es bajo.
- Es más simple de implementar y de cachear que una paginación por cursor.
- El orden por `id` evita duplicados o saltos causados por un orden no determinista.

### Alternativa considerada: keyset/cursor por `id`

También sería posible usar:

```graphql
pokemon(
  limit: 20
  where: { id: { _gt: $lastId }, is_default: { _eq: true } }
  order_by: { id: asc }
) { ... }
```

Se descarta por ahora porque el requisito pide `limit`/`offset` y porque el catálogo no cambia con frecuencia. Si en el futuro se agregan datos mutables o se detectan duplicados, se puede migrar a keyset sin cambiar los campos seleccionados.

## Ejemplo de variables

```json
{
  "limit": 20,
  "offset": 0
}
```

## Ejemplo de respuesta resumida

```json
{
  "data": {
    "pokemon": [
      {
        "id": 1,
        "name": "bulbasaur",
        "pokemontypes": [
          { "slot": 1, "type": { "id": 12, "name": "grass" } },
          { "slot": 2, "type": { "id": 4, "name": "poison" } }
        ],
        "pokemonsprites": [
          {
            "artwork": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/1.png",
            "front": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/1.png"
          }
        ]
      }
    ],
    "pokemon_aggregate": {
      "aggregate": {
        "count": 1025
      }
    }
  }
}
```

## Verificación realizada

- Consulta probada contra `https://graphql.pokeapi.co/v1beta2` con `limit = 20`, `offset = 0`.
- Verificado que devuelve `id`, `name`, tipos ordenados y ambas URLs de imagen.
- Verificado `offset = 1025` con el filtro por defecto: devuelve una lista vacía, confirmando el límite del catálogo.
- Verificado el total con `pokemon_aggregate`: `1025`.
