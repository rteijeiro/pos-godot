extends Node2D

@onready var calculator_label = %CalculatorLabel
@onready var grid_products = $Control/PanelContainerCalculator/Panel/PanelProductos/ScrollContainer/GridContainer
var productName = preload("res://Scenes/ProductName.tscn")

func _ready():
	Globals.calculator.initialize(calculator_label)
	load_selected_products()

func load_selected_products():
	for child in grid_products.get_children():
		child.queue_free()
		
	var products = Globals.get_selected_table_products_with_quantities()
	for product in products:
		var label = productName.instantiate()
		grid_products.add_child(label)
		label.set_data(product)

func _process(_delta: float) -> void:
	if Globals.fetch_table_products_changed():
		Globals.calculator.initialize(calculator_label)
		load_selected_products()
	
func _on_button_cash_pressed():
	Globals.clear_selected_table_products()
	Globals.pay(Payment.paymentMethods.CASH, Payment.statuses.COMPLETED)
	show_payment_message("Pago realizado correctamente: %.2f€" % Globals.calculator.get_current_value(), true)

func _on_button_card_pressed():
	Globals.clear_selected_table_products()
	Globals.pay(Payment.paymentMethods.CARD, Payment.statuses.COMPLETED)
	show_payment_message("Pago realizado correctamente: %.2f€" % Globals.calculator.get_current_value(), true)


func _on_button_not_paid_pressed():
	Globals.clear_selected_table_products()
	Globals.pay(Payment.paymentMethods.NONE, Payment.statuses.COMPLETED)
	show_payment_message("No se ha detectado ningún pago", false)

func show_payment_message(message: String, success: bool):
	var color = Color(0, 1, 0) if success else Color(1, 0, 0)

	var label = Label.new()
	label.text = message
	label.add_theme_color_override("font_color", color)
	label.add_theme_font_size_override("font_size", 30)
	label.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	label.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	label.size_flags_horizontal = Control.SIZE_EXPAND_FILL

	var pay_container = $Control/PanelContainerProductsList/Panel/ScrollContainer/payContainer
	pay_container.add_child(label)

	label.position = Vector2(200, 0)

	await get_tree().create_timer(2.0).timeout
	label.queue_free()
	
	Globals.exit_selected_table()
	get_tree().change_scene_to_file("res://Scenes/tablesSelectScreen.tscn")


func _on_button_change_table_pressed() -> void:
	Globals.exit_selected_table()
	get_tree().change_scene_to_file("res://Scenes/tablesSelectScreen.tscn")


func _on_button_logout_pressed() -> void:
	Globals.exit_selected_table()
	Globals.waiter_logout()
	get_tree().change_scene_to_file("res://Scenes/main.tscn")

func button_pressed(button:String):
	Globals.calculator.update(button,%CalculatorLabel)

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
