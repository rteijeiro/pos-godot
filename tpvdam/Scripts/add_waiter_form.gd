extends Control

signal waiter_added(name, surname)

@onready var name_edit: LineEdit = $VBoxContainer/NameContainer/NameEdit
@onready var surname_edit: LineEdit = $VBoxContainer/SurnameContainer/SurnameEdit
@onready var add_button: Button = $VBoxContainer/HBoxContainerButtons/AddButton
@onready var cancel_button: Button = $VBoxContainer/HBoxContainerButtons/CancelButton

func _ready():
	cancel_button.pressed.connect(_on_cancel_pressed)
	add_button.pressed.connect(_on_add_pressed)
	
	_validate_fields()
	
	name_edit.text_changed.connect(_on_text_changed)
	surname_edit.text_changed.connect(_on_text_changed)

func _on_add_pressed():
	if _is_form_valid():
		emit_signal("waiter_added", name_edit.text.strip_edges(), surname_edit.text.strip_edges())
		queue_free()

func _on_cancel_pressed():
	queue_free()

func _on_text_changed(_new_text):
	_validate_fields()

func _is_form_valid() -> bool:
	return name_edit.text.strip_edges() != "" && surname_edit.text.strip_edges() != ""

func _validate_fields():
	add_button.disabled = !_is_form_valid()

func popup_centered():
	show()
	var viewport_size = get_viewport_rect().size
	position = (viewport_size - size) / 2
	name_edit.grab_focus()
