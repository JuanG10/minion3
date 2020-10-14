extends StaticBody2D

var activada = false
var desactivada = false

func _physics_process(delta):
	if activada:
		$AnimatedSprite.play()
		$CollisionShape2D.disabled = false
		stop_animation(3)
	elif desactivada:
		$AnimatedSprite.play("",true)
		$CollisionShape2D.disabled = true
		stop_animation(0)
		
		
		
		
func activar():
	activada = true
	desactivada = false

func desactivar():
	desactivada = true
	activada = false

func stop_animation(n):
	if $AnimatedSprite.frame == n:
		$AnimatedSprite.stop()
