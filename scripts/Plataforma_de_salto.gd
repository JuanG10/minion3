extends Sprite

var activado = false

func activar():
	activado = true



func _on_Area2D_body_entered(body):
	if(body.get_name() == "Jugador"): 
		if activado:
			frame = 0
			body.impulso()



func _on_Area2D_body_exited(body):
	if(body.get_name() == 'Jugador'):
		frame = 0
