extends Node

const name_pos = 0 # Posición de los nombres de los nodos dentro de la matriz
const control_pos = 1 # Lo mismo que name_pos pero con los valores de verdad

var temp_arr
var controllable_characters = []
var next_in_main

func append_and_return_position(character_name):
	# Agrega el nombre y booleano del personaje que llamó a la función
	# y devuelve la posición del mismo para que la pueda cambiar después.
	controllable_characters.append(character_name)
	return controllable_characters.size() - 1 # Concordando con pos en array.

func change_control(position_in_arr):
	# Toma al siguiente en la lista y le cambia su switch de control.
	_select_next(position_in_arr)
	get_node(next_in_main).control_switch = true

func _select_next(position_in_arr):
	if position_in_arr == controllable_characters.size() - 1:
		next_in_main = controllable_characters[0]
	else:
		next_in_main = controllable_characters[position_in_arr + 1]
