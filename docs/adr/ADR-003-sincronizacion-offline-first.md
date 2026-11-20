# ADR-003 — Sincronización offline-first: reinicio desde 0 con upsert

- **Estado:** Aceptada
- **Fecha:** 2026-11-20
- **Responsables:** Samuel Olivo, Oliver Paulino

## Contexto

La primera ejecución y la reconexión deben llenar la base local sin bloquear la UI, sin duplicar registros y sin borrar datos válidos. El avance exige que el catálogo siga disponible después de reiniciar la app sin conexión.

## Decisión

- La carga se dispara al abrir el catálogo (`CatalogoPantalla.initState`) y desde el botón **Reintentar** del indicador. Corre en segundo plano; la interfaz sigue observando la base local.
- `CatalogLoader.load()` es **single-flight**: si ya hay una carga en curso, las llamadas posteriores comparten esa misma operación (`_activeLoad`).
- Cada carga **empieza en `offset = 0`** y pide páginas de 20 hasta cubrir `totalCount`. No se guarda progreso de página: la columna `cursor_or_offset` existe en `sync_metadata` por el modelo conceptual, pero esta decisión no la usa.
- Cada página se guarda con `repository.savePokemon(...)`: validación, transacción Drift, `insertOnConflictUpdate` por `id` y recreación de las relaciones de tipos. Repetir la carga no duplica Pokémon ni tipos.
- Reintentos acotados: hasta **3 intentos** solo para `NetworkFailure`, `TimeoutFailure` y `RateLimitFailure`, con backoff de **1 s → 2 s → 4 s**.
- El estado se persiste en `sync_metadata` con clave `pokemon_catalog`: `pending`, `running`, `success` o `failed`, más `lastSuccessAt`. Los fallos no se lanzan a la UI; se reflejan en ese estado.
- La sincronización escribe solo tablas del catálogo. `favorite`, `trivia_result`, `trivia_answer` y `app_setting` no se tocan.

## Alternativas consideradas

1. **Reanudar desde el último offset:** ahorra red, pero requiere gestionar consistencia del cursor y recuperación tras interrupciones; más complejo para este avance.
2. **Borrar y volver a insertar todo:** simple, pero deja ventanas con datos vacíos y pierde `updated_at`.
3. **Descargar el catálogo completo de una vez:** menos llamadas, pero más memoria y sin progreso visible.
4. **Sin reintentos:** un fallo de red momentáneo dejaría la carga en `failed` sin recuperación.

## Consecuencias

- **Positivo:** implementación predecible e idempotente; la UI ve datos progresivamente; una interrupción no deja registros duplicados ni parciales visibles.
- **Negativo:** cada carga completa vuelve a recorrer páginas ya descargadas. El coste se compensa con paginación acotada y upsert local.
- **Estado actual del avance:** el disparo automático al recuperar la conectividad queda para la entrega final; hoy la recuperación manual se hace con **Reintentar**.
