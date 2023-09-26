extends Container

func _ready():
	GameStateManager.game_ended.connect(show_box)
	
func show_box():
	visible = true
