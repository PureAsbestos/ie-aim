extends Sprite3D

func _ready():
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED

func _input(event: InputEvent):
	if  event is InputEventMouseButton && event.pressed && event.button_index == MOUSE_BUTTON_LEFT:
		get_parent().remove_child(self)
