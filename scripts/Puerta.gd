extends Sprite

var activada = false

func _physics_process(delta):
	if activada:
		$AnimatedSprite.play()
	elif !activada:
		$AnimatedSprite.play("",true)

func activar():
	activada = true

func desactivar():
	activada    = false
