extends TileMapLayer


# Called when the node enters the scene tree for the first time.
func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			print("CLICK")
			var tile = local_to_map(get_global_mouse_position())
			erase_cell(tile)
