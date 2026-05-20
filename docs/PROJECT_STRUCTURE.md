# Estructura del Proyecto (Godot 4)

Esta estructura está pensada para un RPG 2D escalable pero manteniendo simplicidad en las primeras fases.

```
test-grok/
├── .git/
├── .godot/                    # (generado por Godot, ignorado en git)
├── docs/                      # Documentación del proyecto
│   ├── SCOPE.md
│   ├── DECISIONS.md
│   ├── ROADMAP.md
│   └── PROJECT_STRUCTURE.md
├── scenes/                    # Escenas principales (.tscn)
│   ├── Main.tscn              # Escena raíz del juego
│   └── Player.tscn            # Personaje jugable
├── scripts/                   # Scripts GDScript
│   └── player.gd
├── tilesets/                  # Recursos de TileSet
│   └── overworld_tiles.tres
├── assets/                    # Recursos gráficos y de audio
│   ├── sprites/
│   │   └── player.png
│   └── tilesets/
│       └── overworld.png
├── ui/                        # Futuras interfaces (menús, HUD, etc.)
├── project.godot              # Archivo de configuración del proyecto
├── .gitignore
└── README.md
```

## Reglas de Organización

- **scenes/**: Solo escenas `.tscn`. Una escena = un archivo.
- **scripts/**: Scripts GDScript. Nombrar igual que la escena cuando sea posible (`player.gd` para `Player.tscn`).
- **assets/**: Todo lo importado (imágenes, sonidos, fuentes). Mantener subcarpetas por tipo.
- **tilesets/**: Recursos `.tres` de TileSet + las texturas fuente.
- **ui/**: Escenas y scripts relacionados con menús, inventario, diálogos, etc. (vacío en MVP).

## Convenciones de Nomenclatura

- Escenas: `PascalCase` (ej: `Player.tscn`, `MainMenu.tscn`)
- Scripts: `snake_case` (ej: `player.gd`, `inventory_manager.gd`)
- Recursos: `snake_case` (ej: `overworld_tiles.tres`)

## Notas para el MVP

Durante el MVP (Hito 1) es aceptable tener una estructura más simple. Esta estructura se puede refinar en el Hito 2.

---

**Actualizado:** 20 de mayo de 2026 (junto con Issue #2)