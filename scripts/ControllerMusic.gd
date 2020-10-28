extends Node

func _start_tutorial_bgm():
	$Music_tutoriales.play()

func _start_basic_bgm():
	$Music_tutoriales.stop()
	$Music_basicos.play()

func _start_complex_bgm():
	$Music_basicos.stop()
	$Music_complejos.play()

func playSongFor(nivel):
	if get_tree().get_nodes_in_group('Niveles_tutoriales').has(nivel) && !$Music_tutoriales.playing:
		_start_tutorial_bgm()
	elif get_tree().get_nodes_in_group('Niveles_basicos').has(nivel) && !$Music_basicos.playing:
		_start_basic_bgm()
	elif get_tree().get_nodes_in_group('Niveles_complejos').has(nivel) && !$Music_complejos.playing:
		_start_complex_bgm()
