extends Sprite

var velocidad = 800

var aceleracion = 0

onready var jugador = get_parent().get_parent().get_node("Jugador")

var activado

var puede_subir = false

var cant_bajada = 0

func _physics_process(delta):
	aceleracion = velocidad * delta
	if activado && !puede_subir:
		cant_bajada += 1
		movimiento_cadena(10)
	elif !activado && cant_bajada > 0:
		cant_bajada -= 1
		movimiento_cadena(-10)


func movimiento_cadena(n):
	region_rect = Rect2(0,0,region_rect.size.x, aceleracion)
	set_offset(Vector2(get_offset().x,aceleracion / 2))
	velocidad += n

func activar():
	activado    = true
	puede_subir = false

func  desactivar():
	activado    = false
