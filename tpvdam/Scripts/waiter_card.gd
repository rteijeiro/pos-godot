extends Button

var waiter_data: Dictionary

func set_data(data):
	waiter_data = data
	$HBoxContainer/WaiterImage.texture = load(data.image)
	$HBoxContainer/WaiterName.text = "%s %s" % [data.name, data.surname]
