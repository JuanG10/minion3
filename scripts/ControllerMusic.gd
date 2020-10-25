extends Node


func _ready():
	song_music_level()

func song_music_level():
	$Music_tutoriales.play()


func start_bgm_level_1_y_2():
	$Music_tutoriales.stop()
	$Music_level_1.play()


func start_bgm_level_3():
	$Music_level_1.stop()
	$Music_level_3.play()	
