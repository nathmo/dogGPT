extends Node2D

@onready var q_1: Label = $MarginContainer/HBoxContainer/MarginContainer/Conversation/Q1
@onready var a_1: Label = $MarginContainer/HBoxContainer/MarginContainer/Conversation/A1
@onready var q_2: Label = $MarginContainer/HBoxContainer/MarginContainer/Conversation/Q2
@onready var a_2: Label = $MarginContainer/HBoxContainer/MarginContainer/Conversation/A2

@onready var answers: VBoxContainer = $MarginContainer/HBoxContainer/Answers

var new_data := false
var currentUser = "user1"
var animation_finished := true
var end_animation_finished := true


func _ready() -> void:
	for el in answers.get_children():
		el.hide()
	loadConversation()
	loadBotAnswers()


func _on_animation_finished(anim_name: String):
	if anim_name == "switch":
		animation_finished = true
	else:
		end_animation_finished = true


func _process(_delta: float) -> void:
	if new_data && animation_finished && end_animation_finished:
		switchUser()
		loadConversation()
		loadBotAnswers()
		new_data = false
	if Global.player_finished["user1"] && Global.player_finished["user2"]:
		get_tree().change_scene_to_file("res://Scenes/Menu.tscn")


func loadConversation() -> void:
	var conversation := [q_1, a_1, q_2, a_2]
	for el in conversation:
		el.hide()
	var nb_last_msg = min(4, len(Global.playerPath[currentUser]))
	var msg_owner = ""
	for i in nb_last_msg:
		if int(i) % 2 == 0: msg_owner = "User\n"
		else: msg_owner = "DogGPT\n"
		conversation[i].text = msg_owner+Global.playerPath[currentUser][-nb_last_msg+i].text
		conversation[i].show()
	if nb_last_msg < 4:
		a_2.text = "DogGPT\n..."
		a_2.show()


func loadBotAnswers() -> void:
	var answerNodes = Global.getBotAnswers(currentUser)
	for i in len(answers.get_children()):
		answers.get_children()[i].hide()
	for i in len(answerNodes):
		answers.get_children()[i].text = answerNodes[i].text
		answers.get_children()[i].show()


func switchUser() -> void:
	var last_usr =  currentUser
	currentUser = "user%d" % (1+randi_range(0, len(Global.users_story)-1))
	if Global.player_finished[currentUser]:
		for i in len(Global.player_finished):
			if !Global.player_finished["user%d" % (1+i)]:
				currentUser = "user%d" % (1+i)
				break
	if last_usr != currentUser:
		startAnimation()


func choseAnswer(i: int) -> void:
	var ending = Global.giveAnswer(currentUser, i)
	if ending != "":
		startEndAnimation(ending)
		end_animation_finished = false
	new_data = true


func startAnimation():
	$AnimationPlayer.play("switch")
	$AnimationPlayer.connect("animation_finished", _on_animation_finished)

func startEndAnimation(ending: String):
	print(ending)
	$AnimationPlayer.play(ending)
	$AnimationPlayer.connect("end_animation_finished", _on_animation_finished)


func _on_button_pressed() -> void:
	choseAnswer(0)

func _on_button_2_pressed() -> void:
	choseAnswer(1)

func _on_button_3_pressed() -> void:
	choseAnswer(2)
