# OF-01 / RNF-RES-01 / OE-02 — Data source remoto GraphQL

## Alcance

Este documento describe la capa remota que consulta el catálogo de Pokémon en
PokeAPI GraphQL y entrega datos listos para el dominio y para Drift.

Referencias:

- **OF-01**: consultar información actualizada mediante GraphQL cuando el
  servicio remoto está disponible.
- **RNF-RES-01**: timeout explícito y documentado en las solicitudes remotas.
- **RNF-RES-05**: manejo diferenciado de pérdida de conectividad, timeout,
  errores GraphQL (incluidas respuestas parciales) y rate limiting.
- **OE-02**: integrar la API GraphQL de PokeAPI con consultas eficientes y
  paginación.

## Endpoint y query

- Endpoint: `https://graphql.pokeapi.co/v1beta2`
- Query: `lib/features/pokemon/data/graphql/pokemon_catalog.graphql`
- Detalle de campos y paginación: `docs/rf-cat-02-catalogo-query.md`

La consulta usa `limit`/`offset`, orden estable `id asc` y el filtro
`is_default: { _eq: true }`.

## Componentes

| Archivo | Responsabilidad |
| --- | --- |
| `lib/core/network/ferry_client_provider.dart` | Construye el `Client` de Ferry con `HttpLink` y `Cache`. |
| `lib/core/network/network_config.dart` | Define el timeout centralizado `graphqlRequestTimeout`. |
| `lib/features/pokemon/data/remote/pokemon_remote_data_source.dart` | Ejecuta la query, aplica timeout y traduce errores a `AppFailure`. |
| `lib/features/pokemon/data/remote/pokemon_remote_data_source_provider.dart` | Inyecta el data source con Riverpod. |
| `lib/features/pokemon/data/dto/pokemon_catalog_dto.dart` | DTOs del catálogo, sin dependencias de dominio ni de Drift. |
| `lib/features/pokemon/data/mappers/pokemon_mapper.dart` | Convierte DTO → entidad de dominio y DTO → filas de Drift. |

## Timeout explícito (RNF-RES-01)

El valor se define una sola vez:

```dart
// lib/core/network/network_config.dart
const Duration graphqlRequestTimeout = Duration(seconds: 15);
```

`PokemonRemoteDataSource` lo aplica con `Stream.timeout` sobre la respuesta de
Ferry. El constructor permite inyectar otro `Duration` únicamente para pruebas.

Justificación del valor:

- 15 segundos cubre redes móviles lentas sin dejar la interfaz esperando de
  forma indefinida.
- Al superarse, la solicitud se cancela y se reporta `TimeoutFailure`, de modo
  que la capa de sincronización puede decidir reintentar o continuar con los
  datos locales.
- La interfaz nunca se bloquea porque la consulta es asíncrona (OF-03).

## Flujo DTO → dominio / Drift

```
Respuesta GraphQL (Ferry)
        │
        ▼
GPokemonCatalogData (generado por Ferry)
        │  PokemonCatalogDto.fromGraphql
        ▼
PokemonCatalogDto / PokemonDto / PokemonTypeDto
        │  PokemonMapper.toEntity
        ├──────────────► Pokemon (dominio)
        │  PokemonMapper.toPokemonTable
        │  PokemonMapper.toTypeTables
        │  PokemonMapper.toPokemonTypeTables
        └──────────────► Companions de Drift
```

Reglas de mapeo:

- `PokemonDto.id` se usa como `Pokemon.id` y como `Pokemon.number` /
  `nationalDexNumber`, porque el filtro `is_default: true` hace que el `id` de
  PokeAPI coincida con el número de la Pokédex Nacional.
- Los tipos se ordenan por `slot` (1 = primario).
- Imagen preferida: `artwork`; si falta o está vacía, se usa `front`.
- Las URLs vacías o con solo espacios se normalizan a `null`.

Los DTOs no se exponen a la capa de presentación: la UI consume entidades de
dominio leídas desde Drift.

## Traducción de errores a fallos de dominio (RNF-RES-05)

| Situación | Origen | Fallo de dominio |
| --- | --- | --- |
| Sin conectividad | `ServerException` con `statusCode == null` | `NetworkFailure` |
| Timeout de la solicitud | `TimeoutException` de `Stream.timeout` | `TimeoutFailure` |
| Timeout envuelto por el link | `ServerException.originalException is TimeoutException` | `TimeoutFailure` |
| Rate limiting por HTTP | `ServerException.statusCode == 429` | `RateLimitFailure` |
| Rate limiting por GraphQL | error con `code` o mensaje de rate limit | `RateLimitFailure` |
| Error GraphQL sin datos | `graphqlErrors` y `data == null` | `GraphqlFailure` |
| Respuesta parcial | `graphqlErrors` y `data != null` | `PartialResponseFailure` |
| Respuesta GraphQL inválida | `ResponseFormatException` | `GraphqlFailure` |
| Solicitud GraphQL inválida | `RequestFormatException` | `GraphqlFailure` |
| Otro error de servidor | `ServerException` con otro status | `GraphqlFailure` |
| Error inesperado | cualquier otra excepción | `UnknownFailure` |
| Parámetros inválidos | `limit <= 0` u `offset < 0` | `ValidationFailure` |

`PartialResponseFailure` extiende `GraphqlFailure` para que el manejo genérico
de errores GraphQL siga funcionando, pero la capa de sincronización pueda
distinguir una respuesta incompleta.

## Política de red

- `FetchPolicy.NetworkOnly`: el data source remoto siempre consulta la API y no
  devuelve datos del caché de Ferry. El offline-first se resuelve con Drift, no
  con el caché en memoria de Ferry.
- La consulta es de solo lectura; no se mutan datos remotos.
- La escritura local y su transacción quedan fuera de este componente.

## Pruebas

- `test/pokemon_mapper_test.dart`: normalización de DTOs, orden de tipos,
  fallback de imágenes, mapeo a entidad y a companions de Drift.
- `test/pokemon_remote_data_source_test.dart`: respuesta válida, timeout,
  HTTP 429, fallo de red, error GraphQL, respuesta parcial, rate limiting por
  mensaje y error de servidor.

Ejecución:

```sh
flutter analyze
flutter test
```
