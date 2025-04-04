extends Control

@onready var waiters_container = $ScrollContainer/WaiterContainer
@onready var add_waiter_button = $HBoxContainerButtons/AddButton
@onready var select_button = $HBoxContainerButtons/SelectButton
@onready var delete_button = $HBoxContainerButtons/DeleteButton

var waiter_card_scene = preload("res://Scenes/waiter_card.tscn")
var add_waiter_form_scene = preload("res://Scenes/add_waiter_form.tscn")
var table_select_scene = preload("res://Scenes/tablesSelectScreen.tscn")

var selected_waiter_id: int = -1

func _ready():
	add_waiter_button.pressed.connect(_on_add_waiter_pressed)
	select_button.pressed.connect(_on_select_pressed)
	delete_button.pressed.connect(_on_delete_pressed)
	_refresh_waiters()
	_update_buttons_state()

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
		"image": waiter_data.image if waiter_data.image else "res://icon.svg",
		"selected": (waiter_data.id == selected_waiter_id)
	})
	
	card.pressed.connect(_on_waiter_selected.bind(waiter_data.id))

func _on_waiter_selected(waiter_id):
	selected_waiter_id = waiter_id
	_refresh_waiters()
	_update_buttons_state()

func _update_buttons_state():
	select_button.disabled = selected_waiter_id == -1
	delete_button.disabled = selected_waiter_id == -1

func _on_add_waiter_pressed():
	var form = add_waiter_form_scene.instantiate()
	add_child(form)
	form.waiter_added.connect(_on_new_waiter_added)
	form.popup_centered()

func _on_new_waiter_added(waiter_name, waiter_surname):
	var new_waiter = Waiter.new(waiter_name, waiter_surname, "res://icon.svg")
	var database = get_node("/root/Database")
	database.add(new_waiter)
	_refresh_waiters()
	await get_tree().process_frame
	$ScrollContainer.scroll_vertical = $ScrollContainer.get_v_scroll_bar().max_value

func _on_select_pressed():
	if selected_waiter_id != -1:
		var backend = get_node("/root/Globals")
		backend.set_logged_waiter(selected_waiter_id)
		
		var table_select = table_select_scene.instantiate()
		get_parent().add_child(table_select)
		queue_free()

func _on_delete_pressed():
	if selected_waiter_id != -1:
		var backend = get_node("/root/Globals")
		backend.delete_waiter(selected_waiter_id)
		
		selected_waiter_id = -1
		_refresh_waiters()
		_update_buttons_state()
