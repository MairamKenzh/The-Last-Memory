extends Node3D

@onready var anim = $AnimationPlayer
var open = false

func _input(event):
	if event.is_action_pressed("ui_accept"):
		toggle_door()

func toggle_door():
	if open:
		anim.play_backwards("DoorAction")
	else:
		anim.play("DoorAction")

	open = !open
