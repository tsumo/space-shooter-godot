extends Node2D

var SPEED = 0.7

onready var bg_sprite1 = get_node("bg_sprite1")
onready var bg_sprite2 = get_node("bg_sprite2")

func _ready():
	pass

func _process(delta):
	bg_sprite1.position.y += SPEED
	bg_sprite2.position.y += SPEED

	var viewport_height = get_viewport().size.y
	if bg_sprite1.position.y >= viewport_height:
		bg_sprite1.position.y = bg_sprite2.position.y - viewport_height
	if bg_sprite2.position.y >= viewport_height:
		bg_sprite2.position.y = bg_sprite1.position.y - viewport_height

