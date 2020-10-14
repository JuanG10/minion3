extends Sprite


var puedo_accionar = false

export (String) var acciono

var escenas_a_accionar 

var puedo_desactivar = false

func _ready():
	
	escenas_a_accionar = get_tree().get_nodes_in_group(acciono)
 
func _physics_process(delta):
	if puedo_accionar && Input.is_action_just_pressed("Accionar_palanca") :
		activar_plataformas()
		puedo_desactivar = true
		puedo_accionar = false
	elif puedo_desactivar && Input.is_action_just_pressed("Accionar_palanca"):
		desactivar_plataformas()
		puedo_accionar = true 
		puedo_desactivar = false
		

func _on_Area2D_body_entered(body):
	if(body.get_name() == "Jugador"):
		puedo_accionar = true

func _on_Area2D_body_exited(body):
	 puedo_accionar = false


func activar_plataformas():
	for escena in escenas_a_accionar:
		escena.activar()

func desactivar_plataformas():
	for escena in escenas_a_accionar:
		escena.desactivar()
	


