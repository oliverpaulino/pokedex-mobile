# ADR-002 — GraphQL con Ferry y paginación por `limit`/`offset`

- **Estado:** Aceptada
- **Fecha:** 2026-11-20
- **Responsables:** Samuel Olivo, Oliver Paulino

## Contexto

PokeAPI expone un endpoint GraphQL con unos 1025 Pokémon en el catálogo principal. El proyecto necesita traer solo los campos visibles, paginar (RF-CAT-02), tener un timeout claro (RNF-RES-01) y distinguir fallos de red, timeout, GraphQL y límite de tasa (RNF-RES-05).

## Decisión

Usar **Ferry** con la query generada desde `lib/features/pokemon/data/graphql/pokemon_catalog.graphql`:

```graphql
pokemon(
  limit: $limit
  offset: $offset
  where: { is_default: { _eq: true } }
  order_by: { id: asc }
)
```

- Paginación por `limit = 20` y `offset = n * 20`, con `pokemon_aggregate` para conocer el total.
- `FetchPolicy.NetworkOnly`: la fuente remota siempre consulta la API; el offline-first se resuelve con Drift, no con la caché de Ferry.
- La respuesta se convierte en DTOs y luego en entidades de dominio / filas de Drift mediante `PokemonMapper`. Los DTOs no llegan a la UI.
- Timeout centralizado de **15 s** (`graphqlRequestTimeout`) aplicado en `PokemonRemoteDataSource`.
- Los errores de infraestructura se traducen a fallos del dominio: `NetworkFailure`, `TimeoutFailure`, `RateLimitFailure`, `GraphqlFailure`, `PartialResponseFailure` y `UnknownFailure`.

## Alternativas consideradas

1. **API REST de PokeAPI:** más peticiones y muchos campos sin uso; GraphQL permite pedir exactamente id, nombre, tipos, imágenes y total.
2. **Paginación por cursor/keyset (`id > último id`):** más resistente a inserciones, pero el catálogo es casi estático y la API ya ofrece `limit`/`offset`; además el enunciado pide documentar esa estrategia.
3. **Usar la caché de Ferry como fuente de lectura:** responde rápido, pero no es una base consultable ni guarda datos del usuario.

## Consecuencias

- **Positivo:** consulta pequeña, orden estable y paginación fácil de explicar; errores claros para reintentos y para el indicador.
- **Negativo:** si el catálogo cambiara mientras se recorren las páginas podrían repetirse elementos; se compensa con el upsert de la [ADR-003](ADR-003-sincronizacion-offline-first.md).
- **Generación de código:** requiere `dart run build_runner build --delete-conflicting-outputs` tras cambiar la query o el esquema.
