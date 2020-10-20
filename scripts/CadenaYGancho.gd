extends Node2D

onready var cadena = $Cadena
export (int) var id
func activar():
	cadena.activar()
	

func desactivar():
	cadena.desactivar()
