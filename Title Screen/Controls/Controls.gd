extends Control

func _physics_process(delta):
	if Input.is_action_pressed("ui_cancel"):
		get_tree().change_scene("res://Title Screen/Title Screen.tscn")
	
	# For some reason this just never worked on the controls screen, it worked everywhere else but not here, and it's the same exact code
	#if Input.is_action_just_pressed("toggle_fullscreen"):
	#	OS.window_fullscreen = !OS.window_fullscreen
	# It didn't work here because the player also has a fullscreen function like this, and they conflict with each other
	# There is now an autoload that toggles fullscreen no matter the scene. Updates, people, updates!
