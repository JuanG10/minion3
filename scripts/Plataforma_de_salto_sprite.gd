extends Sprite

var activado = false

func activar():
	activado = true

func desactivar():
	activado = false

func _on_Area2D_body_entered(body):
	if(get_tree().get_nodes_in_group("controllable_characters").has(body)): 
		if activado:
			print("holaaa ?")
			body.impulso(self)


func cambiar_frame():
	frame = 1

func _on_Area2D_body_exited(body):
	if(get_tree().get_nodes_in_group("controllable_characters").has(body)):
		frame = 0
