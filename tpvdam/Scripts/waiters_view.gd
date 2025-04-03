extends Control

@onready var waiters_container = $ScrollContainer/WaiterContainer
@onready var add_waiter_button = $AddButton

var waiter_card_scene = preload("res://Scenes/waiter_card.tscn")
var add_waiter_form_scene = preload("res://Scenes/add_waiter_form.tscn")

func _ready():
	add_waiter_button.pressed.connect(_on_add_waiter_pressed)
	_refresh_waiters()

func _refresh_waiters():
	for child in waiters_container.get_children():
		child.queue_free()
	
	var database = get_node("/root/Database")
	for waiter in database.waiters:
		_add_waiter_card(waiter)

func _add_waiter_card(waiter_data):
	var card = waiter_card_scene.instantiate()
	waiters_container.add_child(card)
	
	card.set_data({
		"name": waiter_data.name,
		"surname": waiter_data.surname,
		"image": waiter_data.image if waiter_data.image else "res://icon.svg"
	})
	
	card.pressed.connect(_on_waiter_selected.bind(waiter_data.id))

func _on_add_waiter_pressed():
	var form = add_waiter_form_scene.instantiate()
	add_child(form)
	form.waiter_added.connect(_on_new_waiter_added)
	form.popup_centered()

func _on_new_waiter_added(waiter_name, waiter_surname):
	var database = get_node("/root/Database")
	_refresh_waiters()
	
	await get_tree().process_frame
	$ScrollContainer.scroll_vertical = $ScrollContainer.get_v_scroll_bar().max_value

func _on_waiter_selected(waiter_id):
	print("Camarero seleccionado (ID): ", waiter_id)
