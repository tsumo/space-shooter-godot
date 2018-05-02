extends Node2D

const SPEED = 150
const DIR_SWITCH = 1.8

var dir = -1
var dir_switch_timer = randf() * DIR_SWITCH

onready var Ship = get_node("Ship")
onready var ship_size = Ship.get_texture().get_size()


func _ready():
	pass


func _process(delta):
	global_position.y += SPEED * delta
	global_position.x += SPEED * delta * dir * 0.2
	if dir_switch_timer <= 0:
		dir *= -1
		dir_switch_timer = DIR_SWITCH
	dir_switch_timer -= delta

	if global_position.y > get_viewport().size.y + ship_size.y:
		queue_free()
