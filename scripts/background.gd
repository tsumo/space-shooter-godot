extends Node2D

const SPEED = 0.7

onready var Background1 = get_node("Background1")
onready var Background2 = get_node("Background2")

func _ready():
	OS.set_window_size(OS.get_window_size() * 2)
	OS.center_window()

func _process(delta):
	Background1.position.y += SPEED
	Background2.position.y += SPEED

	var viewport_height = get_viewport().size.y
	if Background1.position.y >= viewport_height:
		Background1.position.y = Background2.position.y - viewport_height
	if Background2.position.y >= viewport_height:
		Background2.position.y = Background1.position.y - viewport_height

