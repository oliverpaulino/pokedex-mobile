# Carga inicial simple del catálogo

## Alcance

Describe la carga inicial del catálogo de Pokémon desde PokeAPI GraphQL hacia
SQLite (Drift), su estado persistido y el comportamiento ante fallos.

## Decisiones

- **Siempre reinicia desde 0**: cada ejecución de carga comienza en `offset = 0`.
- **Sin reanudación por offset**: no se guarda progreso de páginas; si se
  interrumpe o falla, la siguiente carga vuelve a recorrer el catálogo desde el
  inicio.
- **Idempotente por upsert**: el repositorio local guarda con `insertOnConflictUpdate`
  y reconstruye relaciones, por lo que volver a descargar no duplica Pokémon ni
  tipos.
- **Timeout de red**: cada solicitud remota usa el timeout del data source
  remoto (15 s, `graphqlRequestTimeout`).
- **Reintentos acotados**: fallos transitorios (`NetworkFailure`,
  `TimeoutFailure`, `RateLimitFailure`) se reintentan hasta 3 intentos con
  backoff exponencial (desde 1 s) dentro de la misma página; otros fallos no se
  reintentan.
- **Sin bloqueo de UI**: la carga corre de forma asíncrona y no lanza errores a
  la interfaz; los fallos se reflejan en el estado persistido.

## Estados (`CatalogLoadStatus`)

Persistidos en `sync_metadata` (`resourceKey = pokemon_catalog`):

| Estado | Significado |
| --- | --- |
| `pending` | Sin carga completada registrada (estado inicial). |
| `running` | Carga en curso. |
| `success` | Carga completa finalizada correctamente. |
| `failed` | La carga terminó con error. |

Al pasar a `success` se registra `lastSuccessAt`; en `running`/`failed` se
conserva el `lastSuccessAt` previo.

## Componentes

| Archivo | Responsabilidad |
| --- | --- |
| `lib/features/pokemon/domain/catalog_load.dart` | `CatalogLoadStatus` y `CatalogLoadInfo` (estado + `lastSuccessAt`). |
| `lib/features/pokemon/data/catalog_load_store.dart` | Lectura/escritura reactiva del estado en `sync_metadata` (Drift), sin cursor/offset. |
| `lib/features/pokemon/data/catalog_loader.dart` | Carga paginada (20 por página) desde 0 hasta `totalCount`, single-flight, reintentos, upsert y actualización de estado. |
| `lib/features/pokemon/data/remote/pokemon_remote_data_source.dart` | Consulta GraphQL con timeout explícito y traducción a `AppFailure`. |
| `lib/features/pokemon/data/pokemon_local_repository.dart` | Guardado transaccional e idempotente en SQLite. |

## Flujo

1. `markRunning()`.
2. `offset = 0`; solicitar páginas de 20 elementos hasta cubrir `totalCount`.
3. Mapear cada página y guardar con `savePokemon(...)` (upsert).
4. Si se completa: `markSuccess(now)`.
5. Si ocurre `AppFailure` (o error inesperado): `markFailed()` y no propagar a la UI.

Casos especiales:
- Página vacía con `totalCount <= offset` (o catálogo vacío): se considera fin correcto → `success`.
- Página vacía con `totalCount > offset`: respuesta inconsistente → `failed`.
- Llamadas concurrentes a `load()`: comparten la misma operación en curso (single-flight).

## Referencias

- Query y paginación remota: `docs/rf-cat-02-catalogo-query.md`
- Data source remoto y timeout: `docs/of-01-remote-data-source.md`
