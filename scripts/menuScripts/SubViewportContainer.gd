extends SubViewportContainer

var viewport_initial_size : Vector2

@onready var viewport = $SubViewport

func _ready():
	get_viewport().connect("size_changed", _root_viewport_size_changed)#"size_changed", self, "_root_viewport_size_changed")
	viewport_initial_size = viewport.size
	_root_viewport_size_changed()


# Called when the root's viewport size changes (i.e. when the window is resized).
# This is done to handle multiple resolutions without losing quality.
func _root_viewport_size_changed():
	viewport.size = get_viewport().size
	scale = viewport_initial_size/Vector2(viewport.size)
