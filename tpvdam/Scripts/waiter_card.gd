extends Button

@onready var selection_indicator = $SelectionIndicator
var is_selected: bool = false
var waiter_data: Dictionary

func set_selected(selected: bool):
	is_selected = selected
	if is_selected:
		selection_indicator.color = Color(0.2, 0.6, 1, 0.5)
	else:
		selection_indicator.color = Color(0, 0, 0, 0)

func set_data(data):
	waiter_data = data
	var image_path = data.image if data.image and ResourceLoader.exists(data.image) else "res://icon.svg"
	$HBoxContainer/WaiterImage.texture = load(image_path)
	$HBoxContainer/WaiterName.text = "%s %s" % [data.name, data.surname]
	set_selected(data.get("selected", false))
