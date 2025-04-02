extends Node

var waiters:Array=[]
var tables:Array=[]
var products:Array=[]
var payments:Array=[]

func _ready():
	_load_database()

func _load_database():
	var file=FileAccess.open("res://database/database.json",FileAccess.READ)
	if file:
		var text=file.get_as_text()
		var database=JSON.parse_string(text)
		_read_json(database)
	else:
		push_error("Error loading database")
		get_tree().quit(1)

func _read_json(json):
	waiters=_read_json_array(json["waiters"],Waiter)
	tables=_read_json_array(json["tables"],Table)
	products=_read_json_array(json["products"],Product)
	payments=_read_json_array(json["payments"],Payment)

func _read_json_array(json,type):
	var array=[]
	for element in json:
		array.append(type.new())
		array.back().from_json(element)
	return array

func update_database():
	var json_database = {}
	
	json_database["waiters"] = array_to_json(waiters)
	json_database["tables"] = array_to_json(tables)
	json_database["products"] = array_to_json(products)
	json_database["payments"] = array_to_json(payments)
	
	var file = FileAccess.open("res://database/database.json", FileAccess.WRITE)
	if file:
		file.store_string(JSON.stringify(json_database, "\t", false))
	else:
		push_error("Error saving database")

func array_to_json(array):
	var json_array = []
	for element in array:
		json_array.append(element.to_json())
	return json_array
	
