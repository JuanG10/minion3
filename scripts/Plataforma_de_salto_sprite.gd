extends AnimatedSprite

var activado = false

func activar():
	activado = true
	play("activada")

func desactivar():
	activado = false

func _on_Area2D_body_entered(body):
	if(get_tree().get_nodes_in_group("controllable_characters").has(body)): 
		if activado:
			body.impulso(self)

func cambiar_frame():
	play("normal")

func _on_animation_finished():
	play("activada")
