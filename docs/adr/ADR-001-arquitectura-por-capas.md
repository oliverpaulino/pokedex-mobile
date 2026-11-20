# ADR-001 — Arquitectura por capas y fuente de verdad local

- **Estado:** Aceptada
- **Fecha:** 2026-11-20
- **Responsables:** Samuel Olivo, Oliver Paulino

## Contexto

El avance exige que la app abra de inmediato, permita navegar mientras se descarga el catálogo y siga funcionando sin Internet. Si los widgets llamaran a GraphQL directamente, al perder la red se perdería también la pantalla, y además sería difícil probar la interfaz.

## Decisión

Organizar el código por funcionalidades (`features/pokemon`, `favorites`, `trivia`, `settings`) con tres capas internas:

- **`presentation/`**: pantallas, widgets y estado de vista con Riverpod.
- **`domain/`**: entidades (`Pokemon`), contratos (`PokemonRepository`), estados de carga y fallos. No importa Flutter, Ferry ni Drift.
- **`data/`**: repositorios, data sources, DTOs, mappers, Drift y sincronización.

La interfaz **no consume respuestas GraphQL**: observa la base local a través de `PokemonRepository` y `catalogoStreamProvider`. PokeAPI solo alimenta esa base. Los datos del usuario (favoritos, trivia y preferencias) están en tablas separadas y no se sobrescriben al sincronizar el catálogo.

`lib/core/` se usa solo para infraestructura compartida (base de datos, red e indicador), no para lógica de una funcionalidad concreta.

## Alternativas consideradas

1. **UI → GraphQL directo:** menos archivos, pero rompe el funcionamiento offline y acopla los widgets a Ferry.
2. **Caché HTTP de respuestas:** sirve para repetir la misma consulta, pero no permite buscar, filtrar ni ordenar datos locales, y no cubre favoritos.
3. **Todo en una sola capa:** rápido al inicio, pero difícil de mantener y de probar.

## Consecuencias

- **Positivo:** el catálogo se ve offline y después de reiniciar; el dominio es independiente y las pruebas son sencillas; un cambio en la API no obliga a cambiar widgets.
- **Negativo:** hay más archivos y mapeados (DTO → entidad → tablas Drift).
- **Verificación:** `catalogo_pantalla.dart` solo observa `catalogoStateProvider`, que a su vez observa el repositorio local.
