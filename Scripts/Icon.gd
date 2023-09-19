extends Sprite2D
var icon_offset = 0

var speed = 500

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#icon_offset += delta * speed
	#translate(Vector2(icon_offset,0))
	var direction:Vector2 = Vector2(0,0)
	
	if Input.is_action_pressed("right"):
		direction.x = 1
	elif Input.is_action_pressed("left"):
		direction.x = -1
	else:
		direction.x = 0
	
	if Input.is_action_pressed("up"):
		direction.y = -1
	elif Input.is_action_pressed("down"):
		direction.y = 1
	else:
		direction.y = 0
		
	direction = direction.normalized()
	
	var move_input = direction * speed * delta
	
	position += move_input
