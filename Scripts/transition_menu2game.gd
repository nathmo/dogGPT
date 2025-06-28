extends Node2D

@export var next_scene_path: String = "res://Scenes/Game.tscn"

var animation_finished = false

func _ready():
	$AnimationPlayer.play("move_path")
	$AnimationPlayer.connect("animation_finished", _on_animation_finished)

func _on_animation_finished(anim_name):
	if anim_name == "move_path":
		animation_finished = true
		_load_next_scene()

func _input(event):
	if event.is_action_pressed("ui_accept"):  # typically SPACE
		_load_next_scene()

func _load_next_scene():
	if not animation_finished:
		$AnimationPlayer.stop()
	get_tree().change_scene_to_file(next_scene_path)
