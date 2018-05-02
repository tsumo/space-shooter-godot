extends Node2D

var EnemyScn = preload("res://scenes/enemy.tscn")

const RATE = 0.8

var rate_timer = 0


func _ready():
	pass


func _process(delta):
	rate_timer -= delta
	if rate_timer <= 0:
		spawn()
		rate_timer = RATE


func spawn():
	var enemy = EnemyScn.instance()
	enemy.global_position = Vector2(randi() % int(get_viewport().size.x), -10)
	add_child(enemy)
