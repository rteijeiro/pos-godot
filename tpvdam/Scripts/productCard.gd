extends Button

var productData: Dictionary

func set_data(data):
	productData = data
	var image_path = data.image if data.image and ResourceLoader.exists(data.image) else "res://icon.svg"
	$HBoxContainer/TextureRect.texture = load(image_path)
	$HBoxContainer/TextureRect/Label.text = data.name
