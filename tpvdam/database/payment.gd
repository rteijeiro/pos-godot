class_name Payment
extends Object

enum paymentMethods { CASH, CARD }
const paymentMethod_map:={
	"CASH": paymentMethods.CASH,
	"CARD": paymentMethods.CARD
}

enum statuses { PENDING, COMPLETED, CANCELLED }
const status_map:={
	"PENDING": statuses.PENDING,
	"COMPLETED": statuses.COMPLETED,
	"CANCELLED": statuses.CANCELLED
}

var id:int=0
var timestamp
var amount:float=0.0
var paymentMethod:int=paymentMethods.CASH
var status:int=statuses.PENDING

func read_json(json):
	id=int(json["id"])
	timestamp=Time.get_datetime_dict_from_datetime_string(json["timestamp"],false)
	amount=float(json["amount"])
	paymentMethod=paymentMethod_map[json["paymentMethod"]]
	status=status_map[json["status"]]
