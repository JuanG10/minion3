extends Node2D

onready var exclamation = preload("res://sprites/exclamation.png")
onready var question = preload("res://sprites/question.png")

const START_HEIGHT:Vector2 = Vector2(0,15)

func start_question_mark(pos:Vector2)->void:
	_create_mark(pos,question)

func start_exclamation_mark(pos:Vector2)->void:
	_create_mark(pos,exclamation)

func _create_mark(pos:Vector2, image)->void:
	print("Entró a _create_mark")
	var new_mark = Sprite.new()
	new_mark.texture = image
	get_tree().get_root().add_child(new_mark)
	new_mark.position = pos - START_HEIGHT
	print("Después de asignar posición")
