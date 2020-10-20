extends Area2D

var siguiente_nivel

func initialize(escena):
	siguiente_nivel = escena

func _on_Area2D_body_entered(body):
	if body.name == "Jugador":
		Global.goto_scene(siguiente_nivel)
