extends Node2D

@export var noise_height_text : NoiseTexture2D
var noise : Noise
var width : int = 100
var height : int = 100
var noise_val_arr = []
@onready var tile_map = $TileMapLayer
var source_id_ores = 0
var source_id_dirt = 1
var dirt = Vector2i(2,7)
var coal = Vector2i(0,0)
var diamont = Vector2i(10,0)
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	noise = noise_height_text.noise
	generate_world()

func generate_world():
	for x in range(width):
		for y in range(height):
			var noise_val = noise.get_noise_2d(x,y)
			noise_val_arr.append(noise_val)
			if noise_val >= 0.0:
				tile_map.set_cell(Vector2(x,y), source_id_dirt, dirt)
			if noise_val < 0.0:
				tile_map.set_cell(Vector2(x,y), source_id_ores, coal)
	print("highest", noise_val_arr.max())
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
