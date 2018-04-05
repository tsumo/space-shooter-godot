extends Sprite

var SPEED = 100

var vel = Vector2()

func _ready():
	set_process(true)

func _process(delta):
	var direction

	if Input.is_action_pressed("ui_up"):
		direction += Vector2(0, -1)
	elif Input.is_action_pressed("ui_down"):
		direction -= Vector2(0, 1)
	elif Input.is_action_pressed("ui_right"):
		direction -= Vector2(1, 0)
	elif Input.is_action_pressed("ui_left"):
		direction -= Vector2(-1, 0)

	