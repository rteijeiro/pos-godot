class_name Calculator
extends Object

const MAX_TEXT_LENGTH:=10

var base_number:=0.0
var writing_secondary_number:=false
var text:="0"

func initialize(contentLabel:Label):
	text=_price_to_string(Globals.get_selected_table_amount())
	contentLabel.text=text

func get_current_value()->float:
	var value:=0.0
	if writing_secondary_number:
		value=base_number
	else:
		value=float(text)
	return _trunc_price(value)

func _trunc_price(price:float)->float:
	return floor(price*100+0.001)/100

func _price_to_string(price:float)->String:
	var value:float=_trunc_price(price)
	if floor(value)==value:
		return str(int(value))
	else:
		return "%0.2f"%value

func _compute_result():
	if writing_secondary_number:
		var result:=base_number
		if text[0]=="+":
			result+=float(text.substr(1))
		elif text[0]=="-":
			result-=float(text.substr(1))
		elif text[0]=="%":
			result+=result*(float(text.substr(1))/100)
		text=_price_to_string(result)
		writing_secondary_number=false
	else:
		var result:float=float(text)
		text=_price_to_string(result)

func _start_operation(op:String):
	if not writing_secondary_number:
		writing_secondary_number=true
		base_number=float(text)
		text=op

func _write(content:String):
	if text.length()<MAX_TEXT_LENGTH:
		if text=="0" and content!=".":
			text=content
		else:
			text+=content

func _erase_last():
	if text.length()>0:
		if text.length()>1:
			text=text.erase(text.length()-1)
		else:
			if writing_secondary_number:
				text=_price_to_string(base_number)
				writing_secondary_number=false
			else:
				text="0"
	if not writing_secondary_number:
		if text=="-":
			text="0"

func _is_digit(c:String):
	var digits:="0123456789"
	return digits.contains(c)

func update(button:String,contentLabel:Label):
	match button:
		"0", "1", "2", "3", "4", "5", "6", "7", "8", "9":
			_write(button)
		",":
			if text.length()>0 and text.find(".")==-1:
				if _is_digit(text[text.length()-1]):
					_write(".")
		"=":
			_compute_result()
		"+":
			_start_operation("+")
		"-":
			if writing_secondary_number and text=="%":
				_write("-")
			else:
				_start_operation("-")
		"%":
			_start_operation("%")
		"C":
			_erase_last()
	contentLabel.text=text
