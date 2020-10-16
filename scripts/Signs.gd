extends KinematicBody2D

onready var exclamation = preload("res://sprites/exclamation.png")
onready var question = preload("res://sprites/question.png")

const START_HEIGHT:Vector2 = Vector2(0,12)
var timer_name:String
var spr_name:String

func start_exclamation_sign(pos:Vector2, new_timer_name:String, new_spr_name:String)->void:
	_create_sign(pos, exclamation, new_timer_name, new_spr_name)

func start_question_sign(pos:Vector2, new_timer_name:String, new_spr_name:String)->void:
	_create_sign(pos, question, new_timer_name, new_spr_name)

func _create_sign(pos:Vector2, image, new_timer_name:String, new_spr_name:String)->void:
	timer_name = new_timer_name
	spr_name = new_spr_name
	var root:Node = get_tree().get_root()
	var timer:Timer = _create_timer()
	var new_sign:Sprite = _create_sprite(image)
	root.add_child(new_sign)
	root.add_child(timer)
	timer.start()
	new_sign.position = pos - START_HEIGHT

func _create_timer()->Timer:
	var new_timer:Timer = Timer.new()
	new_timer.set_one_shot(true)
	new_timer.set_wait_time(0.35)
	new_timer.connect("timeout",self,"_on_timer_timeout")
	new_timer.set_name(timer_name)
	return new_timer

func _create_sprite(image)->Sprite:
	var new_sign = Sprite.new()
	new_sign.texture = image
	new_sign.set_name(spr_name)
	return new_sign

func _on_timer_timeout()->void:
	var root = get_tree().get_root()
	root.get_node(spr_name).queue_free()
	root.get_node(timer_name).queue_free()
