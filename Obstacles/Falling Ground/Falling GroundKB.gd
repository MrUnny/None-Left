# Took me a while to understand that the KB means KinematicBody

extends KinematicBody2D

export var fallspeed = 25

var isfalling = false

var vel = Vector2()

func _physics_process(delta):
	if isfalling == true:
		print("Is falling")
