extends Node


func song_music_level():
	$Music_tutoriales.play()

func start_bgm_level_1_y_2():
	$Music_tutoriales.stop()
	$Music_level_1.play()


func start_bgm_level_3():
	$Music_level_1.stop()
	$Music_level_3.play()

func playSongFor(nivel):
	if get_tree().get_nodes_in_group('Niveles_tutoriales').has(nivel) && !$Music_tutoriales.playing:
		song_music_level()
	elif get_tree().get_nodes_in_group('Niveles_basicos').has(nivel) && !$Music_level_1.playing:
		start_bgm_level_1_y_2()	







	
# ControllerMusic.playSongFor(nivel)
# [tuto1,tuto2,tuto3,tuto4] = mission,
# [nivel1,nivel2] = pass_time, [nivel3] = B_3
# Toca la canción de la lista correspondiente.
# Si la música de la lista ya se está reproduciendo no hace nada.

# if lista1.has(level) && !lista1Music.estaReproduciendo:
#	mission.play()
# elif lista2.has...
