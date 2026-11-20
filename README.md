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

## Estrategia de sincronización (offline-first)

- Carga paginada del catálogo desde `offset = 0` (páginas de 20) hasta cubrir
  `totalCount`, **siempre reiniciando** (sin reanudación por offset) y guardando
  con **upsert** idempotente en SQLite.
- Estados persistidos: `pending`, `running`, `success`, `failed` con `lastSuccessAt`.
- Operación single-flight, sin bloquear la UI; reintentos acotados para fallos
  transitorios de página.
- Detalle: [ADR-002](docs/adr/ADR-002-graphql-paginacion.md) y
  [ADR-003](docs/adr/ADR-003-sincronizacion-offline-first.md).

## Decisiones arquitectónicas (ADR)

Cada ADR explica el contexto, la decisión, las alternativas consideradas y las
consecuencias de forma breve:

| ADR | Decisión |
| --- | --- |
| [ADR-001](docs/adr/ADR-001-arquitectura-por-capas.md) | Capas por funcionalidad y base local como fuente de verdad de la interfaz. |
| [ADR-002](docs/adr/ADR-002-graphql-paginacion.md) | GraphQL con Ferry, paginación `limit`/`offset`, timeout y errores traducidos. |
| [ADR-003](docs/adr/ADR-003-sincronizacion-offline-first.md) | Carga simple: reinicia en `offset = 0`, guarda con upsert y reintenta con backoff. |
| [ADR-004](docs/adr/ADR-004-indicador-conectividad.md) | Indicador con health check real a la API, sin plugin de red del sistema. |

## Limitaciones conocidas del avance

- La carga siempre reinicia desde `offset = 0`; no hay reanudación por cursor (ADR-003).
- La reconexión se resuelve con el botón **Reintentar**; el disparo automático queda para la entrega final (ADR-003).
- El health check corre cada 30 s, por lo que puede haber un breve retardo en el indicador (ADR-004).

## Historial de commits

El repositorio conserva el desarrollo incremental (`git log --all --graph --oneline`)
y los pull requests `#1`–`#12`. Contribuciones verificables con
`git shortlog -sne --all`:

| Integrante | Commits | Aportes representativos |
| --- | ---: | --- |
| Samuel Olivo | 23 | `075c2b0` estructura Clean Arch; `cf12441` cliente Ferry; `173a755` query GraphQL; `55d8d02` data source + timeout; `402b2e9` simplificación de sincronización; `9aa466c` pruebas y documentación. |
| Oliver Paulino (`oliverjpaulinop`, `Oliver Paulino Perez`) | 31 | `77586e5` inicialización; `f1dd071` base local; `a4bd1f3` repositorio con upsert; `fc52c23` UI del catálogo; `27e90cb` imágenes offline; `5b0b1ee` tablas locales; `8b389da` merge final. |

## Desarrollo

```sh
flutter pub get
dart run build_runner build --delete-conflicting-outputs
flutter analyze
flutter test
```
