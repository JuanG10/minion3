extends Area2D

func _on_temp_area_body_entered(body):
	if get_tree().get_nodes_in_group("characters").has(body):
		body.is_on_platform = true


func _on_temp_area_body_exited(body):
	if get_tree().get_nodes_in_group("characters").has(body):
		body.is_on_platform = false
