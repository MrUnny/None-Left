extends Node

# Please ignore the rant I went on about myself not putting nodes in variables in "Player.gd"

# I made this whole thing just so music didn't stop playing when going between settings/controls in the Main Menu

func PlayMusic(music):
	var loadedMusic = load(music)
	$Music.stream = loadedMusic
	$Music.play()

func StopMusic():
	$Music.stop()

func IsMusicPlaying():
	# This is definitely a candidate for r/badcode
	if $Music.playing == true:
		return true
	else:
		return false

func _notification(what):
	match what:
		NOTIFICATION_WM_FOCUS_OUT:
			AudioServer.set_bus_mute(0, true)
		NOTIFICATION_WM_FOCUS_IN:
			AudioServer.set_bus_mute(0, false)
