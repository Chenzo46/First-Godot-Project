extends Node2D

@export var speed:float = 500

func _ready():
	$top.body_entered.connect(_kill_player)
	$bottom.body_entered.connect(_kill_player)
	$score_keeper.body_entered.connect(_increase_score)
	
func _process(delta):
	position.x -= speed * delta

func _set_speed(new_speed:float):
	speed = new_speed
	
func _kill_player(body:Node2D):
	if body.is_in_group("Player"):
		body.end_player()
		
func _increase_score(body:Node2D):
	if body.is_in_group("Player"):
		GameStateManager._inc_score()
