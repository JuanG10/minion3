extends Sprite

var velocidad = 800

var esta_bajando  = false 
var esta_subiendo = false

var aceleracion = 0

func _physics_process(delta):
	position.y = get_parent().get_child(0).region_rect.size.y - 10
	
	
	
func subirBajar():
	region_rect = Rect2(0,0,region_rect.size.x, aceleracion)
	set_offset(Vector2(get_offset().x,aceleracion / 2))
	
