extends RayCast2D

var collider

func _physics_process(delta):
	collider = get_collider()
	if collider != null && is_colliding() && collider.get_class() != "plataforma_salto":
		get_parent().velocity_to_zero()
		enabled = false
