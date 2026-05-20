extends Node2D
class_name Main

## Main game scene - MVP
## Generates a simple map using TileMap for the first playable version.

@onready var world: Node2D = $World

const TILE_SIZE := 16
const MAP_WIDTH := 60
const MAP_HEIGHT := 40

var tilemap: TileMap
var tileset: TileSet

func _ready() -> void:
	_create_simple_tileset()
	_create_map()
	print("test-grok: Mapa generado - Issue #3 base completado")


func _create_simple_tileset() -> void:
	# Create a minimal tileset from the placeholder image
	# In a real project this would be a .tres resource created in the editor
	var texture := load("res://assets/tilesets/basic_tiles.png") as Texture2D
	if not texture:
		push_error("No se pudo cargar el tileset image")
		return

	tileset = TileSet.new()
	tileset.tile_size = Vector2i(TILE_SIZE, TILE_SIZE)

	# Add a single atlas source (simplified - 4 tiles in one row)
	var source := TileSetAtlasSource.new()
	source.texture = texture
	source.texture_region_size = Vector2i(TILE_SIZE, TILE_SIZE)

	# Add 4 tiles (grass, dirt, wall, decoration)
	for i in 4:
		source.create_tile(Vector2i(i, 0))

	tileset.add_source(source)


func _create_map() -> void:
	tilemap = TileMap.new()
	tilemap.tile_set = tileset
	tilemap.name = "TileMap"
	world.add_child(tilemap)

	# Generate a very simple map (rooms + corridors feel)
	# Using a basic random walk / cellular automata lite for MVP
	var rng := RandomNumberGenerator.new()
	rng.seed = 42

	# Fill with floor (tile 0 = grass)
	for x in MAP_WIDTH:
		for y in MAP_HEIGHT:
			tilemap.set_cell(0, Vector2i(x, y), 0, Vector2i(0, 0))

	# Add some walls (tile 2)
	for x in range(5, MAP_WIDTH - 5):
		tilemap.set_cell(0, Vector2i(x, 5), 0, Vector2i(2, 0))
		tilemap.set_cell(0, Vector2i(x, MAP_HEIGHT - 6), 0, Vector2i(2, 0))

	for y in range(5, MAP_HEIGHT - 5):
		tilemap.set_cell(0, Vector2i(5, y), 0, Vector2i(2, 0))
		tilemap.set_cell(0, Vector2i(MAP_WIDTH - 6, y), 0, Vector2i(2, 0))

	# Inner walls / obstacles
	for i in 8:
		var wx := rng.randi_range(10, MAP_WIDTH - 15)
		var wy := rng.randi_range(10, MAP_HEIGHT - 15)
		for dx in range(3):
			for dy in range(2):
				tilemap.set_cell(0, Vector2i(wx + dx, wy + dy), 0, Vector2i(2, 0))

	# Add some decoration (tile 3)
	for i in 15:
		var dx := rng.randi_range(8, MAP_WIDTH - 10)
		var dy := rng.randi_range(8, MAP_HEIGHT - 10)
		tilemap.set_cell(0, Vector2i(dx, dy), 0, Vector2i(3, 0))

	print("Mapa generado: %dx%d tiles" % [MAP_WIDTH, MAP_HEIGHT])