extends Control

func _on_level_select_pressed():
	$Panel.hide()
	$levelSelect.show()

func _on_achievements_pressed():
	MenuButtons._on_achievements_button_pressed()

func _on_setting_button_pressed():
	MenuButtons._on_settings_button_pressed()

func _on_back_button_pressed():
	$Panel.show()
	$levelSelect.hide()

func _on_grid_shot_pressed():
	MenuButtons._on_levelSelect_button_pressed(1)

func _on_level_2_pressed():
	MenuButtons._on_levelSelect_button_pressed(2)
