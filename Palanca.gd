extends Sprite

var bajo_cadena = false

func _process(delta):
	if Input.is_action_just_pressed("ui_down"):
		frame = 0
		if(!bajo_cadena):
			while(5):
				get_parent().get_node("CadenaYGancho").bajar_cadena()
				get_parent().get_node("CadenaYGancho").bajar_cadena()
