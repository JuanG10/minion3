extends Node2D

onready var cadena = $Cadena
export (int) var limite_bajada

func activar():
	cadena.set_limite_bajada(limite_bajada)
	cadena.activar()
	

func desactivar():
	cadena.desactivar()
