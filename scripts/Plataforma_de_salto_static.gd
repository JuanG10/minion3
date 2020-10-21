extends StaticBody2D

export (int) var id

func get_class(): return "plataforma_salto"

func activar():
	$Sprite.activar()
	
func desactivar():
	$Sprite.desactivar()
