extends Sprite

var puede_accionar = false 

export (String) var accionar 

export (int) var id

var gente_sobre_placa = []

var escenas_actuales = []

var _esta_accionado = false

func _ready():
	escenas_a_accionar()
		
		
func escenas_a_accionar():
	var escenas_a_accionar = get_tree().get_nodes_in_group(accionar)
	for escena in escenas_a_accionar:
		if (escena.id == id):
			escenas_actuales.append(escena)
					
func _physics_process(delta):
	if puede_accionar:
		frame = 1
		if !_esta_accionado:
			activar()
			_esta_accionado = true
	else:
		frame = 0
		desactivar()
		_esta_accionado = false


func _on_Area2D_body_entered(body):
	if(get_tree().get_nodes_in_group("characters").has(body)):
		ControllerMusic.start_switch_sfx()
		gente_sobre_placa.push_front(0) # No paso el body por costo.
		puede_accionar = true

func activar():
	for escena_actual in escenas_actuales:
		escena_actual.activar()

func desactivar():
	for escena_actual in escenas_actuales:
		escena_actual.desactivar()

func _on_Area2D_body_exited(body):
	if(get_tree().get_nodes_in_group("characters").has(body)) && gente_sobre_placa.size() == 1:
		ControllerMusic.start_switch_sfx()
		puede_accionar = false
	gente_sobre_placa.pop_front()
