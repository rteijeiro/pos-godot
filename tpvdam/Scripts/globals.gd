extends Node

var logged_waiter:Waiter=null

var selected_table:Table=null

var calculator:Calculator=Calculator.new()

func _is_table_selected() -> bool:
	if(selected_table==null):
		print("La mesa no está seleccionada")
		return false
	return true

#Tables functions
func get_selected_table():
	if(!_is_table_selected()): return
	return selected_table

func set_selected_table(table_id:int):
	selected_table = Database.tables[table_id-1]

func add_product_to_selected_table(product_id:int):
	if(!_is_table_selected()): return
	selected_table.products.append(product_id)
	selected_table.status=Table.statuses.OCCUPIED

func clear_selected_table():
	selected_table = null

func get_selected_table_amount() -> float:
	if(!_is_table_selected()): return 0
	var sum:=0.0
	for product_id in selected_table.products:
		sum+=get_product_from_id(product_id).price
	return sum

func get_selected_table_products_with_quantities()->Array:
	if(!_is_table_selected()): return []
	var products_with_quantities:=[]
	for product_id in selected_table.products:
		var found:=false
		for p in products_with_quantities:
			if p.product.id==product_id:
				p.add()
				found=true
				break
		if not found:
			products_with_quantities.append(ProductWithQuantity.new(get_product_from_id(product_id)))
	return products_with_quantities

#Waiters functions
func get_logged_waiter():
	if logged_waiter!=null:
		return logged_waiter
	else:
		return null
	
func set_logged_waiter(waiter_id:int):
	for waiter in Database.waiters:
		if waiter.id==waiter_id:
			logged_waiter = waiter
			return
	logged_waiter = null
	
func delete_waiter(waiter_id:int):
	Database.remove(Waiter,waiter_id)

#Products functions
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
