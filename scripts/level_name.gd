extends Node

export (int) var next_level_id

signal change_level(next_level_id)

func _ready():
	connect("change_level", Global, "on_change_level")
	ControllerMusic.playSongFor(self)
