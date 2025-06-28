extends Node2D

@onready var q_1: Label = $MarginContainer/HBoxContainer/MarginContainer/Conversation/Q1
@onready var a_1: Label = $MarginContainer/HBoxContainer/MarginContainer/Conversation/A1
@onready var q_2: Label = $MarginContainer/HBoxContainer/MarginContainer/Conversation/Q2
@onready var a_2: Label = $MarginContainer/HBoxContainer/MarginContainer/Conversation/A2

@onready var answers: VBoxContainer = $MarginContainer/HBoxContainer/Answers

var new_data := false
var currentUser = "user1"
var isAnimationPlaying := false
@export var animation_time = 1.0
var animation_timer = 0.0
@onready var anim: Sprite2D = $Sprite2D


func _ready() -> void:
	for el in answers.get_children():
		el.hide()
	loadConversation()
	loadBotAnswers()


func playAnimation(delta: float):
	if animation_timer < animation_time:
		animation_timer += delta
		anim.scale = Vector2.ONE * (animation_timer/animation_time) * 16
	else:
		isAnimationPlaying = false
		animation_timer = 0
		anim.hide()
		$MarginContainer.show()


func _process(delta: float) -> void:
	if isAnimationPlaying:
		playAnimation(delta)
	elif new_data:
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
	Global.giveAnswer(currentUser, i)
	new_data = true
	
	
func startAnimation():
	isAnimationPlaying = true
	anim.show()
	$MarginContainer.hide()
	

func _on_button_pressed() -> void:
	choseAnswer(0)

func _on_button_2_pressed() -> void:
	choseAnswer(1)

func _on_button_3_pressed() -> void:
	choseAnswer(2)
