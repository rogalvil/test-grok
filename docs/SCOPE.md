# SCOPE - Alcance Detallado del MVP (v0.1)

## Objetivo del MVP

Permitir que el jugador controle un personaje que pueda desplazarse libremente por un mapa con obstáculos, sintiendo que ya existe "un mundo" aunque sea mínimo.

## Requisitos Funcionales (Must Have)

### 1. Mundo / Mapa
- Al menos un mapa jugable de tamaño mínimo 40x25 tiles.
- Mínimo 3 tipos de tiles:
  - Suelo transitable
  - Pared / obstáculo
  - Suelo decorativo (hierba, tierra, etc.)
- El mapa debe verse coherente (no solo un grid vacío).

### 2. Personaje
- Sprite visible del personaje (al menos 16x16 o 32x32).
- 4 direcciones de movimiento (arriba, abajo, izquierda, derecha).
- Animaciones básicas de "idle" y "walk" por dirección (mínimo 2 frames por animación).
- El personaje no puede atravesar tiles de tipo "pared".

### 3. Controles
- Teclado:
  - WASD o Flechas direccionales
  - Velocidad de movimiento razonable (no demasiado lento ni resbaladizo)
- El movimiento debe sentirse responsivo.

### 4. Cámara
- La cámara debe seguir al personaje de forma suave.
- La cámara no debe mostrar áreas fuera del mapa (límites del mundo).

### 5. Estructura del Proyecto
- Escena principal clara (`Main.tscn` o `Game.tscn`)
- Escena del jugador separada (`Player.tscn`)
- TileSet y TileMap organizados
- Estructura de carpetas razonable (`scenes/`, `scripts/`, `assets/`, `tilesets/`)

## Requisitos No Funcionales

- El proyecto debe abrirse y correr en Godot 4.3+ sin errores.
- El código debe estar razonablemente comentado (especialmente el movimiento del jugador).
- FPS estable (60 fps en hardware común).

## Criterios de Aceptación (Definition of Done)

- [ ] Puedo compilar y ejecutar el proyecto sin errores.
- [ ] El personaje aparece en el mapa.
- [ ] Puedo mover al personaje en las 4 direcciones.
- [ ] El personaje no atraviesa paredes.
- [ ] La cámara sigue al personaje correctamente.
- [ ] El mapa tiene suficiente tamaño y variedad visual como para "explorar" durante al menos 30-40 segundos sin aburrirse.

## Fuera de Alcance (Explícitamente Excluido)

- Cualquier forma de combate o daño
- Items, inventario o recolección
- NPCs o diálogos
- Múltiples mapas o transiciones entre ellos
- Menú de pausa o inventario
- Guardado / carga de partida
- Efectos de partículas, luces o shaders complejos
- Sonido o música
- Soporte para gamepad (solo teclado en el MVP)

## Notas de Diseño

- El mapa inicial puede ser creado manualmente en el editor de Godot (no es necesario generar mapas procedurales).
- El personaje puede ser un sprite simple (incluso un cuadrado coloreado temporalmente está aceptado si las animaciones vienen después).
- La prioridad es **sentir que el personaje está dentro de un mundo**, aunque sea muy pequeño.

---

**Versión del documento:** 1.0  
**Fecha:** 20 de mayo de 2026  
**Aprobado por:** Usuario (confirmación vía chat)