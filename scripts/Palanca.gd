extends "res://scripts/gamehadler.gd"


var puedo_accionar = false


var puedo_desactivar = false

func _ready():
	escenas_a_accionar = get_tree().get_nodes_in_group(acciono)
	$Timer.start()
	$Timer.set_wait_time(1)
 
func _physics_process(delta):
	if puedo_accionar && !puedo_desactivar && Input.is_action_just_pressed("Accionar_palanca") :
		$AnimatedSprite.frame=2 
		activar_plataformas()
		puedo_desactivar = true
	elif puedo_desactivar && Input.is_action_just_pressed("Accionar_palanca"):
		$AnimatedSprite.frame = 4
		desactivar_plataformas()
		puedo_desactivar = false
	


func _on_Area2D_body_entered(body):
	if(get_tree().get_nodes_in_group("characters").has(body)):
		puedo_accionar = true

func _on_Area2D_body_exited(body):
	if(get_tree().get_nodes_in_group("characters").has(body)):
		 puedo_accionar = false
		 puedo_desactivar = false


func cambiar_animacion():
	$AnimatedSprite.frame = 0


func _on_Timer_timeout():
	cambiar_animacion()
