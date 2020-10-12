extends Sprite



var velocidad = 800

var aceleracion = 0

var bajar_cadena = 350

var subir_cadena = 350

onready var jugador = get_parent().get_parent().get_node("Jugador")

var activado	 = false

var desactivado  = false 

func _physics_process(delta):
	aceleracion = velocidad * delta
	if activado && bajar_cadena != 0:
		subirBajar()
		velocidad += 10
		bajar_cadena -= 1
		jugador.can_climb_up(position.y)
	elif desactivado && subir_cadena != 0:
		subirBajar()
		velocidad -= 10
		bajar_cadena += 1
		subir_cadena -= 1
		jugador.can_climb_up(position.y)


func subirBajar():
	region_rect = Rect2(0,0,region_rect.size.x, aceleracion)
	set_offset(Vector2(get_offset().x,aceleracion / 2))
	
func activar():
	activado = true

func  desactivar():
	desactivado = true
	activado = false

