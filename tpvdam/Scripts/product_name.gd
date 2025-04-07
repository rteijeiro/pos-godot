extends Node2D

var product_id: int

func set_data(data: ProductWithQuantity):
	product_id=data.product.id
	$NameProduct.text = data.product.name
	$AmountProduct.text = str(data.quantity)
	$priceProduct.text = str(data.product.price)
	
