extends Node
export (PackedScene) var cadena_escena

var n = 10
var cant_cadenas = 0
var subiendo = false


func _process(delta):
	if Input.is_action_just_pressed("ui_up"):
		$Timer.start(0.1)
	elif Input.is_action_just_pressed("ui_down"):
		$Timer.start(0.1)
		subiendo = true

		

func bajar_cadena():
			#$Timer.start(0.1)
			var cadena = cadena_escena.instance()
			cadena.position = get_child(0).position
			get_child(0).position.y += 5
			get_child(1).position.y += 5
			add_child(cadena)
			cant_cadenas += 1
			print(get_child(cant_cadenas))

			
func subir_cadena():
	if get_child_count()  > 3:
		print(get_child_count())
		print(get_child(cant_cadenas))
		remove_child(get_child(cant_cadenas))
		cant_cadenas -= 1
	
		

	

func _on_Timer_timeout():
	if(n > 0):
		bajar_cadena()
		n -= 1
	elif subiendo:
		subir_cadena()	

   
