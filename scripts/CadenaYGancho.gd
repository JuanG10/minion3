extends Node2D

var cadena 

func _ready():
	cadena = get_child(0)

func activar():
	cadena.activar()
	

func desactivar():
	cadena.desactivar()
