extends Button

var waiter_data: Dictionary

func set_data(data):
	waiter_data = data
	var image_path = data.image if data.image and ResourceLoader.exists(data.image) else "res://icon.svg"
	$HBoxContainer/WaiterImage.texture = load(image_path)
	$HBoxContainer/WaiterName.text = "%s %s" % [data.name, data.surname]
