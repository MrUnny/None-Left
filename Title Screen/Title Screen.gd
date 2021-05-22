extends Control

onready var quitButton = $Quit

func _ready():
	if !MusicController.IsMusicPlaying():
		MusicController.PlayMusic("res://Sounds/Music/Title Screen.ogg")
	
	if OS.get_name() == "HTML5":
		quitButton.disabled = true
		quitButton.visible = false

func _on_Quit_pressed():
	get_tree().quit()

func _on_Controls_pressed():
	get_tree().change_scene("res://Title Screen/Controls/Controls.tscn")
	print("Changed scene")

func _on_Settings_pressed():
	get_tree().change_scene("res://Title Screen/Settings/Settings.tscn")

func _on_Start_Game_pressed():
	MusicController.StopMusic()
	get_tree().change_scene("res://Levels/Level 1/Level 1.tscn")
