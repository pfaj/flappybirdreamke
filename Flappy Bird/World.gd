extends Node2D

export(NodePath) var text_path  
onready var text = get_node(text_path)

func _ready():
	Global.connect("lose", self, "_on_lose")
	Global.connect("passed", self, "_on_passed")
	$CanvasLayer/Control/Label.hide()
	$CanvasLayer/Control/Death.hide()

	
func _on_lose():
	$ground.get_node("AnimationPlayer").stop()
	$player.get_node("AnimationPlayer").stop()
	$CanvasLayer/Control/Death.show()
	$CanvasLayer/Control/Death/score.text = str(Global.score)
	if Global.score >= 10:
		$CanvasLayer/Control/Death/panel/bronze_coin.show()
	elif Global.score >= 20:
		$CanvasLayer/Control/Death/panel/silver_coin.show()
	elif Global.score >= 50:
		$CanvasLayer/Control/Death/panel/platinum_coin.show()
	elif Global.score >= 100:
		$CanvasLayer/Control/Death/panel/gold_coin.show()
	else:
		pass
	
func _on_passed():
	print(Global.score)
	$CanvasLayer/Control/Label.text = str(Global.score) 
	
func _process(delta):
	if Global.started:
		$message.hide()
		$CanvasLayer/Control/Label.show()
	if Input.is_action_just_pressed("reload"):
		get_tree().reload_current_scene()



