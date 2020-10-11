extends CollisionShape2D

onready var cadena = get_parent().get_parent()
var cadena_pos

func _physics_process(delta):
	# Ej: (cadena_pos(15) / 15 = 1)
	cadena_pos = cadena.region_rect.size.y
	if (int(cadena_pos) % 15 == 0):
		position.y += 1
		scale.y = cadena_pos / 15
