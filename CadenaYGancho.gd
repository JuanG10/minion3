extends Node
export (PackedScene) var cadena_escena

var n = 50

func _process(delta):
	if Input.is_action_just_pressed("ui_up"):
		$Timer.start(0.1)

		

func bajar_cadena():
			$Timer.start(0.1)
			var cadena = cadena_escena.instance()
			cadena.position = get_child(0).position
			get_child(0).position.y += 1
			get_child(1).position.y += 1
			add_child(cadena)

			
	

	

func _on_Timer_timeout():
	if(n > 0):
		bajar_cadena()
		n -= 1

   
