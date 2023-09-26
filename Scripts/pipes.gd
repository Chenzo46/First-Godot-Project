extends Node2D
@export var speed:float = 500

func _ready():
	var top_pipe:Area2D = $top
	var bottom_pipe:Area2D = $bottom
	#Subscribe to all relevant events/signals
	top_pipe.body_entered.connect(_kill_player)
	bottom_pipe.body_entered.connect(_kill_player)
	top_pipe.area_entered.connect(_destroy_pipes)
	bottom_pipe.body_entered.connect(_destroy_pipes)
	
	$score_keeper.body_entered.connect(_increase_score)
	
func _process(delta):
	position.x -= speed * delta
func _set_speed(new_speed:float):
	speed = new_speed
	
func _kill_player(body):
	if body.is_in_group("Player"):
		body.end_player()
		
func _increase_score(body):
	if body.is_in_group("Player"):
		GameStateManager._inc_score()

func _destroy_pipes(area):
	if area.is_in_group("despawner"):
		get_parent().pipe_instances.erase(self)
		#print("destroyed")
		queue_free()
