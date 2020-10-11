extends Sprite

var velocidad = 800
var aceleracion = 0

func _physics_process(delta):
	aceleracion = velocidad * delta
	if Input.is_action_pressed("ui_down"):
		subirBajar()
		velocidad += 10
	if Input.is_action_pressed("ui_up"):
		subirBajar()
		velocidad -= 10

func subirBajar():
	region_rect = Rect2(0,0,region_rect.size.x, aceleracion)
	set_offset(Vector2(get_offset().x,aceleracion / 2))
