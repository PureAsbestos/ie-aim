extends Sprite3D

func being_tracked():





var speed = 5  # Adjust the speed as needed
var next_position:Vector3 = Vector3(12.5, 2, -12.5)
func _process(delta):
	# Example: Move the object toward a target position
	position = position.move_toward(next_position, speed * delta)
