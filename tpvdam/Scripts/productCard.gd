extends Button
var productData: Dictionary
var product_id: int

func set_data(data):
	product_id = data.id
	productData = data
	var image_path = data.image if data.image and ResourceLoader.exists(data.image) else "res://icon.svg"
	$HBoxContainer/TextureRect.texture = load(image_path)
	$HBoxContainer/TextureRect/Label.text = data.name

func _on_pressed() -> void:
	Globals.add_product_to_selected_table(product_id)
	
	
