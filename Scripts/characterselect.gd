extends Node2D

func _process(delta: float) -> void:
	match Global.playerselect:
		0:
			get_node("playerselect").play("Player0")
			get_node("Dec").text = "Börg"
		1:
			get_node("playerselect").play("Player1")
			get_node("Dec").text = "Gangblanc"
		2:
			get_node("playerselect").play("Player2")
			get_node("Dec").text = "Grum"
		3:
			get_node("playerselect").play("Player3")
			get_node("Dec").text = "Kanji - grywalna"
		4:
			get_node("playerselect").play("Player4")
			get_node("Dec").text = "Katan"
		5:
			get_node("playerselect").play("Player5")
			get_node("Dec").text = "Arthax"
		6:
			get_node("playerselect").play("Player6")
			get_node("Dec").text = "Okomo"
		7:
			get_node("playerselect").play("Player7")
			get_node("Dec").text = "Zhinja"

func _on_button_left_pressed() -> void:
	
	Global.playerselect -= 1
	if Global.playerselect < 0:
		Global.playerselect = 7


func _on_button_right_pressed() -> void:
	Global.playerselect += 1
	if Global.playerselect > 7:
		Global.playerselect = 0


func _on_button_select_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/world.tscn")
