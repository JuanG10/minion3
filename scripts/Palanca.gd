extends "res://scripts/gamehadler.gd"


var puedo_accionar = false


var puedo_desactivar = false

var baje = false

var body_actual 

func _ready():
	escenas_a_accionar = get_tree().get_nodes_in_group(acciono)
 
func _physics_process(delta):
	if body_actual != null:
		print(body_actual.control_switch)
		if  body_actual.control_switch && !baje && puedo_accionar && !puedo_desactivar && Input.is_action_just_pressed("Accionar_palanca") :
			puedo_desactivar = true
			baje = true
			$AnimatedSprite.frame=2 
			activar_plataformas()
		elif body_actual.control_switch && baje && puedo_desactivar && Input.is_action_just_pressed("Accionar_palanca"):
			$AnimatedSprite.frame = 4
			desactivar_plataformas()
			puedo_desactivar = false
			baje = false
	
func _on_Area2D_body_entered(body):
	if(get_tree().get_nodes_in_group("characters").has(body)):
			puedo_accionar = true
			body_actual = body

func _on_Area2D_body_exited(body):
	if(get_tree().get_nodes_in_group("characters").has(body)):
			puedo_accionar = false
			



func cambiar_animacion():
	$AnimatedSprite.frame = 0


func _on_Timer_timeout():
	cambiar_animacion()
