extends KinematicBody2D

var speed = 100
var velocity = Vector2()

onready var player_spr = $jugador_col/jugador_spr

var can_climb = false

#
var GRAVEDAD = 100
var vel_salto = 130
var impulso = false
var walk   = 100

func _ready():
	set_physics_process(true)	

func _physics_process(delta):
	velocity.x = 0
	velocity.y += GRAVEDAD * delta
	get_input()
	move_and_slide(velocity,Vector2(0,-1))

	


func get_input():

	if Input.is_action_pressed('ui_right'):
		velocity.x += walk
		player_spr.play("movimiento_horizontal")
		player_spr.flip_h = false
	if Input.is_action_pressed('ui_left'):
		velocity.x -= walk
		player_spr.play("movimiento_horizontal")
		player_spr.flip_h = true
	if _input_release():
		player_spr.play("idle")



func impulso():
	velocity.y = -vel_salto


func _input_release():
	return Input.is_action_just_released("ui_right") or Input.is_action_just_released("ui_left")

func _input_up():
	return Input.is_action_pressed("ui_up") && can_climb

func can_climb_up(cadena_pos):
	if _input_up():
		position.y -= 1
