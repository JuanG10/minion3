extends StaticBody2D

export (int) var id

func get_class(): return "plataforma_salto"

func activar():
	$AnimatedSprite.activar()
	
func desactivar():
	$AnimatedSprite.desactivar()
