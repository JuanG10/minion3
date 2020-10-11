extends Sprite

var bajo_cadena = false
signal accionar 

func _physics_process(delta):
	if frame == 1:
		#bajar cadena
		pass
	elif frame == 2:
		#subirCadena
		pass


func _on_Area2D_body_entered(body):
	if(body.get_name() == "Jugador"):
		pass
	
