extends Node2D

var score:int = 0

func _ready():
	_set_instance_variables()

func _restart_game():
	#get_tree().reload_current_scene()
	_set_instance_variables()
	game_ended.emit()

func _inc_score():
	score += 1
	
func _set_instance_variables():
	score = 0

signal game_ended
