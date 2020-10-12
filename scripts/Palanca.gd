extends Sprite


var puedo_accionar = false
var desactivado    = 1

export (PackedScene) var scene


var escena_actual 

func _ready():
	escena_actual = get_parent().get_node(scene.instance().get_name())
	
	
func _physics_process(delta):
	print(escena_actual)
	if puedo_accionar(1):
		escena_actual.activar()
		desactivado +=1
	elif puedo_accionar(0):
		escena_actual.desactivar()
		desactivado +=1
	

func _on_Area2D_body_entered(body):
	if(body.get_name() == "Jugador"):
		puedo_accionar = true


func _on_Area2D_body_exited(body):
	 puedo_accionar = false


func puedo_accionar(n):
	return Input.is_action_just_pressed("Accionar_palanca") && puedo_accionar && fmod(desactivado,2) == n
