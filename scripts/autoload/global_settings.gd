extends Node

var fullscreen = false
var vSync = false
var sensVal = 1
var counter = 0
var maxTargets = false # max targets on screen at a time is 5
var timeout = false
var tracked = false
var gsScore = 0

func instance_node(node, location, parent):
	var node_instance = node.instantiate()
	parent.add_child(node_instance)
	node_instance.global_position = location
	return node_instance
