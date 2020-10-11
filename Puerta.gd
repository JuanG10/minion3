extends Sprite

var puerta_abierta = false
var n = 1


func _physics_process(delta):
	if puerta_abierta:
		$AnimatedSprite.play()
	elif Input.is_action_just_pressed("ui_down"):
		puerta_abierta = false
		$AnimatedSprite.play("",true)

func puerta_abierta():
	puerta_abierta = true

