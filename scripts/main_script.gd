extends Node

const name_pos = 0 # Posición de los nombres de los nodos dentro de la matriz
const control_pos = 1 # Lo mismo que name_pos pero con los valores de verdad

var temp_arr
var controllable_characters = []
var next_in_main

func append_and_return_position(character_name, character_bool):
	# Agrega el nombre y booleano del personaje que llamó a la función
	# y devuelve la posición del mismo para que la pueda cambiar después.
	temp_arr = [character_name, character_bool] # Para hacer una matriz.
	controllable_characters.append(temp_arr)
	return controllable_characters.size() - 1

func change_control(position_in_arr):
	# Toma al siguiente en la lista y le cambia su switch de control.
	print("Entra en main: ", controllable_characters)
	controllable_characters[position_in_arr][control_pos] = false
	_select_next(position_in_arr)
	print("Despues del select_next ", controllable_characters[position_in_arr], controllable_characters[position_in_arr + 1])
	next_in_main[control_pos] = true
	get_node(next_in_main[name_pos]).control_switch = true

func _select_next(position_in_arr):
	print("Entra en select_next: ", controllable_characters, " ", position_in_arr, " ", controllable_characters.size())
	if position_in_arr + 1 == controllable_characters.size():
		print("Entra if: ", controllable_characters[position_in_arr])
		next_in_main = controllable_characters[0]
	else:
		print("Entra else: ", controllable_characters[position_in_arr], " posicion: ", position_in_arr)
		next_in_main = controllable_characters[position_in_arr + 1]
		print("Cambia el siguiente: ", next_in_main)
