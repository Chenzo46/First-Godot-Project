extends HBoxContainer

var cont:Button
var exit:Button

# Called when the node enters the scene tree for the first time.
func _ready():
	cont = $Button
	exit = $Button2
	
	cont.pressed.connect(_restart_game)
func _restart_game():
	get_tree().reload_current_scene()
