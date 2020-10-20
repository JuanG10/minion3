extends RayCast2D

func _physics_process(delta):
	var collider = get_collider()
	if collider != null:
		print(collider, " ", collider.get_name())
		if collider.get_class() == "KinematicBody2D":
			get_collider().velocity.y = 0
