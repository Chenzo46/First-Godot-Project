extends Label

func _process(_delta):
	text = str(GameStateManager.score)
