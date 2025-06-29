extends Node2D

func _on_button_pressed() -> void:
	var player = get_node("Control/AudioButton")
	player.play()
	Global.resetPlayerPath()
	get_tree().change_scene_to_file("res://Scenes/menu2game.tscn")
