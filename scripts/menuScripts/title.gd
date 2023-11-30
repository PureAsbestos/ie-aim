extends Control

func _on_level_select_pressed():
	$Panel.hide()
	$levelSelect.show()

func _on_charts_pressed():
	get_tree().quit()

func _on_setting_button_pressed():
	MenuButtons._on_settings_button_pressed()

func _on_back_button_pressed():
	$Panel.show()
	$levelSelect.hide()

func _on_grid_shot_pressed():
	MenuButtons._on_levelSelect_button_pressed(1)

func _on_target_track_pressed():
	MenuButtons._on_levelSelect_button_pressed(2)


func _on_flick_shot_pressed():
	MenuButtons._on_levelSelect_button_pressed(3)

func _on_timed_shot_pressed():
	MenuButtons._on_levelSelect_button_pressed(4)
