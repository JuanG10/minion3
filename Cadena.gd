extends Sprite

var velocidad = 100

func _physics_process(delta):
	print(delta)
	set_scale(Vector2(get_scale().x,velocidad * delta))
	#transform.scaled(Vector2(get_transform().get_scale().x,500))
	set_offset(Vector2(get_offset().x,velocidad * delta))
	velocidad += 1
	print(get_offset())

