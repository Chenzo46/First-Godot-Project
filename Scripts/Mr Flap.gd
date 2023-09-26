extends RigidBody2D

@export var jump_strength:float = 600
@export var angle_decrement_speed:float = 100
@export var max_angle:float = -45
@export var min_angle:float = 45
var initial_angle_decrement_speed:float
var particles:ParticleProcessMaterial
var plr_sprite:Sprite2D
func _ready():
	initial_angle_decrement_speed = angle_decrement_speed
	plr_sprite = $Sprite2D
	particles = $Particles.process_material

func _process(delta):
	#Jump Code/Rotation code
	if Input.is_action_just_pressed("Jump"):
		linear_velocity.y = -jump_strength
		angle_decrement_speed = initial_angle_decrement_speed
		plr_sprite.rotation_degrees = max_angle
		
	angle_decrement_speed += delta * 100
	if plr_sprite.rotation_degrees < min_angle:
		plr_sprite.rotation_degrees += angle_decrement_speed*delta
	
	#particles.angle_min = plr_sprite.rotation_degrees
	#particles.angle_max = plr_sprite .rotation_degrees

func end_player():
	GameStateManager._restart_game() 
 
