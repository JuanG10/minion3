extends "res://scripts/Signs.gd"

export (int) var id

# Variables internas.
const SPEED:int = 100
const vel_salto = 120
var velocity:Vector2
var impulso = false
var plataforma_de_salto 

# Obtención de otros Nodos.
onready var player_spr:AnimatedSprite = $character_col/character_spr

# Para cambio de personajes.
const ID_JUGADOR:int = 0
onready var next_character_id:int = id + 1
var control_switch:bool = false
onready var _sign_name:String = "sign" + name
onready var _timer_name:String = "timer" + name

func _ready():
	add_to_group("characters")
	if id == ID_JUGADOR: # Solo se agrega Jugador.
		add_to_group("controllable_characters")
		control_switch = true
		player_spr.play("idle")
	else:
		player_spr.play("off")

func _physics_process(delta): 
	velocity.x = 0
	velocity.y += SPEED * delta
	_get_input()
	move_and_slide(velocity,Vector2(0,-1))
	print(impulso)
	if(Input.is_action_just_pressed("Impulso")) && impulso:
			print("entra?")
			velocity.y = -vel_salto
			plataforma_de_salto.cambiar_frame()
			impulso = false
		

func _get_input()->void: # Obtiene el input para moverse o caer. 
	if control_switch:
		if Input.is_action_pressed('ui_right'): _move_left()
		if Input.is_action_pressed('ui_left'): _move_right()
		if _input_release(): player_spr.play("idle")


func impulso(plataforma)->void: # Lo llama la plataforma de salto.
	impulso = true
	plataforma_de_salto = plataforma

func _input_release()->bool: # Chequea si se sueltan teclas direccionales.
	return Input.is_action_just_released("ui_right") or Input.is_action_just_released("ui_left")

func _move_left()->void:
	velocity.x += SPEED
	player_spr.play("movimiento_horizontal")
	player_spr.flip_h = false
	
func _move_right()->void:
	velocity.x -= SPEED
	player_spr.play("movimiento_horizontal")
	player_spr.flip_h = true

func _unhandled_input(event)->void: # Atrapa el input y ve si cambia personajes.
	if _press_next(event):
		var controllable_group = get_tree().get_nodes_in_group("controllable_characters")
		if controllable_group.size() <= 1: return # Que no ejecute todo si solo esta el jugador.
		_state_change()
		_check_change_control(controllable_group)

func _press_next(event)->bool: # Chequea input y variables de cambio de personaje.
	return event is InputEventKey && event.is_action_pressed("ui_focus_next") && control_switch

func _state_change()->void: # Cambia variables del personaje.
	control_switch = false
	player_spr.play("idle")

func _check_change_control(controllable_group:Array)->void: # Revisa a quien darle el control.
	if !_exist_id_in(controllable_group,next_character_id):
		get_tree().call_group("controllable_characters","change_control", ID_JUGADOR)
	else:
		get_tree().call_group("controllable_characters","change_control", next_character_id)

func _exist_id_in(group:Array,next_id:int)->bool: # Busca el id en el grupo.
	var boolean = false
	for character in group: boolean = boolean || character.id == next_id
	return boolean

func change_control(next_id:int)->void: # Si es el siguiente se controla.
	var root:Node = get_tree().get_root()
	if id == next_id:
		control_switch = true
		if !root.has_node(_sign_name):
			start_exclamation_sign(position, _timer_name, _sign_name)

func activate(id_list:Array)->void: # Agrega al grupo de controlables si puede.
	if id_list.has(id): 
		add_to_group("controllable_characters")
		start_question_sign(position, _timer_name, _sign_name)
		player_spr.play("idle")
