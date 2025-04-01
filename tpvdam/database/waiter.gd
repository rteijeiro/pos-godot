class_name Waiter
extends Object

var id:int=0
var name:String=""
var surname:String=""
var image:String=""

func read_json(json):
	id=int(json["id"])
	name=json["name"]
	surname=json["surname"]
	image=json["image"]
