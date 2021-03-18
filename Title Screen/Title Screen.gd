extends Control

func _physics_process(delta):
	if Input.is_action_just_pressed("toggle_fullscreen"):
		OS.window_fullscreen = !OS.window_fullscreen

func _on_Quit_pressed():
	get_tree().quit()

func _on_Controls_pressed():
	get_tree().change_scene("res://Title Screen/Controls/Controls.tscn")

func _on_Start_Game_pressed():
	get_tree().change_scene("res://Levels/Level 1/Level 1.tscn")
