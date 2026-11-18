# Pokédex (Flutter)

Aplicación Flutter de catálogo Pokémon con enfoque offline-first: consulta el
catálogo desde la API GraphQL de PokeAPI, lo persiste en SQLite (Drift) y lo
presenta desde la base local.

## Arquitectura por capas

El proyecto se organiza por *features* y capas dentro de cada feature:

- **Presentación** (`lib/features/**/presentation/`, `lib/core/widgets/`)
  - UI y estado de pantalla (p. ej. `CatalogoPantalla`, providers de vista).
  - Indicador de conexión/sincronización (`IndicadorConectividad`).
- **Dominio** (`lib/features/**/domain/`, `lib/core/*` cuando aplica)
  - Entidades y contratos: `Pokemon`, `PokemonRepository`, `CatalogLoadInfo/Status`,
    `AppFailure` y sus variantes.
  - Sin dependencias de Flutter/UI ni de detalles de infraestructura.
- **Datos** (`lib/features/**/data/`)
  - Implementaciones y adaptadores: data source remoto GraphQL (Ferry),
    DTOs/mappers, repositorio local (Drift), cargador del catálogo y store de estado.
- **Infraestructura/core y composición** (`lib/core/`, `lib/app/`)
  - Base de datos y tablas Drift, configuración/cliente de red, providers de
    inyección/composición (`ProviderScope`/Riverpod) y punto de entrada (`main.dart`).

Flujo principal: `UI → providers → loader/repositorio → (remote data source / SQLite)`.

## Dependencias justificadas

Definidas en `pubspec.yaml`:

| Dependencia | Rol |
| --- | --- |
| `flutter_riverpod` | Gestión de estado e inyección de dependencias (providers, streams reactivos). |
| `drift`, `drift_flutter`, `path_provider`, `path` | Persistencia local SQLite tipada y reactiva (`watch`), esquema/migraciones. |
| `ferry`, `ferry_flutter`, `gql_http_link` | Cliente GraphQL tipado para consultar PokeAPI y mapear respuestas generadas. |
| `go_router` | Enrutamiento declarativo (base para navegación de la app). |
| `cached_network_image` | Carga y caché de imágenes de Pokémon. |
| `flutter_localizations` | Soporte de localización de Flutter. |
| Dev: `drift_dev`, `ferry_generator`, `build_runner`, `gql_exec`, `flutter_lints`, `flutter_test` | Generación de código (Drift/Ferry) y calidad/pruebas. |

## Timeout

- **Timeout de red explícito:** `15 s` (`graphqlRequestTimeout`).
  - Definición: `lib/core/network/network_config.dart`.
  - Aplicación: `lib/features/pokemon/data/remote/pokemon_remote_data_source.dart`
    (`.timeout(timeout)` en cada solicitud del catálogo).
- **Health check de conectividad:** `5 s` al consultar `fetchCatalog(limit: 1, offset: 0)`
  (`lib/features/pokemon/data/connection_checker.dart`).

## Estrategia de carga

- Carga paginada del catálogo desde `offset = 0` (páginas de 20) hasta cubrir
  `totalCount`, **siempre reiniciando** (sin reanudación por offset) y guardando
  con **upsert** idempotente en SQLite.
- Estados persistidos: `pending`, `running`, `success`, `failed` con `lastSuccessAt`.
- Operación single-flight, sin bloquear la UI; reintentos acotados para fallos
  transitorios de página.
- Detalle: `docs/carga-inicial-simple.md` y `docs/rf-cat-02-catalogo-query.md`.

## ADR breve — Carga e indicador simples

- **Contexto:** se requería carga inicial y señalización de conectividad/sync con
  menor complejidad y sin dependencia de estado de red del sistema.
- **Decisión:**
  - Eliminar reanudación por cursor/offset y plugins de conectividad; la carga
    reinicia desde 0 y es idempotente por upsert.
  - Inferir disponibilidad mediante health check real a la API (5 s, periódico 30 s)
    en lugar de `connectivity_plus`/monitor del SO.
  - Persistir un estado mínimo (`pending/running/success/failed`, `lastSuccessAt`)
    y presentar 4 estados de indicador separando conexión y sincronización.
- **Consecuencias:** implementación más simple y predecible, a costa de volver a
  recorrer páginas ya descargadas en reintentos completos; el consumo de red se
  compensa por idempotencia local y paginación acotada.

## Documentación

- `docs/carga-inicial-simple.md` — estrategia de carga y estados.
- `docs/indicador-simple.md` — indicador y health check.
- `docs/of-01-remote-data-source.md` — data source remoto y timeout.
- `docs/rf-cat-02-catalogo-query.md` — query y paginación GraphQL.

## Desarrollo

```sh
flutter pub get
dart run build_runner build --delete-conflicting-outputs
flutter analyze
flutter test
```
