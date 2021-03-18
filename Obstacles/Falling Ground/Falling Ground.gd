# This was supposed to be a second obstacle, but it wasn't working right so I gave up (I forgot why it wasn't working right, actually)

extends Area2D

# The problem could be that this is just the _process function while the player is on _physics_process, they're different things, but I don't know
func _process(delta):
	var bodies = get_overlapping_bodies()
	for body in bodies:
		if body.name == "Player":
			$"Falling GroundKB".isfalling == true
