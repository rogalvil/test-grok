# ROADMAP - test-grok

## Visión General

Construir un RPG 2D minimalista en Godot 4 de forma iterativa, usando un flujo de trabajo disciplinado con issues y ramas.

**Estado actual del proyecto (Mayo 2026):** MVP básico jugable completado. Ver [README.md](../README.md) para instrucciones de uso.

---

## Hitos Principales

### Hito 0 — Fundación
- [x] Repositorio creado en GitHub
- [x] Documentación inicial (README + docs/)
- [x] Proyecto Godot 4 inicializado con estructura recomendada
- [x] Issues de calidad de vida agregados (run script, debug tools, input mapping, export)

**Meta:** Tener todo listo para empezar a desarrollar sin ambigüedades.

---

### Hito 1 — MVP "Personaje en el Mapa" (v0.1)

**Objetivo:** El jugador puede caminar libremente por un mapa con colisiones y cámara que lo sigue.

**Issues principales esperados:**
- Inicializar proyecto Godot + estructura de carpetas
- Crear TileSet y TileMap básico
- Implementar escena del Player + movimiento
- Sistema de colisiones
- Cámara que sigue al jugador
- Pulido y pruebas del MVP

**Criterio de Done:** Ver [docs/SCOPE.md](./SCOPE.md)

**Estado:** Completado (MVP jugable)

**Nota:** El Hito 1 se completó de forma alternativa usando generación procedural del mapa en lugar de un TileSet diseñado manualmente. El objetivo principal (personaje moviéndose en un mapa con colisiones y cámara) se logró.

---

### Hito 2 — "El Mundo se Siente Real" (v0.2) — Futuro

Posibles features (a definir después de terminar Hito 1):
- Múltiples mapas + transiciones
- Primer NPC con diálogo simple
- Sistema básico de interacción
- Guardado de posición del jugador

---

### Hito 3 — Primer Sistema de Juego (v0.3) — Futuro

- Sistema de combate por turnos o acción simple
- Inventario básico
- Progresión mínima

---

## Notas

- Cada hito se divide en issues concretos y priorizados.
- No se empieza un nuevo hito hasta que el anterior esté **completamente terminado y documentado**.
- El roadmap se actualizará después de cada hito completado.

---

**Última actualización:** 20 de mayo de 2026