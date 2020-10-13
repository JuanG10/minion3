extends Node

const name_pos = 0 # Posición de los nombres de los nodos dentro de la matriz
const control_pos = 1 # Lo mismo que name_pos pero con los valores de verdad

var temp_arr
var controllable_characters = []
var next_in_main

var i = 0

func append_and_return_position(character_name, character_bool):
	# Agrega el nombre y booleano del personaje que llamó a la función
	# y devuelve la posición del mismo para que la pueda cambiar después.
	temp_arr = [character_name, character_bool] # Para hacer una matriz.
	controllable_characters.append(temp_arr)
	return controllable_characters.size() - 1 # Concordando con pos en array.

func change_control(position_in_arr):
	i += 1
	# Toma al siguiente en la lista y le cambia su switch de control.
	controllable_characters[position_in_arr][control_pos] = false
	_select_next(position_in_arr)
	next_in_main[control_pos] = true
	print("Despues del select_next ", i, ": ", controllable_characters[position_in_arr], next_in_main, " posicion: ", position_in_arr, " size: ",controllable_characters.size())
	get_node(next_in_main[name_pos]).control_switch = true

func _select_next(position_in_arr):
	if position_in_arr + 1 == controllable_characters.size():
		next_in_main = controllable_characters[0]
	else:
		next_in_main = controllable_characters[position_in_arr + 1]
