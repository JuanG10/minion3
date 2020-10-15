extends Area2D

export (Array, int) var character_id_to_activate:Array
onready var animation:AnimatedSprite =$Robot_station_col/Robot_station_animation
var was_active = false # Para que solo se active una vez.

func _on_Robot_station_body_entered(body)->void:
	var characters_group = get_tree().get_nodes_in_group("characters")
	if !was_active && characters_group.has(body):
		animation.play("activation")
		get_tree().call_group("characters","activate",character_id_to_activate)
		was_active = true
