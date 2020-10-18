extends RayCast2D

func _physics_process(delta):
	var collider = get_collider()
	if collider != null && get_collider().get_class() == "KinematicBody2D":
		var alguien = collider
		alguien.velocity.y = 0
