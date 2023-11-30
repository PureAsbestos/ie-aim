class_name SoundEffect
extends AudioStreamPlayer

func _init(sound: AudioStream):
	stream = sound

func _ready():
	connect("finished", _on_finished)
	play()

func _on_finished():
	queue_free()
