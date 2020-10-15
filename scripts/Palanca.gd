extends "res://scripts/gamehadler.gd"


var puedo_accionar = false


var puedo_desactivar = false

func _ready():
	escenas_a_accionar = get_tree().get_nodes_in_group(acciono)
 
func _physics_process(delta):
	if puedo_accionar && !puedo_desactivar && Input.is_action_just_pressed("Accionar_palanca") :
		$AnimatedSprite.frame = 4
		activar_plataformas()
		puedo_desactivar = true
		stop_animation(2)
		$AnimatedSprite.frame = 2
	elif puedo_desactivar && Input.is_action_just_pressed("Accionar_palanca"):
		$AnimatedSprite.frame = 1
		desactivar_plataformas()
		stop_animation(0)
		puedo_desactivar = false
		


func _on_Area2D_body_entered(body):
	if(body.get_name() == "Jugador"):
		puedo_accionar = true

func _on_Area2D_body_exited(body):
	 puedo_accionar = false
	 puedo_desactivar = false



