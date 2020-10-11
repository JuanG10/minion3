extends Area2D

func _on_jugador_body_entered(body):
	if body.get_name() == 'Jugador':
		body.can_climb = true

func _on_jugador_body_exited(body):
	if body.get_name() == 'Jugador':
		body.can_climb = false
