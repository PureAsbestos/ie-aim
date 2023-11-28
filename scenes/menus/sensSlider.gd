extends HSlider

# Called when the node enters the scene tree for the first time.
func _ready():
	value_changed.connect(_on_value_changed)
	value = GlobalSettings.sensVal
	
@warning_ignore("shadowed_variable_base_class")
func _on_value_changed(value: float):
	GlobalSettings.sensVal = value



