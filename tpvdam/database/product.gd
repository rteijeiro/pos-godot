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

func read_json(json):
	id=int(json["id"])
	name=json["name"]
	image=json["image"]
	price=float(json["price"])
	category=category_map[json["category"]]
