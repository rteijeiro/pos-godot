extends Node2D

func go_to_table(id:int):
	Globals.set_selected_table(id)
	get_tree().change_scene_to_file("res://Scenes/productsScreen.tscn")

# ---------- Calling methods for table buttons ----------
func _on_button_table_pressed() -> void:
	go_to_table(1)


func _on_button_table_2_pressed() -> void:
	go_to_table(2)


func _on_button_table_3_pressed() -> void:
	go_to_table(3)


func _on_button_table_4_pressed() -> void:
	go_to_table(4)


func _on_button_table_5_pressed() -> void:
	go_to_table(5)


func _on_button_table_6_pressed() -> void:
	go_to_table(6)


func _on_button_table_7_pressed() -> void:
	go_to_table(7)


func _on_button_table_8_pressed() -> void:
	go_to_table(8)


func _on_button_table_9_pressed() -> void:
	go_to_table(9)


# ---------- Stool button calling methods ----------
func _on_button_stool_10_pressed() -> void:
	go_to_table(10)


func _on_button_stool_11_pressed() -> void:
	go_to_table(11)


func _on_button_stool_12_pressed() -> void:
	go_to_table(12)


func _on_button_stool_13_pressed() -> void:
	go_to_table(13)


func _on_button_stool_14_pressed() -> void:
	go_to_table(14)


func _on_button_stool_15_pressed() -> void:
	go_to_table(15)


func _on_button_stool_16_pressed() -> void:
	go_to_table(16)
