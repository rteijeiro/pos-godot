class_name Table
extends Object

enum statuses { AVAILABLE, OCCUPIED, RESERVED }
const status_map:={
	"AVAILABLE": statuses.AVAILABLE,
	"OCCUPIED": statuses.OCCUPIED,
	"RESERVED": statuses.RESERVED
}

var id:int=0
var diners:int=0
var products:Array[int]=[]
var status:int=statuses.AVAILABLE

func _init(p_diners:int=0, p_products:Array[int]=[], 
	p_status:int=statuses.AVAILABLE):
	id = 0
	diners = p_diners
	products = p_products
	status = p_status

func from_json(json):
	id=int(json["id"])
	diners=int(json["diners"])
	products=[]
	for e in json["products"]:
		products.append(int(e))
	status=status_map[json["status"]]

func to_json() -> Dictionary:
	return {
		"id": id,
		"diners": diners,
		"products": [],
		"status": "AVAILABLE"
	}
