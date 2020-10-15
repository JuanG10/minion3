extends Sprite

var bajo_cadena = false
signal accionar 
var puedo_bajar_cadena = false
var puede_subir_cadena = false
var puede_abrir_puerta = false

func _physics_process(delta):
	if Input.is_action_just_pressed("bajar_cadena") && puedo_bajar_cadena:
		frame = 0
		get_parent().get_node("CadenaYGancho").get_child(0).bajar_Cadena()
	elif Input.is_action_just_pressed("subir_cadena") && puede_subir_cadena:
		frame = 4	
		get_parent().get_node("CadenaYGancho").get_child(0).subir_Cadena()
	elif Input.is_action_just_pressed("abrir_puerta") && puede_abrir_puerta:
		get_parent().get_node("Puerta").puerta_abierta()
		frame = 0	


func _on_Area2D_body_entered(body):
	if(body.get_name() == "Jugador"):
		puedo_bajar_cadena = true	
		puede_subir_cadena = true
		puede_abrir_puerta = true

func _on_Area2D_body_exited(body):
	 puedo_bajar_cadena = false
	 puede_subir_cadena = false
	 puede_abrir_puerta = false
