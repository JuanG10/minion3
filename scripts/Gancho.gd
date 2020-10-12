extends Sprite

func _physics_process(delta):
	position.y = get_parent().get_child(0).region_rect.size.y - 10
