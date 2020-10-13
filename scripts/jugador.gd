extends KinematicBody2D

# Variables internas.
const speed = 100
var velocity = Vector2()
var can_climb = false

# Obtención de otros Nodos.
onready var player_spr = $character_col/character_spr
onready var main = get_parent()

# Relacionado al control.
var control_switch = false
var position_in_main

func _ready():
	initialize_character()
	player_spr.play("idle")

func _physics_process(delta):
	get_input()
	move_and_slide(velocity)

func initialize_character(): # Asigna el control inicial de los personajes.
	if name == "Jugador": # El primero en ser controlado debe ser el jugador.
		control_switch = true
	position_in_main = main.append_and_return_position(name)

func get_input(): # Obtiene el input para moverse o caer.
	velocity = Vector2()
	if control_switch:
		if !is_on_floor() && !can_climb:
			velocity.y += 1
		if Input.is_action_pressed('ui_right'):
			_move_left()
		if Input.is_action_pressed('ui_left'):
			_move_right()
		if _input_release():
			player_spr.play("idle")
		change_control_to_next()
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

func change_control_to_next(): # Cambia de personaje si se pulsa Tab.
	print(name, " ", Input.is_action_just_pressed("ui_focus_next") && control_switch)
	if Input.is_action_just_pressed("ui_focus_next") && control_switch:
		control_switch = false
		main.change_control(position_in_main)
		player_spr.play("idle")

func can_climb_up():
	if Input.is_action_pressed("ui_up") && can_climb:
		position.y -= 1
