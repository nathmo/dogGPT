extends Node2D

@onready var q_1: Label = $MarginContainer/HBoxContainer/MarginContainer/Conversation/Q1
@onready var a_1: Label = $MarginContainer/HBoxContainer/MarginContainer/Conversation/A1
@onready var q_2: Label = $MarginContainer/HBoxContainer/MarginContainer/Conversation/Q2
@onready var a_2: Label = $MarginContainer/HBoxContainer/MarginContainer/Conversation/A2

@onready var answers: VBoxContainer = $MarginContainer/HBoxContainer/Answers

func _ready() -> void:
	for el in answers.get_children():
		el.hide()
	loadConversation()
	loadBotAnswers()
	
var new_data:= false
	
func _process(_delta: float) -> void:
	if new_data:
		loadConversation()
		loadBotAnswers()
		new_data = false

var currentUser = "user1"

func loadConversation() -> void:
	var conversation := [q_1, a_1, q_2, a_2]
	for el in conversation:
		el.hide()
	var nb_last_msg = min(3, len(Global.playerPath[currentUser]))
	for i in nb_last_msg:
		conversation[i].text = Global.playerPath[currentUser][-nb_last_msg+i].text
		conversation[i].show()
	a_2.text = "..."
	a_2.show()
	
func loadBotAnswers() -> void:
	var answerNodes = Global.getBotAnswers(currentUser)
	for i in len(answerNodes):
		answers.get_children()[i].text = answerNodes[i].text
		answers.get_children()[i].show()

func choseAnswer(i: int) -> void:
	Global.giveAnswer(currentUser, i)
	new_data = true

func _on_button_pressed() -> void:
	choseAnswer(0)

func _on_button_2_pressed() -> void:
	choseAnswer(1)

func _on_button_3_pressed() -> void:
	choseAnswer(2)
	
