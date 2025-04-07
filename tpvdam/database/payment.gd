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

func _init(p_timestamp=null, p_amount:float=0.0, 
	p_paymentMethod:int=paymentMethods.CASH, p_status:int=statuses.PENDING):
	id = 0
	timestamp = p_timestamp if p_timestamp != null else Time.get_unix_time_from_system()
	amount = p_amount
	paymentMethod = p_paymentMethod
	status = p_status

func from_json(json):
	id=int(json["id"])
	if typeof(json["timestamp"]) == TYPE_STRING:
		timestamp = Time.get_unix_time_from_datetime_string(json["timestamp"])
	else:
		timestamp = int(json["timestamp"])
	amount=int(json["amount"])
	paymentMethod=paymentMethod_map[json["paymentMethod"]]
	status=status_map[json["status"]]

func to_json() -> Dictionary:
	var payment_method_str = ""
	var status_str = ""

	for key in paymentMethod_map:
		if paymentMethod_map[key] == paymentMethod:
			payment_method_str = key
			break

	for key in status_map:
		if status_map[key] == status:
			status_str = key
			break

	return {
		"id": id,
		"timestamp": timestamp,
		"amount": amount,
		"paymentMethod": payment_method_str,
		"status": status_str
	}
