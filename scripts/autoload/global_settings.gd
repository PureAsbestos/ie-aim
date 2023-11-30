extends Node

var fullscreen = false
var vSync = false
var sensVal = 1
var timer: Timer = Timer.new()

func instance_node(node, location, parent):
	var node_instance = node.instantiate()
	parent.add_child(node_instance)
	node_instance.global_position = location
	return node_instance
