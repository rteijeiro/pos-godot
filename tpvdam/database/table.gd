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

func read_json(json):
	id=int(json["id"])
	diners=int(json["diners"])
	products=[]
	for e in json["products"]:
		products.append(int(e))
	status=status_map[json["status"]]
