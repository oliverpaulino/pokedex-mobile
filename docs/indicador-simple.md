# Indicador de conexión y sincronización (simple)

## Alcance

Indicador global que muestra el estado de conectividad del servicio y de la
carga del catálogo, sin depender de plugins de red del sistema.

## Estados presentados

La UI presenta 4 estados principales:

| Estado | Condición |
| --- | --- |
| **Sincronizando** | La carga del catálogo está en curso (`CatalogLoadStatus.running`). Se muestra como capa principal sobre la conexión, manteniendo separadas las dimensiones de conectividad y sincronización. |
| **Online** | La carga no está en curso y el health check responde correctamente. |
| **Offline** | La carga no está en curso y hay fallo de red (`NetworkFailure`). |
| **Servicio no disponible** | La carga no está en curso y el servicio falla por timeout, error GraphQL, rate limit u otro error. |

Estado transitorio: **Verificando conexión** (`checking`) mientras se realiza la
comprobación.

## Health check (sin plugin de red)

- Implementación: `lib/features/pokemon/data/connection_checker.dart`.
- Comprobación: `remoteDataSource.fetchCatalog(limit: 1, offset: 0)` con
  **timeout de 5 s**.
- Traducción:
  - éxito → `online`
  - `NetworkFailure` → `offline`
  - `TimeoutFailure`, `GraphqlFailure`, `RateLimitFailure`, otros → `serviceUnavailable`
- Sin `connectivity_plus`, sin monitor de red del SO, sin combinación compleja
  de señales: la disponibilidad se infiere del resultado real contra la API.

## Actualización periódica

- `connectionStatusProvider` (`StreamProvider`) emite `checking`, realiza un
  chequeo inmediato y luego repite cada **30 s** con `Timer.periodic`.
- El timer se cancela al disponer el provider.

## Componentes

| Archivo | Responsabilidad |
| --- | --- |
| `lib/features/pokemon/data/connection_checker.dart` | `ConnectionStatus` y health check de 5 s. |
| `lib/features/pokemon/domain/catalog_load.dart` | Estado de carga (`CatalogLoadStatus/Info`). |
| `lib/features/pokemon/data/catalog_load_store.dart` | Estado persistido/reactivo de la carga y `lastSuccessAt`. |
| `lib/app/providers.dart` | `connectionStatusProvider`, `catalogLoadStatusProvider`, `catalogLoaderProvider`. |
| `lib/core/widgets/indicador_conectividad.dart` | UI: texto, icono, semántica, última sync y reintento. |

## UI

- Texto + icono + `Semantics`.
- Segunda línea: `SQLite · Última sync: dd/mm/aaaa hh:mm` (o marcador si no hay).
- Botón **Reintentar** solo cuando el estado de carga es `failed`; invoca
  `catalogLoaderProvider.load()`.
