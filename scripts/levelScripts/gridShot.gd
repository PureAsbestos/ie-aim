extends Node3D

var levelNum = 1
var target = preload("res://scenes/target.tscn")
var maxTargets = false # max targets on screen at a time is 5
var counter = 0

const MIN_X : float = 10
const MAX_X : float = 15
const MIN_Y : float = 3
const MAX_Y : float = 5
const Z : float = -12.5

func randomize_position() -> Vector3:
	randomize()
	var x : float = randf_range(MIN_X, MAX_X)
	var y : float = randf_range(MIN_Y, MAX_Y)
	var random_coord : Vector3 = Vector3(x, y, Z)
	return random_coord

func _on_target_spawn_timer_timeout():
	if !maxTargets:
		var location = randomize_position()
		var temp = GlobalSettings.instance_node(target, location, self)
		temp.name = ("target" + str(counter))
		$targetSpawnTimer.start(1)
		counter += 1
		if counter == 5:
			maxTargets = true
	else:
		counter -= 1
		maxTargets = false

func _ready():
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED

