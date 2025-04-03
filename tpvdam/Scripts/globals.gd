extends Node

var selected_table_id:=0
var logged_waiter_id:=0

func get_selected_table():
	return Database.tables[selected_table_id-1]

func add_product_to_selected_table(product_id:int):
	Database.tables[selected_table_id-1].products.append(product_id)
	Database.tables[selected_table_id-1].status=Table.statuses.OCCUPIED

func get_selected_table_amount() -> float:
	var sum:=0.0
	for product_id in Database.tables[selected_table_id-1].products:
		sum+=get_product_from_id(product_id).price
	return sum

func get_logged_waiter():
	for waiter in Database.waiters:
		if waiter.id==logged_waiter_id:
			return waiter
	assert(false,"Waiter not logged in")

func get_product_from_id(product_id:int):
	for product in Database.products:
		if product.id==product_id:
			return product
	assert(false,"Product not found")

func get_products_of_category(category:int):
	var products=[]
	for product in Database.products:
		if product.category==category:
			products.append(product)
	return products
