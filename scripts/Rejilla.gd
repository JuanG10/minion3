extends "res://scripts/gamehadler.gd"

export (int) var id 
func _physics_process(delta):
	if activada:
		$AnimatedSprite.play()
		$CollisionShape2D.disabled = false
		stop_animation(3)
	else:
		$AnimatedSprite.play("",true)
		$CollisionShape2D.disabled = true
		stop_animation(0)
