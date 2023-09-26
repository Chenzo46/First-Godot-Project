extends Camera2D
@export var plr_node:Node2D
var pos:Vector2
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _process(delta):
	
	position = lerp(position, plr_node.position, 0.008)
