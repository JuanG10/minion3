extends "res://scripts/gamehadler.gd"

export (int) var id

signal sound

var emit_once = true

func _physics_process(delta):
	if activada:
		if emit_once:
			emit_signal("sound")
			emit_once = false
		$AnimatedSprite.play()
		$CollisionShape2D.disabled = false
		stop_animation(3)
	else:
		if !emit_once:
			emit_signal("sound")
			emit_once = true
		$AnimatedSprite.play("",true)
		$CollisionShape2D.disabled = true
		stop_animation(0)

func _on_Rejilla_sound():
	ControllerMusic.start_rejillas_sfx()
