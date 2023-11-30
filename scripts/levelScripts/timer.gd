extends Control

var startTime: int
var sec: int
var minute = 0

func timerReady():
	startTime = 4
	sec = startTime
	$countDown.start(1)

func startGame():
	startTime = 5
	sec = startTime
	$countDown.start(1)
	$"../targetSpawnTimer".start(1)

func timer_timout():
	game_time()

func game_time():
	if sec > 1:
		sec -= 1
		if startTime == 4:
			$startCountDown.text = str(sec)
		elif startTime == 5:
			if sec > 9:
				$gameCountDown.text = str(minute) + ":" + str(sec)
			else: 
				$gameCountDown.text = str(minute) + ":0" + str(sec)
	elif sec == 1:
		sec -= 1
		$startCountDown.text = "GO!"
		if startTime == 5:
			$gameCountDown.text = str(minute) + ":0" + str(sec)
			$countDown.stop()
	if sec == 0:
		$startCountDown.hide()
		if startTime == 4:
			startGame()
		else:
			GlobalSettings.timeout = true
			showResults()

func showResults():
	pass


func _on_target_spawn_timer_timeout():
	pass # Replace with function body.
