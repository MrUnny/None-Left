extends KinematicBody2D

export var speed = 50

var vel = Vector2()

func _physics_process(delta):
	vel.y = -speed
	
	vel = move_and_slide(vel)
