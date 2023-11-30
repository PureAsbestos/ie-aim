extends Node3D

var levelNum = 2
# Called when the node enters the scene tree for the first time.
var target = preload("res://scenes/targetT.tscn")

var started = false

var targetInst
var next_position = Vector3(12.5,2,-12.5)

@onready var animate  = $"../AnimationPlayer"

const MIN_X : float = 2
const MAX_X : float = 23
const MIN_Y : float = 1
const MAX_Y : float = 8
const MIN_Z : float = -10
const MAX_Z : float = -23

func _ready():
	await animate.animation_finished
	$timer.timerReady()

func randomize_position() -> Vector3:
	randomize()
	var x : float = randf_range(MIN_X, MAX_X)
	var y : float = randf_range(MIN_Y, MAX_Y)
	var z : float = randf_range(MIN_Z, MAX_Z)
	var random_coord : Vector3 = Vector3(x, y, z)
	return random_coord
	
func _process(delta):
	if started:
		if targetInst.position.is_equal_approx(targetInst.next_position):
			targetInst.next_position = randomize_position()


func _on_target_spawn_timer_timeout():
	if (!started):
		var location = next_position
		targetInst = GlobalSettings.instance_node(target, location, self)
		started = true
	
