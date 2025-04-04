extends Node2D

@onready var productsContainer = $Control/PanelContainerProductsList/Panel/ScrollContainer/productsContainer
var productsCard = preload("res://Scenes/productCard.tscn")

func _ready() -> void:
	pass

func getProductsByCategory(category_id: int):
	for child in productsContainer.get_children():
		child.queue_free()
		
	for product in Globals.get_products_of_category(category_id):
		var card = productsCard.instantiate()
		productsContainer.add_child(card)

		card.set_data({
			"name": product.name,
			"image": product.image if product.image else "res://icon.svg"
		})

# ---------- Types of food ----------
func _on_button_starters_pressed() -> void:
	getProductsByCategory(Product.categories.STARTERS)
	

func _on_button_meat_pressed() -> void:
	getProductsByCategory(Product.categories.MEAT)


func _on_button_fish_pressed() -> void:
	getProductsByCategory(Product.categories.FISH)


func _on_button_pasta_pressed() -> void:
	getProductsByCategory(Product.categories.PASTA)


func _on_button_dessert_pressed() -> void:
	getProductsByCategory(Product.categories.DESSERTS)


func _on_button_drinks_pressed() -> void:
	getProductsByCategory(Product.categories.DRINKS)


# ---------- Others buttons ----------
func _on_button_print_pressed() -> void:
	pass # Replace with function body.


func _on_button_pay_pressed() -> void:
	pass # Replace with function body.


func _on_button_delete_pressed() -> void:
	pass # Replace with function body.


func _on_button_add_notes_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/addNotesScreen.tscn")


func _on_button_tickets_pressed() -> void:
	pass # Replace with function body.


func _on_button_open_box_pressed() -> void:
	pass # Replace with function body.


func _on_button_change_table_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/tablesSelectScreen.tscn")


func _on_button_split_ticket_pressed() -> void:
	pass # Replace with function body.


func _on_button_pays_pressed() -> void:
	pass # Replace with function body.


func _on_button_logout_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/main.tscn")
