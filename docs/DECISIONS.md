# Registro de Decisiones Técnicas (ADR)

Este documento registra las decisiones importantes tomadas durante el desarrollo del proyecto.

---

## ADR-001: Motor de Juego - Godot 4 + GDScript

**Fecha:** 2026-05-20  
**Estado:** Aceptada

### Contexto
Se necesita elegir un stack tecnológico para construir un RPG 2D básico empezando por un MVP de "personaje moviéndose en un mapa".

### Opciones evaluadas

| Opción | Ventajas | Desventajas | Decisión |
|--------|----------|-------------|----------|
| Godot 4 + GDScript | Rápido prototipado, excelente TileMap, editor integrado, fácil de aprender, exportación multiplataforma | Curva de aprendizaje del editor | **Elegida** |
| Python + Pygame | Control total, sin dependencias de motor, Python nativo | Mucho trabajo manual (tilemaps, colisiones, cámara, animaciones) | Rechazada para MVP |
| JavaScript + Canvas / Phaser | Corre en browser, sin instalación | Peor experiencia de desarrollo de mapas 2D | Rechazada |

### Decisión
Se utiliza **Godot 4 + GDScript** para el desarrollo del MVP.

### Consecuencias
- Se reduce drásticamente el tiempo hasta tener algo jugable.
- El proyecto dependerá del editor de Godot (no es "código puro").
- Futuras expansiones (combate, inventario, etc.) serán más fáciles gracias a las herramientas del motor.

---

## ADR-002: Alcance del primer hito (MVP v0.1)

**Fecha:** 2026-05-20  
**Estado:** Aceptada

### Decisión
El primer hito entregable se limita estrictamente a:

- Un solo mapa
- Un solo personaje controlable
- Movimiento + colisiones + cámara básica

Cualquier sistema adicional (combate, inventario, NPCs, guardado, etc.) queda **explícitamente fuera** del primer hito.

### Razones
- Reducir el riesgo de "scope creep".
- Permitir validar el flujo de trabajo con IA (Grok) en un ciclo corto y exitoso.
- Llegar a un estado "jugable" lo antes posible.

---

## ADR-003: Flujo de trabajo con Issues y Ramas

**Fecha:** 2026-05-20  
**Estado:** Aceptada

### Decisión
Se sigue estrictamente el proceso definido por `rav ai-setup`:

- Cada unidad de trabajo debe tener un issue de GitHub.
- Cada issue se desarrolla en una rama separada (`issue-<número>-<slug>`).
- No se escribe código de producción sin issue asociado.
- Los PRs deben ser pequeños.

### Consecuencias
- Mayor overhead administrativo al principio.
- Mejor trazabilidad y documentación del progreso.
- Más fácil para que una IA participe de forma ordenada.

---

**Formato de los ADRs:**
- Número secuencial (ADR-XXX)
- Fecha
- Estado (Propuesta / Aceptada / Rechazada / Deprecated)
- Contexto + Opciones + Decisión + Consecuencias

Se recomienda agregar un nuevo ADR cada vez que se tome una decisión técnica importante.