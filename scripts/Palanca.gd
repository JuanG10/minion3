extends "res://scripts/gamehadler.gd"


var puedo_accionar = false

var puedo_desactivar = false

var body_actual 

export (int) var id


func _ready():
	iniciar_activado()
	escenas_a_accionar()

func iniciar_activado():
	if activada:
		puedo_desactivar = true


func escenas_a_accionar():
	var escenas = get_tree().get_nodes_in_group(acciono)
	for scene in escenas:
		if (scene.id == id):
			escenas_a_accionar.append(scene)


 
func _physics_process(delta):
	if body_actual != null:
		if body_actual.control_switch && puedo_accionar && !puedo_desactivar && Input.is_action_just_pressed("Accionar_palanca") :
			ControllerMusic.start_switch_sfx()
			puedo_desactivar = true
			$AnimatedSprite.frame=2 
			activar_plataformas()
		elif body_actual.control_switch && puedo_desactivar && Input.is_action_just_pressed("Accionar_palanca"):
			ControllerMusic.start_switch_sfx()
			$AnimatedSprite.frame = 4
			desactivar_plataformas()
			puedo_desactivar = false

func _on_Area2D_body_entered(body):
	if(get_tree().get_nodes_in_group("characters").has(body)):
			puedo_accionar = true
			body_actual = body

func _on_Area2D_body_exited(body):
	if(get_tree().get_nodes_in_group("characters").has(body)):
			puedo_accionar = false
			body_actual = null



func cambiar_animacion():
	$AnimatedSprite.frame = 0


func _on_Timer_timeout():
	cambiar_animacion()
