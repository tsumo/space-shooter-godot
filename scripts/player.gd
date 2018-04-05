extends Node2D

var SPEED = 1.6

var bullet = preload("res://scenes/bullet.tscn")

func _ready():
	set_process(true)

func _process(delta):
	var dir = Vector2()

	if Input.is_action_pressed("ui_up"):
		dir += Vector2(0, -1)
	if Input.is_action_pressed("ui_down"):
		dir += Vector2(0, 1)
	if Input.is_action_pressed("ui_right"):
		dir += Vector2(1, 0)
	if Input.is_action_pressed("ui_left"):
		dir += Vector2(-1, 0)

	position += (dir.normalized() * SPEED)
