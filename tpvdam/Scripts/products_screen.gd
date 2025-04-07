extends Node2D

@onready var gridProducts = $Control/PanelContainerCalculator/Panel/PanelProductos/ScrollContainer/GridContainer
@onready var productsContainer = $Control/PanelContainerProductsList/Panel/ScrollContainer/productsContainer

var productsCard = preload("res://Scenes/productCard.tscn")
var productName = preload("res://Scenes/ProductName.tscn")
func _ready() -> void:
	Globals.calculator.initialize(%CalculatorLabel)
	updateProductsWithQuantities()

func button_pressed(button:String):
	Globals.calculator.update(button,%CalculatorLabel)

func getProductsByCategory(category_id: int):
	for child in productsContainer.get_children():
		child.queue_free()
		
	for product in Globals.get_products_of_category(category_id):
		var card = productsCard.instantiate()
		productsContainer.add_child(card)

		card.set_data({
			"id": product.id,
			"name": product.name,
			"image": product.image if product.image else "res://icon.svg"
		})

func updateProductsWithQuantities():
	for child in gridProducts.get_children():
		child.queue_free()
		
	var products = Globals.get_selected_table_products_with_quantities()
	for product in products:
		var label = productName.instantiate()
		gridProducts.add_child(label)
		label.set_data(product)

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


func _on_button_num_7_pressed() -> void:
	button_pressed("7")


func _on_button_num_8_pressed() -> void:
	button_pressed("8")


func _on_button_num_9_pressed() -> void:
	button_pressed("9")


func _on_button_c_pressed() -> void:
	button_pressed("C")


func _on_button_num_4_pressed() -> void:
	button_pressed("4")


func _on_button_num_5_pressed() -> void:
	button_pressed("5")


func _on_button_num_6_pressed() -> void:
	button_pressed("6")


func _on_button_symbol_plus_pressed() -> void:
	button_pressed("+")


func _on_button_num_1_pressed() -> void:
	button_pressed("1")


func _on_button_num_2_pressed() -> void:
	button_pressed("2")


func _on_button_num_3_pressed() -> void:
	button_pressed("3")


func _on_button_symbol_minus_pressed() -> void:
	button_pressed("-")


func _on_button_symbol_equal_pressed() -> void:
	button_pressed("=")


func _on_button_num_0_pressed() -> void:
	button_pressed("0")


func _on_button_symbol_decimal_pressed() -> void:
	button_pressed(",")


func _on_button_symbol_percent_pressed() -> void:
	button_pressed("%")
