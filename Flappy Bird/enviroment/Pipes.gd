extends Node2D

func _process(delta):
	if global_position.x < -250:
		queue_free()

func _on_TopPipe_body_entered(body):
	if body.is_in_group("player"):
		Global.lose()
		body.die()

		
func _on_BottomPipe_body_entered(body):
	if body.is_in_group("player"):
		Global.lose()
		body.die()


func _on_goal_body_entered(body):
	if body.is_in_group("player"):
		Global.point()
		
		
