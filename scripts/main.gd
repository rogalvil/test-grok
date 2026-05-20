extends Node2D
class_name Main

## Main game scene - MVP
## Generates a simple map + spawns the player.

@onready var world: Node2D = $World

const TILE_SIZE := 16
const MAP_WIDTH := 60
const MAP_HEIGHT := 40

var tilemap: TileMap
var tileset: TileSet

func _ready() -> void:
	_create_simple_tileset()
	_create_map()
	_spawn_player()
	print("test-grok: MVP base listo - mapa + jugador (Issues #2-#4)")


func _create_simple_tileset() -> void:
	var texture := load("res://assets/tilesets/basic_tiles.png") as Texture2D
	if not texture:
		push_error("No se pudo cargar el tileset image")
		return

	tileset = TileSet.new()
	tileset.tile_size = Vector2i(TILE_SIZE, TILE_SIZE)

	var source := TileSetAtlasSource.new()
	source.texture = texture
	source.texture_region_size = Vector2i(TILE_SIZE, TILE_SIZE)

	for i in 4:
		source.create_tile(Vector2i(i, 0))

	tileset.add_source(source)


func _create_map() -> void:
	tilemap = TileMap.new()
	tilemap.tile_set = tileset
	tilemap.name = "TileMap"
	world.add_child(tilemap)

	var rng := RandomNumberGenerator.new()
	rng.seed = 42

	# Floor
	for x in MAP_WIDTH:
		for y in MAP_HEIGHT:
			tilemap.set_cell(0, Vector2i(x, y), 0, Vector2i(0, 0))

	# Outer walls
	for x in range(5, MAP_WIDTH - 5):
		tilemap.set_cell(0, Vector2i(x, 5), 0, Vector2i(2, 0))
		tilemap.set_cell(0, Vector2i(x, MAP_HEIGHT - 6), 0, Vector2i(2, 0))

	for y in range(5, MAP_HEIGHT - 5):
		tilemap.set_cell(0, Vector2i(5, y), 0, Vector2i(2, 0))
		tilemap.set_cell(0, Vector2i(MAP_WIDTH - 6, y), 0, Vector2i(2, 0))

	# Random inner obstacles
	for i in 8:
		var wx := rng.randi_range(10, MAP_WIDTH - 15)
		var wy := rng.randi_range(10, MAP_HEIGHT - 15)
		for dx in range(3):
			for dy in range(2):
				tilemap.set_cell(0, Vector2i(wx + dx, wy + dy), 0, Vector2i(2, 0))

	# Decoration
	for i in 15:
		var dx := rng.randi_range(8, MAP_WIDTH - 10)
		var dy := rng.randi_range(8, MAP_HEIGHT - 10)
		tilemap.set_cell(0, Vector2i(dx, dy), 0, Vector2i(3, 0))

	print("Mapa generado: %dx%d tiles" % [MAP_WIDTH, MAP_HEIGHT])


func _spawn_player() -> void:
	var player_scene := preload("res://scenes/Player.tscn")
	var player := player_scene.instantiate() as Player
	player.position = Vector2(12 * TILE_SIZE, 12 * TILE_SIZE)  # Start inside the "room"
	world.add_child(player)

	# Add a simple camera that follows the player
	var camera := Camera2D.new()
	camera.zoom = Vector2(2.5, 2.5)
	camera.position_smoothing_enabled = true
	camera.position_smoothing_speed = 8.0
	player.add_child(camera)

	print("Jugador spawneado en el mapa")

	# Setup debug overlay
	_setup_debug_overlay()


# =============================================================================
# DEBUG / TESTING TOOLS (Issue #10)
# =============================================================================

var fps_label: Label
var debug_enabled := false

func _setup_debug_overlay() -> void:
	fps_label = Label.new()
	fps_label.name = "FPSLabel"
	fps_label.position = Vector2(20, 20)
	fps_label.add_theme_font_size_override("font_size", 18)
	fps_label.add_theme_color_override("font_color", Color(1, 1, 1))
	fps_label.add_theme_color_override("font_outline_color", Color(0, 0, 0))
	fps_label.add_theme_constant_override("outline_size", 4)
	fps_label.visible = false
	add_child(fps_label)


func _unhandled_input(event: InputEvent) -> void:
	# Reload scene (very useful for testing)
	if event.is_action_pressed("ui_cancel") and event is InputEventKey and event.ctrl_pressed:
		# Ctrl + Escape for hard quit (safety)
		get_tree().quit()
		return

	if event is InputEventKey and event.pressed and not event.echo:
		match event.keycode:
			KEY_R:
				# R → Reload current scene
				print("Debug: Reloading scene...")
				get_tree().reload_current_scene()
			
			KEY_F3:
				# F3 → Toggle FPS counter
				debug_enabled = not debug_enabled
				fps_label.visible = debug_enabled
				print("Debug: FPS overlay = ", debug_enabled)


func _process(_delta: float) -> void:
	if debug_enabled and fps_label:
		fps_label.text = "FPS: %d" % Engine.get_frames_per_second()