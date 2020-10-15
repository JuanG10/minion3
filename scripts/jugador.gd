extends KinematicBody2D

export (int) var id

# Variables internas.
const SPEED:int = 100
const vel_salto = 120
var velocity:Vector2
var impulso = false

# Obtención de otros Nodos.
onready var player_spr:AnimatedSprite = $character_col/character_spr

# Para cambio de personajes.
const ID_JUGADOR = 0
onready var next_character_id = id + 1
var control_switch = false

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

func _get_input()->void: # Obtiene el input para moverse o caer.
	if control_switch:
		if Input.is_action_pressed('ui_right'): _move_left()
		if Input.is_action_pressed('ui_left'): _move_right()
		if _input_release(): player_spr.play("idle")

func impulso()->void:
	velocity.y = -vel_salto

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

func _state_change(): # Cambia variables del personaje.
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
	var new_timer_name = "timer" + name
	var new_mark_name = "mark" + name
	if id == next_id:
		control_switch = true
		if !get_tree().get_root().has_node(new_timer_name) && !get_tree().get_root().has_node(new_mark_name):
			start_exclamation_mark(position)

func activate(id_list:Array)->void: # Agrega al grupo de controlables si puede.
	if id_list.has(id): 
		add_to_group("controllable_characters")
		start_question_mark(position)
		player_spr.play("idle")

## Quiero separar este código
onready var exclamation = preload("res://sprites/exclamation.png")
onready var question = preload("res://sprites/question.png")

const START_HEIGHT:Vector2 = Vector2(0,12)

func start_question_mark(pos:Vector2)->void:
	_create_mark(pos,question)

func start_exclamation_mark(pos:Vector2)->void:
	_create_mark(pos,exclamation)

func _create_mark(pos:Vector2, image)->void:
	var root = get_tree().get_root()
	var timer:Timer = _create_timer()
	var new_mark = _create_sprite(image)
	root.add_child(new_mark)
	root.add_child(timer)
	timer.start()
	new_mark.position = pos - START_HEIGHT

func _create_timer()->Timer:
	var new_name = "timer" + name
	var new_timer:Timer = Timer.new()
	new_timer.set_one_shot(true)
	new_timer.set_wait_time(0.4)
	new_timer.connect("timeout",self,"_on_timer_timeout")
	new_timer.set_name(new_name)
	return new_timer

func _create_sprite(image)->Sprite:
	var new_name = "mark" + name
	var new_mark = Sprite.new()
	new_mark.texture = image
	new_mark.set_name(new_name)
	return new_mark

func _on_timer_timeout()->void:
	var mark_name = "mark" + name
	var timer_name = "timer" + name
	var root = get_tree().get_root()
	root.get_node(mark_name).queue_free()
	root.get_node(timer_name).queue_free()
