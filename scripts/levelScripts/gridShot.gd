extends Node3D

var levelNum = 1
var target = preload("res://scenes/target.tscn")
var maxTargets = false # max targets on screen at a time is 5
var counter = 0

const MIN_X : int = 40
const MAX_X : int = 60
const MIN_Y : int = 3
const MAX_Y : int = 10
const Z : int = -40

func randomize_position() -> Vector3:
	randomize()
	var x : float = randi_range(MIN_X, MAX_X)
	var y : float = randi_range(MIN_Y, MAX_Y)
	var random_coord : Vector3 = Vector3(x, y, Z)
	return random_coord

func _on_target_spawn_timer_timeout():
	var targetVector: Vector3
	if !maxTargets:
		var location = randomize_position()
		var temp = GlobalSettings.instance_node(target, location, self)
		temp.name = ("target" + str(counter))
		$targetSpawnTimer.start(2)
		counter += 1
		if counter == 5:
			maxTargets = true
			counter -= 1

func _ready():
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED

