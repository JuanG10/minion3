extends Sprite

var puede_accionar = false 

export (PackedScene) var scene

var  escena_actual 

func _ready():
	escena_actual = get_parent().get_node(scene.instance().get_name())

func _physics_process(delta):
	if puede_accionar:
		frame = 1 
		escena_actual.activar()
	else:
		frame = 0
		escena_actual.desactivar()


func _on_Area2D_body_entered(body):
	if(body.get_name() == "Jugador"):
		puede_accionar = true



func _on_Area2D_body_exited(body):
	if(body.get_name() == "Jugador"):
		puede_accionar = false 
