class_name Waiter
extends Object

var id:int=0
var name:String=""
var surname:String=""
var image:String=""

func _init(p_id:int=0, p_name:String="", p_surname:String="", p_image:String=""):
	id = p_id
	name = p_name
	surname = p_surname
	image = p_image

func from_json(json):
	id=int(json["id"])
	name=json["name"]
	surname=json["surname"]
	image=json["image"]

func to_json() -> Dictionary:
	return {
		"id": id,
		"name": name,
		"surname": surname,
		"image": image
	}
