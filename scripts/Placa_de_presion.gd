extends Sprite

var puede_accionar = false 

export (String) var accionar 

var  escenas_actuales

func _ready():
	escenas_actuales = get_tree().get_nodes_in_group(accionar)

func _physics_process(delta):
	if puede_accionar:
		frame = 1 
		activar()
	else:
		frame = 0
		desactivar()


func _on_Area2D_body_entered(body):
	if(get_tree().get_nodes_in_group("characters").has(body)):
		puede_accionar = true

func activar():
	for escena_actual in escenas_actuales:
		escena_actual.activar()

func desactivar():
	for escena_actual in escenas_actuales:
		escena_actual.desactivar()	

func _on_Area2D_body_exited(body):
	if(get_tree().get_nodes_in_group("characters").has(body)):
		puede_accionar = false 
