# Why wasn't this used more?

extends Area2D

func _physics_process(delta):
	var bodies = get_overlapping_bodies()
	for body in bodies:
		if body.name == "Player":
			$Message.set_visible_characters(-1)
