extends KinematicBody2D

var speed = 100
var velocity = Vector2()

onready var player_spr = $jugador_col/jugador_spr

var can_climb = false

func _physics_process(delta):
	get_input()
	move_and_slide(velocity)

func get_input():
	velocity = Vector2()
	if !is_on_floor() && !can_climb:
		velocity.y += 1
	if Input.is_action_pressed('ui_right'):
		velocity.x += 1
		player_spr.play("movimiento_horizontal")
		player_spr.flip_h = false
	if Input.is_action_pressed('ui_left'):
		velocity.x -= 1
		player_spr.play("movimiento_horizontal")
		player_spr.flip_h = true
	if _input_release():
		player_spr.play("idle")
	velocity = velocity.normalized() * speed

func _input_release():
	return Input.is_action_just_released("ui_right") or Input.is_action_just_released("ui_left")

func _input_up():
	return Input.is_action_pressed("ui_up") && can_climb

func can_climb_up(cadena_pos):
	if _input_up():
		position.y -= 1
