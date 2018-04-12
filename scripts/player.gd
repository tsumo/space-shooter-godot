extends Node2D

const SPEED = 2.6
const RELOAD_TIME = 0.1

var reload_timer = 0

var BulletScn = preload("res://scenes/bullet.tscn")

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
	if Input.is_action_pressed("ui_select"):
		fire()

	# Screen edges
	if position.x < 5 and dir.x < 0:
		dir.x = 0
	if position.x > get_viewport().size.x - 5 and dir.x > 0:
		dir.x = 0
	if position.y < 5 and dir.y < 0:
		dir.y = 0
	if position.y > get_viewport().size.y - 10 and dir.y > 0:
		dir.y = 0
	position += (dir.normalized() * SPEED)

	reload_timer -= delta

func fire():
	if reload_timer <= 0:
		var bullet = BulletScn.instance()
		bullet.global_position = global_position
		get_parent().add_child(bullet)
		reload_timer = RELOAD_TIME