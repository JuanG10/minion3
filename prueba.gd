extends Node
export (PackedScene) var cadena_escena



func bajar_cadena():
		var cadena = cadena_escena.instance()
		cadena.position = get_child(0).position
		get_child(0).position.y += 0.1
		get_child(1).position.y += 0.1
		add_child(cadena)
			
	
