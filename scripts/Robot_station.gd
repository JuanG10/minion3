extends Area2D

export (Array, int) var character_id_to_activate:Array
onready var animation:AnimatedSprite =$Robot_station_col/Robot_station_animation

func _on_Robot_station_body_entered(body)->void:
	var characters_group = get_tree().get_nodes_in_group("characters")
	if characters_group.has(body):
		animation.play()
		get_tree().call_group("characters","activate",character_id_to_activate)
