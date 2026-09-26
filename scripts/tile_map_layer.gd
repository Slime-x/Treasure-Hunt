extends TileMapLayer
@onready var player = get_tree().current_scene.get_node("player")
@onready var carried_block_layer = get_tree().current_scene.get_node("CarriedBlockLayer")
@onready var picked_up_block = get_tree().current_scene.get_node("PickedUpBlock")
var block_picked_up = false
var tile
var source_id
var atlas_position
var falling = false
# Called when the node enters the scene tree for the first time.1
func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed and block_picked_up == false:
			print("CLICK")
			tile = local_to_map(get_global_mouse_position())
			source_id = get_cell_source_id(tile)
			atlas_position = get_cell_atlas_coords(tile)
			erase_cell(tile)
			picked_up_block.global_position = to_global(map_to_local(tile))
			block_picked_up = true
		if event.button_index == MOUSE_BUTTON_RIGHT and event.pressed and block_picked_up == true:
			block_picked_up = false
			picked_up_block.freeze = false

func _process(delta: float) -> void:
	if block_picked_up == true:
		picked_up_block.global_position = player.global_position + Vector2(16,0)
		picked_up_block.visible = true
