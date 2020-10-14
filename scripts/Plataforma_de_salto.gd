extends Sprite


func _on_Area2D_body_entered(body):
	if(body.get_name() == "Jugador"):
		frame = 1 
		body.impulso()



func _on_Area2D_body_exited(body):
	if(body.get_name() == 'Jugador'):
		frame = 0
