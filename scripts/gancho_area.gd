extends Area2D

func _on_jugador_area_body_entered(body):
	if body.name == "Jugador":
		body.can_climb = true

func _on_jugador_area_body_exited(body):
	if body.name == "Jugador":
		body.can_climb = false
