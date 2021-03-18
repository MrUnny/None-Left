extends Area2D

#https://www.reddit.com/r/godot/comments/azefmi/how_do_i_make_spikes/ei9q5ju?utm_source=share&utm_medium=web2x
func _on_Spike_body_entered(node):
	if node.has_method("die"):
		node.die()
