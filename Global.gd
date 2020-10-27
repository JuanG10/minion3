extends Node

var levels_map = {
	0: preload("res://escenas/niveles/youwin.tscn"),
	1: preload("res://escenas/niveles/Tutorial 1 mecanicas_basicas.tscn"),
	2: preload("res://escenas/niveles/Tutorial 2 placa_de_salto_y_puentes.tscn"),
	3: preload("res://escenas/niveles/Tutorial 3 robots.tscn"),
	4: preload("res://escenas/niveles/Tutorial 4 placas_de_presion.tscn"),
	5: preload("res://escenas/niveles/Nivel 1.tscn"),
	6: preload("res://escenas/niveles/Nivel 2.tscn"),
	7: preload("res://escenas/niveles/Nivel 3.tscn")
}

func on_change_level(next_id)->void:
	print("llega aqui")
	get_tree().change_scene_to(levels_map[next_id])
