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
		var json=JSON.parse_string(text)
		_read_json(json)
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
		array.back().read_json(element)
	return array
