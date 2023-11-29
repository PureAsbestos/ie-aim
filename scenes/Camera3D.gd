extends Camera3D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _physics_process(delta):
	if Input.is_action_just_pressed("shoot"):
		print("ki9ll")
		if $RayCast3D.is_colliding():
			var collider = $RayCast3D.get_collider()
			if collider.owner.has_method("got_hit"):
				collider.owner.got_hit()
