extends RigidBody2D
@onready var player = get_tree().current_scene.get_node("player")
@onready var tilemaplayer = get_tree().current_scene.get_node("procedural_gen_world/TileMapLayer")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	visible = true
	freeze = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	print(visible)
	print(global_position)
	if tilemaplayer.block_picked_up == true:
		global_position = player.global_position + Vector2(20,0)
