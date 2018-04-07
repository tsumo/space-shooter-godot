extends Sprite

const SPEED = 300

func _ready():
	pass

func _process(delta):
	global_position.y -= SPEED * delta
	if global_position.y < 0:
		queue_free()
