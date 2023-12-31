class_name BackgroundParallaxLayer extends Node2D
	
@export var parts:Array[Node2D] = []
@export var scroll_speed:float = 200
@export var min_rng:float
@export var max_rng:float
	
func _set_parts(p1:Node2D, p2:Node2D, p3:Node2D):
	parts = [p1,p2,p3]

func _set_speed(new_speed:float):
	scroll_speed = new_speed

func _process(delta):
	for c in parts:
		c.position.x -= delta * scroll_speed
		if c.position.x < min_rng:
			c.position.x = max_rng

func _ready():
	GameStateManager.game_ended.connect(_stop_parallax)

func _stop_parallax():
	_set_speed(0)
