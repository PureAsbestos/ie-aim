extends Node3D

var levelNum = 3
### copy this into all level code
var target = preload("res://scenes/target.tscn")
var flicktarget = preload("res://scenes/flicktarget.tscn")

@onready var animate  = $"../AnimationPlayer"

const MIN_X : float = 4
const MAX_X : float = 20
const MIN_Y : float = 1
const MAX_Y : float = 8
const Z : float = -20

func _ready():
	await animate.animation_finished
	GlobalSettings.counter = 0
	GlobalSettings.gsScore = 0
	GlobalSettings.timeout = false
	$timer.timerReady()

func randomize_position() -> Vector3:
	randomize()
	var x : float = randf_range(MIN_X, MAX_X)
	var y : float = randf_range(MIN_Y, MAX_Y)
	var random_coord : Vector3 = Vector3(x, y, Z)
	return random_coord

# only 5 targets on screen at a time, no more spawning after game time ends.
func _on_target_spawn_timer_timeout():
	$timer/score.text = "Score: " + str(GlobalSettings.gsScore)
	if GlobalSettings.maxTargets == false && GlobalSettings.timeout == false:
		var location = randomize_position()
		var temp = GlobalSettings.instance_node(flicktarget, location, self)
		temp.name = ("flicktarget" + str(GlobalSettings.counter))
		GlobalSettings.counter += 1
		if GlobalSettings.counter == 6:
			GlobalSettings.maxTargets = true
