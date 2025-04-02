class_name Product
extends Object

enum categories { STARTERS, MEAT, FISH, PASTA, DESSERTS, DRINKS }
const category_map:={
	"STARTERS": categories.STARTERS,
	"MEAT": categories.MEAT,
	"FISH": categories.FISH,
	"PASTA": categories.PASTA,
	"DESSERTS": categories.DESSERTS,
	"DRINKS": categories.DRINKS
}

var id:int=0
var name:String=""
var image:String=""
var price:float=0.0
var category:int=categories.STARTERS

func _init(p_id:int=0, p_name:String="", p_image:String="", 
	p_price:float=0.0, p_category:int=categories.STARTERS):
	id = p_id
	name = p_name
	image = p_image
	price = p_price
	category = p_category

func from_json(json):
	id=int(json["id"])
	name=json["name"]
	image=json["image"]
	price=float(json["price"])
	category=category_map[json["category"]]

func to_json() -> Dictionary:
	var category_str = ""

	for key in category_map:
		if category_map[key] == category:
			category_str = key
			break
	
	return {
		"id": id,
		"name": name,
		"image": image,
		"price": price,
		"category": category_str
	}
