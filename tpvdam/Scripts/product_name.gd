extends Control

var product_id: int

func set_data(data: ProductWithQuantity):
	product_id=data.product.id
	$NameProduct.text = data.product.name
	$AmountProduct.text = str(data.quantity)
	$priceProduct.text = str(data.product.price)
	


func _on_button_delete_pressed() -> void:
	Globals.remove_product_from_selected_table(product_id)
