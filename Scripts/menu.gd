extends Node2D

func _on_button_pressed() -> void:
	Global.resetPlayerPath()
	get_tree().change_scene_to_file("res://Scenes/menu2game.tscn")
	
