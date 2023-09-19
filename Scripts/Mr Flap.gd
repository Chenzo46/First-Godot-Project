extends RigidBody2D
@export var jump_strength:float = 600
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#Jump Code
	if Input.is_action_just_pressed("Jump"):
		print('jump pressed')
		linear_velocity.y = -jump_strength


func _on_body_entered(body):
	if body.is_in_group("Obstacle"):
		end_player()

func end_player():
	print("Game Over")
	pass
