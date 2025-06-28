class_name DialogueNode

extends Node

@export var text: String = ""

@export var next: Array[DialogueNode] = []

class Intern:
	var text: String
	var next: Array[DialogueNode.Intern]
