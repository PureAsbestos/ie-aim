extends Camera3D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
	#pass

@warning_ignore("unused_parameter")
func _physics_process(delta):
	if $RayCast3D.is_colliding():
		GlobalSettings.tracked = true
		
		var collider = $RayCast3D.get_collider()
		if collider.owner.has_method("got_hit"):
			if Input.is_action_just_pressed("shoot"):
				collider.owner.got_hit()
		elif collider.owner.has_method("being_tracked"):
			collider.owner.being_tracked()
		else:
			GlobalSettings.tracked = false

