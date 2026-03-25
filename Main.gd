extends Node3D

var xr_interface: XRInterface
@onready var anim: AnimationPlayer = $"Root Scene"/AnimationPlayer

func _ready():
	xr_interface = XRServer.find_interface("OpenXR")

	if xr_interface:
		var success = xr_interface.initialize()

		if success:
			print("OpenXR initialised successfully")
			DisplayServer.window_set_vsync_mode(DisplayServer.VSYNC_DISABLED)
			get_viewport().use_xr = true

			var anim_name = "mixamo_com"

			if anim.has_animation(anim_name):
				var a = anim.get_animation(anim_name)
				if a != null:
					a.loop_mode = Animation.LOOP_LINEAR

				anim.play(anim_name)
				print("Playing animation: ", anim_name)
			else:
				print("Animation not found: ", anim_name)
				print("Available animations: ", anim.get_animation_list())

		else:
			print("Failed to initialise OpenXR")
	else:
		print("OpenXR interface not found")
