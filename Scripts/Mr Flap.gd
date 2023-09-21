extends RigidBody2D
@export var jump_strength:float = 600

func _ready():
	$Sprite2D.modulate = Color(30,1,0)

func _process(delta):
	#Jump Code
	if Input.is_action_just_pressed("Jump"):
		linear_velocity.y = -jump_strength

func _on_body_entered(body):
	if body.is_in_group("Obstacle"):
		end_player()

func end_player():
	GameStateManager._restart_game()
