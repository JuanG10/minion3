extends Sprite

var activado = false

func activar():
	activado = true

func desactivar():
	activado = false

func _on_Area2D_body_entered(body):
	if(body.get_name() == "Jugador"): 
		if activado:
			print("dsadsasdasdadssdads")
			body.impulso(self)


func cambiar_frame():
	frame = 1

func _on_Area2D_body_exited(body):
	if(body.get_name() == 'Jugador'):
		desactivar()
		frame = 0
