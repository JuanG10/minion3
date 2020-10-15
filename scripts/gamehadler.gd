extends Node

var activada = false

export (String) var acciono

var escenas_a_accionar 

func activar():
	activada = true

func desactivar():
	activada = false

func activar_plataformas():
	for escena in escenas_a_accionar:
		escena.activar()

func desactivar_plataformas():
	for escena in escenas_a_accionar:
		escena.desactivar()
	



func stop_animation(n):
	if $AnimatedSprite.frame == n:
		$AnimatedSprite.stop()
