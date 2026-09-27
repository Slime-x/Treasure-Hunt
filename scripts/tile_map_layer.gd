extends TileMapLayer
@onready var carried_block_layer = get_tree().current_scene.get_node("CarriedBlockLayer")
# @onready var picked_up_block = get_tree().current_scene.get_node("PickedUpBlock")
var picked_up_block = preload("res://scenes/PickedUpBlock.tscn")
var block_added = false
var amount_of_blocks = 0
var block_picked_up = false
var tile
var source_id
var atlas_position
var falling = false
# Called when the node enters the scene tree for the first time.1
func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed and block_picked_up == false and block_added == false:
			print("CLICK")
			tile = local_to_map(get_global_mouse_position())
			source_id = get_cell_source_id(tile)
			atlas_position = get_cell_atlas_coords(tile)
			erase_cell(tile)
			block_picked_up = true
			amount_of_blocks += 1
		if event.button_index == MOUSE_BUTTON_RIGHT and event.pressed and block_picked_up == true:
			block_picked_up = false
			block_added = false

func _process(delta: float) -> void:
	if block_picked_up == true and block_added == false:
		var new_block = picked_up_block.instantiate()
		add_child(new_block)
		print(new_block)
		block_added = true
