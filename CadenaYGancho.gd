extends Node
export (PackedScene) var cadena_escena

var n = 10

func _process(delta):
	if Input.is_action_just_pressed("ui_up"):
		while(n != 0):
			print(n)
			bajar_cadena()
			n -= 1


func bajar_cadena():
			var cadena = cadena_escena.instance()
			cadena.position = get_child(0).position
			get_child(0).position.y += 1
			get_child(1).position.y += 1
			add_child(cadena)
			
	
