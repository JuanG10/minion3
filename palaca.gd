extends Sprite



var  frame_actual = 0

func _process(delta):
	if Input.is_action_just_pressed("ui_down"):
		frame = 0


func _on_Area2D_body_entered(body):
	if body.name == "Player":
		frame = frame_actual
		frame_actual +=2
		  
