extends Node

var waiters:Array[Waiter]=[]
var tables:Array[Table]=[]
var products:Array[Product]=[]
var payments:Array[Payment]=[]

func _ready():
	load_database()

func load_database():
	var file=FileAccess.open("res://database/database.json",FileAccess.READ)
	if file:
		var text=file.get_as_text()
		var json=JSON.parse_string(text)
		read_json(json)
	else:
		push_error("Error loading database")
		get_tree().quit(1)

func read_json(_json):
	pass
