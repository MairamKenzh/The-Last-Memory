extends Node3D

var xr_interface: XRInterface
@onready var anim: AnimationPlayer = get_node_or_null("Character/AnimationPlayer")

func _ready():
	print("Scene started")

	xr_interface = XRServer.find_interface("OpenXR")

	if xr_interface == null:
		print("OpenXR interface not found")
		return

	var success = xr_interface.initialize()
	if not success:
		print("Failed to initialise OpenXR")
		return

	print("OpenXR initialised successfully")
	DisplayServer.window_set_vsync_mode(DisplayServer.VSYNC_DISABLED)
	get_viewport().use_xr = true

	var anim_name = "mixamo_com"

	if anim == null:
		print("AnimationPlayer not found at anas/AnimationPlayer")
		return

	if not anim.has_animation(anim_name):
		print("Animation not found: ", anim_name)
		print("Available animations: ", anim.get_animation_list())
		return

	var a = anim.get_animation(anim_name)
	if a != null:
		a.loop_mode = Animation.LOOP_LINEAR

	anim.play(anim_name)
	print("Animation started")
