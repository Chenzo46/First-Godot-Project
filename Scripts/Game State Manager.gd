extends Node2D

var score:int = 0
var score_label:Label

func _ready():
	_set_instance_variables()

func _restart_game():
	get_tree().reload_current_scene()
	score = 0

func _inc_score():
	score_label = _get_score_label()
	score += 1
	score_label.text = str(score)

func _get_score_label() -> Label:
	return get_tree().root.get_node("Node 2D/Control/Score")
	
func _set_instance_variables():
	score_label = _get_score_label()
	score = 0
	score_label.text = str(score)
