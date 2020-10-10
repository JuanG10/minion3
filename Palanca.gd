extends Sprite

var bajo_cadena = false

func _process(delta):
	if Input.is_action_just_pressed("ui_down"):
		frame = 0
		get_parent().get_node("CadenaYGancho").bajar_cadena()
			
