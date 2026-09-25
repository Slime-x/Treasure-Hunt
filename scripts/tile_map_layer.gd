extends TileMapLayer
@onready var player = get_tree().current_scene.get_node("player")
var block_picked_up = false
var tile
# Called when the node enters the scene tree for the first time.
func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed and block_picked_up == false:
			print("CLICK")
			tile = local_to_map(get_global_mouse_position())
			block_picked_up = true
		if event.button_index == MOUSE_BUTTON_RIGHT and event.pressed:
			block_picked_up = false
func _process(_delta):
	if block_picked_up == true:
		var player_tile = local_to_map(player.global_position)
		var new_tile = tile
		if player.direction > 0:
			new_tile = player_tile + Vector2i(-1,0)
		elif player.direction < 0:
			new_tile = player_tile + Vector2i(1,0)
		erase_cell(tile)
		set_cell(new_tile, 0, Vector2i(0,0))
		tile = new_tile
