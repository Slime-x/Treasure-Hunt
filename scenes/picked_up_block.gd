extends RigidBody2D
@onready var player = get_tree().current_scene.get_node("player")
@onready var tilemaplayer = get_tree().current_scene.get_node("procedural_gen_world/TileMapLayer")
@onready var block_texture = $TileMapLayer
var picked_up = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	visible = true
	freeze = false
	global_position = Vector2(1000,0)
	input_pickable = true
	block_texture.set_cell(Vector2i(0,0),tilemaplayer.source_id,tilemaplayer.atlas_position)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#print(visible)
	#print(global_position)
	#if tilemaplayer.block_picked_up == true:
		#global_position = player.global_position + Vector2(20,0)
	if picked_up == true:
		global_position = player.global_position + Vector2(20,0)
		freeze = true
	else:
		freeze = false
	#print(picked_up)

func _input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed and tilemaplayer.block_picked_up == false:
			print("I was clicked!")
			picked_up = true
			#tilemaplayer.block_picked_up = true
			tilemaplayer.carried_block = self
			tilemaplayer.block_picked_up = true
