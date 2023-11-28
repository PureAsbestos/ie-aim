extends Control


func _ready():
	$Video/fullScreen.button_pressed = GlobalSettings.fullscreen
	$Video/vSync.button_pressed = GlobalSettings.vSync
	
func _on_return_button_pressed():
	if MenuButtons.pmenuButton:
		hide()
	else:
		MenuButtons._on_return_button_pressed()

func _on_full_screen_toggled(button_pressed):
	GlobalSettings.fullscreen = button_pressed
	if button_pressed == true:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
	else:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)

func _on_v_sync_toggled(button_pressed):
	GlobalSettings.vSync = button_pressed
	if button_pressed == true:
		DisplayServer.window_set_vsync_mode(DisplayServer.VSYNC_ENABLED)
	else:
		DisplayServer.window_set_vsync_mode(DisplayServer.VSYNC_DISABLED)
