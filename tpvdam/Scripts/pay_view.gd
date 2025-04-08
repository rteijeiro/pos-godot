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
		
		label.get_node("ButtonDelete").connect("pressed", Callable(self, "_on_product_deleted").bind(product.product.id))

func _on_product_deleted(product_id):
	Globals.remove_product_from_selected_table(product_id)
	load_selected_products()
	Globals.calculator.initialize(calculator_label)
	
func _on_button_cash_pressed():
	Globals.calculator.initialize(calculator_label)
	Globals.pay(Payment.paymentMethods.CASH, Payment.statuses.COMPLETED)
	show_payment_message("Pago realizado correctamente: %.2f€" % Globals.calculator.get_current_value(), true)

func _on_button_card_pressed():
	Globals.calculator.initialize(calculator_label)
	Globals.pay(Payment.paymentMethods.CARD, Payment.statuses.COMPLETED)
	show_payment_message("Pago realizado correctamente: %.2f€" % Globals.calculator.get_current_value(), true)


func _on_button_not_paid_pressed():
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
