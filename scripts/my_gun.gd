extends Node3D


var gunshot_sfx := preload("res://assets/audio/sfx/gunshot.wav")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
	#pass

func _physics_process(_delta):
	if Input.is_action_just_pressed("shoot"):
		add_child(SoundEffect.new(gunshot_sfx))
#		if $RayCast3D.is_colliding():
#			var collider = $RayCast3D.get_collider()
#			if collider.owner.has_method("got_hit"):
#				collider.owner.got_hit()
