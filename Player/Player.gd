# Should I clean it up and make it better/more optimized before I put it on GitHub?
# ...Nah
# I'll just add more comments so people can understand the terrible code I wrote (I don't know how I even understand most of this)

extends KinematicBody2D

# snake_case? camelCase? PascalCase? Never heard of them. And don't worry, EVERY variable is like this. I call it... stupidcase
export var speed = 100 
export var jumppower = 150
export var gravity = 10
export var canmove = true # This is an exported variable (public variable, for Unity users) for... some reason

const UP = Vector2(0, -1)
var vel = Vector2() # For whatever reason I didn't like long variable names
var canrestart = false
var candie = true


# WHAT THE FUCK DID I DO WHY DIDN'T I PUT ANY VARIABLES FOR THE NODES I HAD 10 DAYS LEFT I WASN'T IN A TIME CRUNCH WHY WHY WHY WHY WHY WHY WHY
# I'm lucky I didn't do it too much so the game still runs fine. But still, Why?!
func die():
	if candie:
		#$Explosion.set_emitting(true)
		$AnimationPlayer.play("die")
		canmove = false
		canrestart = true
		$Camera2D/died.set_visible_characters(-1)
		$Camera2D/restart.set_visible_characters(-1)
		$Audio/HurtSFX.play() # I still don't know why I called it "HurtSFX", you didn't have more than 1 HP. I mean, I guess you get hurt so badly you die..?
		candie = false

func _ready():
	$Camera2D/died.set_visible_characters(0)
	$Camera2D/restart.set_visible_characters(0)
	#Hides the restart prompt when the level starts
	
func _physics_process(delta):
	vel.y += gravity
	
	#Moving left and right
	if Input.is_action_pressed("right") and canmove == true:
		vel.x = speed
		$Sprite.play("Walking")
		$Sprite.set_flip_h(false)
	elif Input.is_action_pressed("left") and canmove == true:
		vel.x = -speed
		$Sprite.play("Walking")
		$Sprite.set_flip_h(true)
	else:
		vel.x = 0 #Prevents player from moving when nothing is pressed
		$Sprite.play("Idle")
	
	#Jumping
	if Input.is_action_pressed("up") and is_on_floor():
		if canmove == true:
			vel.y = -jumppower #Negative Y is up in Godot 2D
			$Sprite.play("Idle")
			$Audio/JumpSFX.play()
	
	#Crouching (kinda useless but whatever it looks cool I guess)
	if Input.is_action_pressed("down") and vel.x == 0: #Player will not crouch if moving in X-axis, can still crouch jump like it's CS:GO
		if canmove == true:
			$Sprite.play("Crouching")
	
	vel = move_and_slide(vel, UP) #This actually makes the player able to move
	
	#Quitting to title screen
	if Input.is_action_just_pressed("ui_cancel"):
		get_tree().change_scene("res://Title Screen/Title Screen.tscn")
	
	#Reloading current scene (For testing purposes)
	#if Input.is_action_just_pressed("reload"): #Shift+R
	#	get_tree().reload_current_scene()
	
	#When the player dies they can restart the level they died in
	if Input.is_action_pressed("restart") and canrestart == true:
		canrestart = false
		get_tree().reload_current_scene()
		
