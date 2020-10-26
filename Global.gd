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
	get_tree().change_scene_to(levels_map[next_id])
	var level_node_name = get_tree().get_root().get_child(2).name
	print(level_node_name)
	if level_node_name == "Tutorial 4":
		ControllerMusic.start_bgm_level_1_y_2()
	elif level_node_name == "Nivel 2":
		ControllerMusic.start_bgm_level_3()

# ControllerMusic.playSongFor(nivel)
# [tuto1,tuto2,tuto3,tuto4] = mission,
# [nivel1,nivel2] = pass_time, [nivel3] = B_3
# Toca la canción de la lista correspondiente.
# Si la música de la lista ya se está reproduciendo no hace nada.

# if lista1.has(level) && !lista1Music.estaReproduciendo:
#	mission.play()
# elif lista2.has...
