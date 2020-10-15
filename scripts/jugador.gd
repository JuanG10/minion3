extends KinematicBody2D

export (int) var id

# Variables internas.
const speed:int = 100
var velocity:Vector2

# Obtención de otros Nodos.
onready var player_spr:AnimatedSprite = $character_col/character_spr

# Para cambio de personajes.
onready var next_character_id = id + 1
var control_switch = false

func _ready():
	add_to_group("characters")
	if id == 0:
		add_to_group("controllable_characters") # Solo se agrega Jugador.
		control_switch = true
		player_spr.play("idle")
	else:
		player_spr.play("off")

func _physics_process(delta):
	_get_input()
	move_and_slide(velocity)

func _get_input()->void: # Obtiene el input para moverse o caer.
	velocity = Vector2()
	if !is_on_floor(): velocity.y += 1
	if control_switch:
		if Input.is_action_pressed('ui_right'): _move_left()
		if Input.is_action_pressed('ui_left'): _move_right()
		if _input_release(): player_spr.play("idle")
	velocity = velocity.normalized() * speed

func _input_release()->bool: # Chequea si se sueltan teclas direccionales.
	return Input.is_action_just_released("ui_right") or Input.is_action_just_released("ui_left")

func _move_left()->void:
	velocity.x += 1
	player_spr.play("movimiento_horizontal")
	player_spr.flip_h = false
	
func _move_right()->void:
	velocity.x -= 1
	player_spr.play("movimiento_horizontal")
	player_spr.flip_h = true

func _unhandled_input(event)->void: # Atrapa TAB y ve si cambia personajes.
	if event is InputEventKey && event.is_action_pressed("ui_focus_next") && control_switch:
		_check_if_can_change()
		player_spr.play("idle")

func _check_if_can_change()->void: # Pasa el control al siguiente personaje.
	var characters_group = get_tree().get_nodes_in_group("controllable_characters")
	control_switch = false
	if next_character_id >= characters_group.size() - 1:
		get_tree().call_group("controllable_characters","change_control", 0)
	else:
		get_tree().call_group("controllable_characters","change_control", next_character_id)

func change_control(next_id:int)->void: # Si es el siguiente se controla.
	if id == next_id: control_switch = true

func activate(id_list:Array)->void:
	if id_list.has(id): add_to_group("controllable_characters")
