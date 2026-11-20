# ADR-004 — Indicador de conectividad con health check real

- **Estado:** Aceptada
- **Fecha:** 2026-11-20
- **Responsables:** Samuel Olivo, Oliver Paulino

## Contexto

El indicador global debe distinguir «sin Internet» de «hay red pero la API no responde» (IND-02, IND-05). También debe separar conexión de sincronización: estar online no significa que los datos estén actualizados.

## Decisión

- `ConnectionChecker.check()` ejecuta una consulta real a la API: `fetchCatalog(limit: 1, offset: 0)` con timeout de **5 s**.
- Traducción del resultado:
  - éxito → `online`;
  - `NetworkFailure` → `offline`;
  - timeout, error GraphQL, rate limit u otro fallo → `serviceUnavailable`.
- `connectionStatusProvider` emite `checking`, hace una comprobación al iniciarse y repite cada **30 s** con `Timer.periodic`.
- `IndicadorConectividad` compone dos dimensiones:
  - si la carga está `running`, muestra **Sincronizando**;
  - si no, muestra **Online**, **Offline**, **Servicio no disponible** o **Verificando conexión**.
- Siempre combina icono + texto + `Semantics`, y en una segunda línea muestra `SQLite · Última sync: ...`.

## Alternativas consideradas

1. **`connectivity_plus` / monitor del SO:** dice si hay Wi-Fi o datos móviles, pero no si GraphQL responde; puede marcar «online» falsamente.
2. **Hacer ping al host:** el servidor puede responder aunque la API falle.
3. **Mostrar solo el estado de sincronización:** no distingue offline de «servicio no disponible».
4. **Comprobar solo al abrir la pantalla:** el indicador quedaría desactualizado.

## Consecuencias

- **Positivo:** el indicador refleja la disponibilidad real del servicio, no solo la presencia de red; el usuario puede seguir navegando mientras sincroniza.
- **Negativo:** genera una petición pequeña cada 30 s y puede tardar hasta ese intervalo en reflejar un cambio breve de conectividad.
- **Relación con la sincronización:** conexión y sincronización son independientes. El estado `running` se lee de `sync_metadata` (ver [ADR-003](ADR-003-sincronizacion-offline-first.md)), no del health check.
