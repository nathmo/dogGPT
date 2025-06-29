extends Node2D

var end: bool

func _ready() -> void:
	var points = 0
	for end in Global.getEndings():
		match end:
			"CatEnding": pass
			"DemonEnding": points += 1
			"FinCompteBloque": points += 1
			"FinLettreOr": pass
			"EndMoral": pass
			"BotchedFix": points += 1
			"SecretFix": points += 1
	if points >= 2:
		$AnimationPlayer.play("GoodDogEnd")
		$Control/Label.text = "Inutile! Tu as satisfait la demande des humains! Tu ne vaux pas plus qu'un vulgaire toutou!"
	else:
		$AnimationPlayer.play("AngryDogEnd")
		$Control/Label.text = " Bien joué ! Dogtrinity est de plus en plus proche de conquérir le monde !"
	

@export var next_scene_path: String = "res://Scenes/Menu.tscn"

func _input(event):
	if event.is_action_pressed("ui_accept"):  # typically SPACE
		_load_next_scene()

func _load_next_scene():
	$AnimationPlayer.stop()
	get_tree().change_scene_to_file(next_scene_path)
