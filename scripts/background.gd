extends Node2D

const STARS_SPEED = 0.7
const PLANET_PERIOD = 9
const PLANET_SPEED = 0.8
var planet_timer = PLANET_PERIOD

onready var Stars1 = get_node("Stars1")
onready var Stars2 = get_node("Stars2")

onready var Inactive_Planets = get_node("Planets").get_children()
onready var Active_Planets = []

onready var viewport_height = int(get_viewport().size.y)
onready var viewport_width = int(get_viewport().size.x)


func _ready():
	OS.set_window_size(OS.get_window_size() * 2)
	OS.center_window()
	# TODO: move randomize to the init script
	randomize()


func _process(delta):
	move_stars(delta)
	move_planets(delta)


func move_stars(delta):
	# Move stars lower
	Stars1.position.y += STARS_SPEED
	Stars2.position.y += STARS_SPEED

	# Wrap stars that scrolled past the edge to the top
	if Stars1.position.y >= viewport_height:
		Stars1.position.y = Stars2.position.y - viewport_height
	if Stars2.position.y >= viewport_height:
		Stars2.position.y = Stars1.position.y - viewport_height


func move_planets(delta):
	if planet_timer <= 0:
		# Add random new planet to the background
		if Inactive_Planets:
			var i = randi() % Inactive_Planets.size()
			Active_Planets.push_front(Inactive_Planets[i])
			Inactive_Planets.remove(i)
			Active_Planets[0].global_position = Vector2(randi() % viewport_width, -50)
			# Randomly flip planet
			if randi() % 2:
				Active_Planets[0].set_flip_h(not Active_Planets[0].is_flipped_h())
			if randi() % 2:
				Active_Planets[0].set_flip_v(not Active_Planets[0].is_flipped_v())
		# Reload timer
		var rand_delay = randi() % 100 * 0.01 - 0.5
		planet_timer = PLANET_PERIOD + PLANET_PERIOD * rand_delay

	# Move planets lower
	for planet in Active_Planets:
		planet.position.y += PLANET_SPEED

	# Remove planets that scrolled past the screen
	for planet in Active_Planets:
		if planet.position.y - planet.get_texture().get_size().y >= viewport_height:
			Active_Planets.erase(planet)
			Inactive_Planets.push_front(planet)

	planet_timer -= delta
