extends Control

func _physics_process(delta):
	if Input.is_action_pressed("ui_cancel"):
		get_tree().change_scene("res://Title Screen/Title Screen.tscn")
	
	# For some reason this just never worked on the controls screen, it worked everywhere else but not here, and it's the same exact code
	if Input.is_action_just_pressed("toggle_fullscreen"):
		OS.window_fullscreen = !OS.window_fullscreen
