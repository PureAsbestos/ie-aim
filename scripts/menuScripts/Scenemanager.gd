extends Node2D

# Game will always load with Title_Screen and an animation player
# Global variables
@onready var current_scene = $titleScreen
@onready var animate  = $AnimationPlayer
var next_scene = null

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# current_scene.connect("scene_change", _handle_scene_change)
	MenuButtons.handleSounds(current_scene)
	MenuButtons.connect("scene_change", _handle_scene_change)

func _handle_scene_change(go_to_scene: String, levelNum: int):
	
	var next_scene_name: String
	# Thinking of adding a animation name variable to later choose what animations to play
	# For now, I added simple fade in/out animations.
	# var animation_name: String
	match go_to_scene:
		"settings":
			next_scene_name = "settings"
			#animation_name =
		"level":
			match levelNum:
				0:
					pass
				1:
					next_scene_name = "gridShot"
				2:
					next_scene_name = "targetTrack"
				3:
					next_scene_name = "flickShot"
				4:
					next_scene_name = "timedShot"
				5:
					next_scene_name = "level5"
				_:
					return
			#animation_name =
		"title":
			next_scene_name = "title"
			MenuButtons.pmenuButton = false
			#animation_name =
		_:
			return
	var temp
	var loadPause
	if levelNum == 0:
		temp = load("res://scenes/menus/" + next_scene_name + ".tscn")
	else:
		temp = load("res://scenes/levels/" + next_scene_name + ".tscn")
	#animate.play(animation_name)
	animate.play("fade_in")
	MenuButtons.inputHandle("disable")
	next_scene = temp.instantiate()
	await animate.animation_finished
	call_deferred("add_child", next_scene)
	if go_to_scene == "level":
		temp = load("res://scenes/menus/pause.tscn")
		loadPause = temp.instantiate()
		current_scene.add_child(loadPause)
	# MenuButtons.connect("scene_change", _handle_scene_change)

func _on_animation_player_animation_finished(anim_name):
	# added a match here just in case we would like to do something different for each animation
	match anim_name:
		"fade_in":
			#animate.play(animation_name)
			current_scene.queue_free()
			current_scene = next_scene
			print(current_scene)
			animate.play("fade_out")
			get_tree().paused = false
			await animate.animation_finished
			MenuButtons.inputHandle("enable")
			MenuButtons.handleSounds(current_scene)
