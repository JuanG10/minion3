extends RayCast2D

onready var cadena = get_parent().get_parent().get_parent().get_node("Cadena")

func _physics_process(delta):
	print(get_collider())
	if get_collider() != null && get_collider().get_class() == "KinematicBody2D":
		print ("entra")
		cadena.puede_subir = true
