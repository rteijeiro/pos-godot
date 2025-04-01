class_name Payment
extends Object

enum paymentMethods { CASH, CARD }
enum statuses { PENDING, COMPLETED, CANCELLED }

var id:int=0
var timestamp:String=""
var amount:String=""
var paymentMethod:int=paymentMethods.CASH
var status:int=statuses.PENDING
