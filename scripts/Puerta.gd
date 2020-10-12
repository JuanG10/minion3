extends Sprite

var activada = false
var desactivada = false

func _physics_process(delta):
	if activada:
		$AnimatedSprite.play()
	elif desactivada && !activada:
		$AnimatedSprite.play("",true)

func activar():
	activada = true

func desactivar():
	desactivada = true
	activada    = false
