extends Node2D

export(NodePath) var text_path  
onready var text = get_node(text_path)

func _ready():
	Global.connect("lose", self, "_on_lose")
	Global.connect("passed", self, "_on_passed")
	$CanvasLayer/Control/Label.hide()
	$CanvasLayer/Control/Death.hide()
	
	var rand = RandomNumberGenerator.new()
	rand.randomize()
	var value = rand.randi_range(0, 1)
	print(value)
	if value < 1:
		$background.show()
	else:
		$background2.show()

	
func _on_lose():
	print(Global.new_score)
	$CanvasLayer/Control/Death/AnimationPlayer.play("death_panel")
	$ground.get_node("AnimationPlayer").stop()
	$player.get_node("AnimationPlayer").stop()
	$CanvasLayer/Control/Death.show()
	$CanvasLayer/Control/Death/panel/score.text = str(Global.score)
	$CanvasLayer/Control/Death/panel/high_score.text = str(Global.high_score)
	if Global.score >= 100:
		$CanvasLayer/Control/Death/panel/gold_coin.show()
	elif Global.score >= 50:
		$CanvasLayer/Control/Death/panel/platinum_coin.show()
	elif Global.score >= 25:
		$CanvasLayer/Control/Death/panel/silver_coin.show()
	elif Global.score >= 10:
		$CanvasLayer/Control/Death/panel/bronze_coin.show()
	
func _on_passed():
	print(Global.score)
	$CanvasLayer/Control/Label.text = str(Global.score) 
	
func _process(delta):
	if Global.started:
		$message.hide()
		$CanvasLayer/Control/Label.show()
	if Input.is_action_just_pressed("reload"):
		get_tree().reload_current_scene()



