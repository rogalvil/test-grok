# test-grok

**RPG básico en Godot 4** — Experimento de desarrollo con Grok.

Objetivo principal: Construir un RPG minimalista paso a paso, empezando por un MVP muy acotado: **un personaje que pueda moverse libremente por un mapa con colisiones**.

Este repositorio sirve como laboratorio para probar flujo de trabajo con IA (Grok) siguiendo reglas estrictas de planificación, issues y ramas.

---

## Stack Tecnológico

| Componente       | Tecnología          | Justificación |
|------------------|---------------------|-------------|
| Motor de juego   | **Godot 4**         | Mejor relación velocidad de prototipado / calidad para un MVP de RPG 2D. Excelente soporte de TileMap, input, cámara y exportación. |
| Lenguaje         | **GDScript**        | Sintaxis similar a Python, fácil de leer y mantener. Suficiente para todo el MVP. |
| Editor de mapas  | Godot TileMap       | Integrado, potente y rápido de iterar. |
| Control de versiones | Git + GitHub     | Flujo por issues y ramas (ver más abajo). |

**Por qué no Pygame / Canvas puro para el MVP:**
- Godot reduce drásticamente el tiempo para tener algo jugable (tilemap + movimiento + colisiones + cámara en horas en vez de días).
- Una vez que tengamos el MVP, es muy fácil agregar sistemas más complejos (inventario, combate, diálogos, etc.).

---

## Alcance del MVP (v0.1)

### Incluido en el MVP

- Ventana de juego con resolución base definida
- Un mapa simple (mínimo 3 tipos de tiles: suelo, pared, decoración)
- Un personaje controlable (sprite + animaciones básicas de caminar)
- Movimiento en 4 direcciones (WASD / Flechas)
- Colisiones reales con paredes y objetos del mapa
- Cámara que sigue al personaje
- Posibilidad de "explorar" el mapa caminando

### Excluido explícitamente del MVP

- Sistema de combate
- Inventario / items
- NPCs con diálogo
- Guardado de partida
- Menú principal / pausa complejo
- Múltiples mapas o transiciones
- Animaciones avanzadas o efectos visuales
- Sonido / música

**Criterio de "Done" del MVP:**
> El jugador puede caminar libremente por un mapa de al menos 30x20 tiles sin atravesar paredes, con cámara que lo sigue correctamente.

---

## Fases de Desarrollo

1. **Fase 0** — Setup del proyecto y estructura base
2. **Fase 1** — Mapa + Tiles + Personaje + Movimiento básico
3. **Fase 2** — Colisiones y sistema de cámara
4. **Fase 3** — Pulido del MVP + definición del siguiente hito

Cada fase se desglosa en issues concretos.

---

## Proceso de Desarrollo (Obligatorio)

Este proyecto sigue las reglas definidas en `rav ai-setup`:

- **Planificación obligatoria** antes de cualquier trabajo no trivial.
- Todo el trabajo se desglosa en **issues de GitHub**.
- Cada issue se desarrolla en su propia rama: `issue-<número>-<slug-corto>`
- No se empieza a codear sin que el issue esté creado y confirmado.
- Los Pull Requests deben ser pequeños y enfocados.
- Commits en formato Conventional Commits.

---

## Cómo abrir y correr el proyecto

1. Instalar [Godot 4.3+](https://godotengine.org/download)
2. Clonar el repositorio
3. Abrir la carpeta raíz con Godot (`Project > Open Project`)
4. Presionar "Play" (F5)

---

## Estado Actual

- [x] Repositorio creado
- [x] Documentación inicial completa
- [x] Proyecto Godot 4 inicializado con estructura recomendada
- [x] **MVP jugable**: Personaje puede caminar por un mapa generado con colisiones y cámara que lo sigue

**Cómo jugar el MVP actual:**
- Abrir en Godot 4.3+
- Presionar Play (F5)
- Usar WASD o Flechas para moverte
- Explora el mapa generado (60x40 tiles con paredes y decoración)

---

## Documentación Adicional

- [docs/SCOPE.md](./docs/SCOPE.md) — Definición detallada del alcance
- [docs/DECISIONS.md](./docs/DECISIONS.md) — Registro de decisiones técnicas
- [docs/ROADMAP.md](./docs/ROADMAP.md) — Roadmap de alto nivel

---

**Proyecto iniciado el 20 de mayo de 2026 usando Grok + proceso rav ai-setup.**

Cualquier contribución o cambio debe seguir el flujo de issues + ramas.