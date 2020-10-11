extends Sprite

var puerta_abierta = false
var puerta_cerrada = false


func _physics_process(delta):
	if puerta_abierta:
		$AnimatedSprite.play()
	elif puerta_cerrada:
		$AnimatedSprite.play("",true)

func puerta_abierta():
	puerta_abierta = true

func puerta_cerrada():
	puerta_abierta = false 
	puerta_cerrada = true
