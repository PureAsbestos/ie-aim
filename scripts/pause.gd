extends Control

var paused := false

# Called when the node enters the scene tree for the first time.
func _ready():
	if visible:
		hide()

func _process(_delta):
	if Input.is_action_just_pressed("pause") && !MenuButtons.disableKeyboard:
		if $"settings".visible|| $achievements.visible:
			pass
		else:
			if paused:
				unpause()
			else:
				pause()

func pause():
	get_tree().paused = true
	show()
	paused = true

func unpause():
	get_tree().paused = false
	hide()
	paused = false

func _on_settings_button_pressed():
	MenuButtons.pmenuButton = true
	$settings.show()

func _on_achievements_button_pressed():
	MenuButtons.pmenuButton = true
	$achievements.show()

func _on_reset_level_pressed():
	get_tree().paused = false
	MenuButtons._on_levelSelect_button_pressed(get_parent().levelNum)
	
func _on_resume_button_pressed():
	unpause()

func _on_main_menu_pressed():
	get_tree().paused = false
	MenuButtons._on_return_button_pressed()


