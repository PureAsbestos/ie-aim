extends Control


func _ready():
	pass
	
func _on_return_button_pressed():
	if MenuButtons.pmenuButton:
		hide()
	else:
		MenuButtons._on_return_button_pressed()

func _on_full_screen_toggled(button_pressed):
	if button_pressed == true:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
	else:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
