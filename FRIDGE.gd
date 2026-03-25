extends Node3D

@onready var anim = $AnimationPlayer
var open = false

func _input(event):
	if event.is_action_pressed("ui_accept"): # Space
		toggle_fridge()

func toggle_fridge():
	if open:
		anim.play_backwards("Supermarket fridge 2_001Action")
		anim.play_backwards("Supermarket fridge 2_001Action_001")
	else:
		anim.play("Supermarket fridge 2_001Action")
		anim.play("Supermarket fridge 2_001Action_001")

	open = !open
