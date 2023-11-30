extends Node3D

var levelNum = 1
### copy this into all level code
var target = preload("res://scenes/target.tscn")

@onready var animate  = $"../AnimationPlayer"

const MIN_X : float = 6
const MAX_X : float = 18
const MIN_Y : float = 2
const MAX_Y : float = 10
const Z : float = -15

var startTime: int
var sec: int
var minute = 0
var timeout = false

func _ready():
	await animate.animation_finished
	startTime = 4
	sec = startTime
	$timer.start(1)

func startGame():
	startTime = 7
	sec = startTime
	$timer.start(1)
	$targetSpawnTimer.start(1)

func timer_timout():
	game_time()

func game_time():
	if sec > 1:
		sec -= 1
		if startTime == 4:
			$startCountDown.text = str(sec)
		elif startTime == 7:
			$gameCountDown.text = str(minute) + ":" + str(sec)
	elif sec == 1:
		sec -= 1
		$startCountDown.text = "GO!"
		if startTime == 7:
			$gameCountDown.text = str(minute) + ":" + str(sec)
			$timer.stop()
	if sec == 0:
		$startCountDown.hide()
		if startTime == 4:
			startGame()
		else:
			timeout = true
			showResults()

func showResults():
	pass

func randomize_position() -> Vector3:
	randomize()
	var x : float = randf_range(MIN_X, MAX_X)
	var y : float = randf_range(MIN_Y, MAX_Y)
	var random_coord : Vector3 = Vector3(x, y, Z)
	return random_coord
###

# only 5 targets on screen at a time, no more spawning after game time ends.
func _on_target_spawn_timer_timeout():
	if GlobalSettings.maxTargets == false && timeout == false:
		var location = randomize_position()
		var temp = GlobalSettings.instance_node(target, location, self)
		temp.name = ("target" + str(GlobalSettings.counter))
		GlobalSettings.counter += 1
		if GlobalSettings.counter == 5:
			GlobalSettings.maxTargets = true
