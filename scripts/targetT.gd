extends Sprite3D
@onready var blue = preload("res://assets/textures/blueTarget.tres")
@onready var red = preload("res://assets/textures/redTarget.tres")
func being_tracked():
	$hitBox/CollisionShape3D/TargetMesh.material = blue



var speed = 5  # Adjust the speed as needed
var next_position:Vector3 = Vector3(12.5, 2, -12.5)
func _process(delta):
	if GlobalSettings.tracked == false:
		$hitBox/CollisionShape3D/TargetMesh.material = red
	if GlobalSettings.timeout == true:
		hide()
		position = Vector3(1000,1000,1000)
	# Example: Move the object toward a target position
	position = position.move_toward(next_position, speed * delta)
