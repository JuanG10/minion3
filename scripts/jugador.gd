extends KinematicBody2D

var speed = 100
var velocity = Vector2()

onready var player_spr = $character_col/character_spr

var can_climb = false

func _ready():
	player_spr.play("idle")

func _physics_process(delta):
	get_input()
	move_and_slide(velocity)

func get_input(): # Obtiene el input para moverse.
	velocity = Vector2()
	if !is_on_floor() && !can_climb:
		velocity.y += 1
	if Input.is_action_pressed('ui_right'):
		_move_left()
	if Input.is_action_pressed('ui_left'):
		_move_right()
	if _input_release():
		player_spr.play("idle")
	velocity = velocity.normalized() * speed

func _input_release(): # Chequea si se sueltan teclas direccionales.
	return Input.is_action_just_released("ui_right") or Input.is_action_just_released("ui_left") or Input.is_action_just_released("ui_up")

func _move_left():
	velocity.x += 1
	player_spr.play("movimiento_horizontal")
	player_spr.flip_h = false
	
func _move_right():
	velocity.x -= 1
	player_spr.play("movimiento_horizontal")
	player_spr.flip_h = true

func can_climb_up(cadena_pos):
	if Input.is_action_pressed("ui_up") && can_climb:
		position.y -= 1
