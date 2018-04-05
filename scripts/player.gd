extends Node2D

var MAXSPEED = 1.6

func _ready():
	set_process(true)

func _process(delta):
	var key_dir = Vector2()

	if Input.is_action_pressed("ui_up"):
		key_dir += Vector2(0, -1)
	if Input.is_action_pressed("ui_down"):
		key_dir += Vector2(0, 1)
	if Input.is_action_pressed("ui_right"):
		key_dir += Vector2(1, 0)
	if Input.is_action_pressed("ui_left"):
		key_dir += Vector2(-1, 0)

	position += (key_dir.normalized() * MAXSPEED)
