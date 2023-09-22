extends Node2D

var ground_parts:Array = []

# Called when the node enters the scene tree for the first time.
func _ready():
	ground_parts = [$Grass, $Grass2, $Grass3]


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	for c in ground_parts:
		c.position.x -= delta * 200
		if c.position.x < -638:
			c.position.x = 638
