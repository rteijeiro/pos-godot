extends Node2D

var product_id: int
var amount:= 1

@onready var nameProduct = $NameProduct
@onready var amountProduct = $AmountProduct

func set_data(data: ProductWithQuantity):
	$NameProduct.text = data.product.name
	$AmountProduct.text = data.quantity
	$priceProduct.text = data.product.price
	
