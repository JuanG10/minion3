extends Sprite

var velocidad = 1000

func _physics_process(delta):
	print(delta)
	region_rect = Rect2(0, 0, 2,  velocidad  * delta)
	set_offset(Vector2(get_offset().x,(velocidad  * delta)/ 2))
	velocidad += 10
	print(get_offset())

