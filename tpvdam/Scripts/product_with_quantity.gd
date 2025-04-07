class_name ProductWithQuantity
extends Object

var product:Product
var quantity:int=1

func _init(from_product:Product)->void:
	product=from_product

func add(quantity_to_add:int=1):
	quantity+=quantity_to_add
