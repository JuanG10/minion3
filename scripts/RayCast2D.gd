extends RayCast2D

onready var cadena = get_parent().get_parent().get_parent().get_node("Cadena")

func _physics_process(delta):
	if get_collider() != null && get_collider().get_class() == "TileMap":
		cadena.puede_subir = true
