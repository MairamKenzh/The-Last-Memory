extends Node3D

@onready var anim = $character/AnimationPlayer

func _ready():
	anim.play("mixamo_com")
