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
	$resultsPanel/ColorRect/results2.text = "Score: " + str(GlobalSettings.gsScore)
	$resultsPanel.show()
	MenuButtons.disableKeyboard = true
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	get_tree().paused = true

func _on_reset_level_pressed():
	get_tree().paused = false
	MenuButtons._on_levelSelect_button_pressed(get_node("../").levelNum)

func _on_main_menu_pressed():
	get_tree().paused = false
	MenuButtons._on_return_button_pressed()

func _on_quit_game_pressed():
	get_tree().quit()
