extends Area2D


func _on_Bottomless_Pit_body_entered(node):
	if node.has_method("die"):
		node.die()
