extends Sprite3D

func got_hit():
	GlobalSettings.counter -= 1
	GlobalSettings.maxTargets = false
	queue_free()
