extends Node

var users_story:= {"user1": [], "user2": []}

func loadDialogues():
	var q1:= DialogueNode.new()
	q1.text = "u1q1"
	var a1:= DialogueNode.new()
	a1.text = "a1"
	var a2:= DialogueNode.new()
	a2.text = "a2"
	q1.next = [a1, a2]
	var q2:= DialogueNode.new()
	q2.text = "u1q2"
	a1.next = [q2]
	a2.next = [q2]
	var a3:= DialogueNode.new()
	a3.text = "a3"
	var a4:= DialogueNode.new()
	a4.text = "a4"
	q2.next = [a3, a4];
	
	users_story["user1"] = [q1, q2];

func loadDialogues2():
	var q1:= DialogueNode.new()
	q1.text = "u2q1"
	var a1:= DialogueNode.new()
	a1.text = "a1"
	var a2:= DialogueNode.new()
	a2.text = "a2"
	q1.next = [a1, a2]
	var q2:= DialogueNode.new()
	q2.text = "u2q2"
	a1.next = [q2]
	a2.next = [q2]
	var a3:= DialogueNode.new()
	a3.text = "a3"
	var a4:= DialogueNode.new()
	a4.text = "a4"
	q2.next = [a3, a4];
	
	users_story["user2"] = [q1, q2];
	
var playerPath: Dictionary[String, Array] = {"user1": users_story["user1"], "user2": users_story["user2"]}
var usersQuestions: Dictionary[String, Array] = {"user1": [], "user2": []}

var player_finished:= {"user1" : false, "user2": false}

func _ready() -> void:
	loadDialogues()
	loadDialogues2()
	resetPlayerPath()

func giveAnswer(user: String, answerId: int) -> void :
	if (len(playerPath[user][-1].next) > 0):
		print("choice: ", playerPath[user][-1].next[answerId].text)
		playerPath[user].append(playerPath[user][-1].next[answerId])
	
	if (len(playerPath[user][-1].next) > 0):
		var curr_question = playerPath[user][-1].next[0]
		print("new question: ", curr_question.text)
	
		playerPath[user].append(curr_question)
		usersQuestions[user].append(curr_question)
		
	else: 
		print("finish")
		player_finished[user] = true
	
	print("updated questions: ", usersQuestions[user][-1].text)

func getLastQuestion(user) -> DialogueNode:
	print("last questions ", usersQuestions[user][-1].text)
	return usersQuestions[user][-1]

func getBotAnswers(user) -> Array[DialogueNode]:
	for el in usersQuestions[user][-1].next:
		print("bot answer ", el.text)
	return usersQuestions[user][-1].next

func resetPlayerPath() -> void:
	playerPath = {"user1": [users_story["user1"][0]], "user2": [users_story["user2"][0]]}
	usersQuestions = {"user1": [users_story["user1"][0]], "user2": [users_story["user2"][0]]}
	player_finished = {"user1" : false, "user2": false}
