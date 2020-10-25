extends Node

const LAST_LEVEL = 8

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

func _ready():
	$"Tutorial 1".connect("change_level", self, "on_change_level")

func on_change_level(next_level_id:int)->void:


	var new_level = _instance_level(next_level_id)
	new_level.next_level_id = next_level_id + 1
	new_level.connect("change_level", self, "on_change_level")
	get_child(1).get_tree().change_scene(new_level.resource_path)
	if new_level.name == "Nivel 1":
		$ControllerMusic.start_bgm_level_1_y_2()
	elif new_level.name == "Nivel 3":
		$ControllerMusic.start_bgm_level_3()

#get_tree().change_scene("res://Scenes/Levels/Level "+str(current_stage)+".xml")		
		
func _remove_first_child()->void:
	var hijo_actual = get_child(1)
	remove_child(hijo_actual)
	hijo_actual.queue_free()

func _instance_level(level_id:int)->PackedScene:
	if level_id == LAST_LEVEL:
		return levels_map[0].instance() 
	else: 
		return levels_map[level_id].instance()
