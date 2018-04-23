extends Node2D

const STARS_SPEED = 0.7

onready var Stars1 = get_node("Stars1")
onready var Stars2 = get_node("Stars2")

func _ready():
	OS.set_window_size(OS.get_window_size() * 2)
	OS.center_window()
	# TODO: move randomize to the init script
	randomize()

func _process(delta):
	Stars1.position.y += STARS_SPEED
	Stars2.position.y += STARS_SPEED

	var viewport_height = get_viewport().size.y
	if Stars1.position.y >= viewport_height:
		Stars1.position.y = Stars2.position.y - viewport_height
	if Stars2.position.y >= viewport_height:
		Stars2.position.y = Stars1.position.y - viewport_height
