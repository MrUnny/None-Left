extends Control

# "Oh wow, this looks terrible" -Funny Swedish Gamer (but not PewDiePie)

func _input(event):
	if Input.is_action_pressed("ui_cancel"):
		get_tree().change_scene("res://Title Screen/Title Screen.tscn")

func _ready():
	if AudioServer.is_bus_mute(2):
		$MuteMusic.text = "Unmute Music"
		$MuteMusic.pressed = true
	if AudioServer.is_bus_mute(1):
		$MuteSFX.text = "Unmute SFX"
		$MuteSFX.pressed = true

func _on_MuteMusic_toggled(button_pressed):
	if button_pressed:
		$MuteMusic.text = "Unmute Music"
		AudioServer.set_bus_mute(2, true)
	else:
		$MuteMusic.text = "Mute Music"
		AudioServer.set_bus_mute(2, false)

func _on_MuteSFX_toggled(button_pressed):
	if button_pressed:
		$MuteSFX.text = "Unmute SFX"
		AudioServer.set_bus_mute(1, true)
	else:
		$MuteSFX.text = "Mute SFX"
		AudioServer.set_bus_mute(1, false)

func _on_MainMenu_pressed():
	get_tree().change_scene("res://Title Screen/Title Screen.tscn")
