extends Control

signal waiter_added(name, surname)

@onready var name_edit = $VBoxContainer/NameContainer/NameEdit
@onready var surname_edit = $VBoxContainer/SurnameContainer/SurnameEdit

func _ready():
	$VBoxContainer/HBoxContainerButtons/CancelButton.pressed.connect(_on_cancel_pressed)
	$VBoxContainer/HBoxContainerButtons/AddButton.pressed.connect(_on_add_pressed)
	
	_validate_fields()
	name_edit.text_changed.connect(_validate_fields)
	surname_edit.text_changed.connect(_validate_fields)

func _on_add_pressed():
	if name_edit.text.strip_edges() != "" and surname_edit.text.strip_edges() != "":
		emit_signal("waiter_added", name_edit.text, surname_edit.text)
		queue_free()

func _on_cancel_pressed():
	queue_free()

func popup_centered():
	show()
	var viewport_size = get_viewport_rect().size
	position = (viewport_size - size) / 2

func _validate_fields():
	$VBoxContainer/HBoxContainerButtons/AddButton.disabled = (
		name_edit.text.strip_edges() == "" or 
		surname_edit.text.strip_edges() == ""
	)
