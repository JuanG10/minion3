extends KinematicBody2D

onready var exclamation = preload("res://sprites/exclamation.png")
onready var question = preload("res://sprites/question.png")

const START_HEIGHT:Vector2 = Vector2(0,70)
const SIGN_SCALE:Vector2 = Vector2(5,5)
const TIME_Q_SIGN:float = 0.75 # Tiempos para pasar al mensaje _create_sign,
const TIME_E_SIGN:float = 0.4 # Son parámetros para que sea reutilizable.
var timer_name:String
var spr_name:String

func start_exclamation_sign(pos:Vector2, new_timer_name:String, new_spr_name:String)->void:
	_create_sign(pos, exclamation, new_timer_name, new_spr_name, TIME_E_SIGN)

func start_question_sign(pos:Vector2, new_timer_name:String, new_spr_name:String)->void:
	_create_sign(pos, question, new_timer_name, new_spr_name, TIME_Q_SIGN)

func _create_sign(pos:Vector2, image, new_timer_name:String, new_spr_name:String, time:float)->void:
	timer_name = new_timer_name
	spr_name = new_spr_name
	var root:Node = get_tree().get_root()
	var timer:Timer = _create_timer(time)
	var new_sign:Sprite = _create_sprite(image)
	root.add_child(new_sign)
	root.add_child(timer)
	timer.start()
	new_sign.position = pos - START_HEIGHT

func _create_timer(time)->Timer:
	var new_timer:Timer = Timer.new()
	new_timer.set_one_shot(true)
	new_timer.set_wait_time(time)
	new_timer.connect("timeout",self,"_delete_sprite_and_timer")
	new_timer.set_name(timer_name)
	return new_timer

func _create_sprite(image)->Sprite:
	var new_sign = Sprite.new()
	new_sign.texture = image
	new_sign.set_name(spr_name)
	new_sign.scale = SIGN_SCALE
	return new_sign

func _delete_sprite_and_timer()->void:
	var root = get_tree().get_root()
	root.get_node(spr_name).queue_free()
	root.get_node(timer_name).queue_free()
