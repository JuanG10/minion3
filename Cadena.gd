extends Sprite

var velocidad = 800

var esta_bajando  = false 
var esta_subiendo = false

var aceleracion = 0

var bajar_cadena = 350

var subir_cadena = 350


func _physics_process(delta):
	aceleracion = velocidad * delta
	if bajar_cadena > 0 && esta_bajando:
		subirBajar()
		velocidad += 10
		bajar_cadena -= 1
	if subir_cadena > 0 && esta_subiendo:
		subirBajar()
		velocidad -= 10
		bajar_cadena += 1
		subir_cadena -= 1


func activar():
	region_rect = Rect2(0,0,region_rect.size.x, aceleracion)
	set_offset(Vector2(get_offset().x,aceleracion / 2))
func subirBajar():
	region_rect = Rect2(0,0,region_rect.size.x, aceleracion)
	set_offset(Vector2(get_offset().x,aceleracion / 2))
	
func bajar_Cadena():
	esta_bajando = true 
	esta_subiendo = false
	
func subir_Cadena():
	esta_subiendo = true
	esta_bajando = false

