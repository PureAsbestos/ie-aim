extends Node3D

var levelNum = 1
### copy this into all level code
var target = preload("res://scenes/target.tscn")

@onready var animate  = $"../AnimationPlayer"

const MIN_X : float = 6
const MAX_X : float = 18
const MIN_Y : float = 2
const MAX_Y : float = 7
const Z : float = -15

func _ready():
	await animate.animation_finished
	GlobalSettings.counter = 0
	$timer.timerReady()

func randomize_position() -> Vector3:
	randomize()
	var x : float = int(randf_range(MIN_X, MAX_X))
	var y : float = int(randf_range(MIN_Y, MAX_Y))
	var random_coord : Vector3 = Vector3(x, y, Z)
	return random_coord

# only 5 targets on screen at a time, no more spawning after game time ends.
func _on_target_spawn_timer_timeout():
	$timer/score.text = "Score: " + str(GlobalSettings.gsScore)
	if GlobalSettings.maxTargets == false && GlobalSettings.timeout == false:
		var location = randomize_position()
		var temp = GlobalSettings.instance_node(target, location, self)
		temp.name = ("target" + str(GlobalSettings.counter))
		GlobalSettings.counter += 1
		if GlobalSettings.counter == 5:
			GlobalSettings.maxTargets = true
