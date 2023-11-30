extends Sprite3D

func got_hit():
	GlobalSettings.counter -= 1
	GlobalSettings.gsScore += 100
	GlobalSettings.maxTargets = false
	hide()
	position = Vector3(1000,1000,1000)
