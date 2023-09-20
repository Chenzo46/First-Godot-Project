extends Area2D

func _on_area_entered(area:Area2D):
	if area.is_in_group("Obstacle"):
		area.queue_free()
