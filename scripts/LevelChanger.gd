extends Area2D

func _on_Area2D_body_entered(body):
	var padre = get_parent()
	if body.name == "Jugador":
		padre.emit_signal("change_level",padre.next_level_id)
