extends Node3D

var levelNum = 1
var target = preload("res://scenes/target.tscn")
var maxTargets = false # max targets on screen at a time is 5
var counter = 0
@onready var animate  = $"../AnimationPlayer"

const MIN_X : float = 10
const MAX_X : float = 15
const MIN_Y : float = 3
const MAX_Y : float = 5
const Z : float = -12.5

# copy this into all level code
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
	startTime = 60
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
		elif startTime == 60:
			$gameCountDown.text = str(minute) + ":" + str(sec)
	elif sec == 1:
		sec -= 1
		$startCountDown.text = "GO!"
		if startTime == 60:
			$gameCountDown.text = str(minute) + ":" + str(sec)
			$timer.stop()
	if sec == 0:
		$startCountDown.hide()
		if startTime == 4:
			startGame()
		else:
			timeout = true

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
		counter += 1
		if counter == 5:
			maxTargets = true
	else:
		counter -= 1
		maxTargets = false
		print(maxTargets)
