# Experimented with a level transition to make loading the next level a bit less sudden and jarring, never got to work though

extends CanvasLayer

signal scene_changed()

onready var anim_player = $AnimationPlayer
onready var black = $Control/Black

func change_scene(path, delay = 0.5):
	yield(get_tree().create_timer(delay), "timeout")
	anim_player.play("Fade")
	yield(anim_player, "animation_finished")
	assert(get_tree().change_scene(path) == OK)
	anim_player.play_backwards("Fade")
	yield(anim_player, "animation_finished")
	emit_signal("scene_changed")
