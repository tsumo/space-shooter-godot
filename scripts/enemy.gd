extends Node2D

const SPEED = 150

onready var Ship = get_node("Ship")
onready var ship_size = Ship.get_texture().get_size()

func _ready():
	pass

func _process(delta):
	global_position.y += SPEED * delta
	if global_position.y > get_viewport().size.y + ship_size.y:
		queue_free()
