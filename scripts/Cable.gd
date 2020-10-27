extends Line2D

export (int) var id

onready var initial_default = default_color
const COLOR_ACTIVADO = Color(255,79,120)

func activar():
	default_color = COLOR_ACTIVADO

func desactivar():
	default_color = initial_default
