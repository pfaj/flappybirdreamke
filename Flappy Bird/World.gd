extends Node2D

export(NodePath) var text_path  
onready var text = get_node(text_path)

func _ready():
	Global.connect("lose", self, "_on_lose")
	Global.connect("passed", self, "_on_passed")
	$CanvasLayer/Control/Label.hide()
	$CanvasLayer/Control/Death.hide()
	Global.rand.randomize()
	var value = Global.rand.randi_range(0, 1)
	Global.randT.randomize()
	var valueT = Global.randT.randi_range(0, 5)
#	print (value)
	if value <1:
		$background.show()
	else:
		$background2.show()
	if valueT == 0:
		$player/Sprite.show()
		$player.get_node("AnimationPlayer").play("idle")
	elif valueT == 1:
		$player/red_bird.show()
		$player.get_node("red_bird_ani").play("idle")
	elif valueT == 2:
		$player/blue_bird.show()
		$player.get_node("blue_bird_ani").play("idle")
	elif valueT == 3:
		$player/black_bird.show()
		$player.get_node("black_bird_ani").play("idle")	
	elif valueT == 4:
		$player/white_bird.show()
		$player.get_node("white_bird_ani").play("idle")
	elif valueT == 5:
		$player/gray_bird.show()
		$player.get_node("gray_bird_ani").play("idle")
	
func _on_lose():
	$CanvasLayer/Control/Label.hide()
	print(Global.new_score)
	$CanvasLayer/Control/Death/AnimationPlayer.play("death_panel")
	if Global.new_score:
		$CanvasLayer/Control/Death/AnimationScore.play("new_score")
	$ground.get_node("AnimationPlayer").stop()
	$player.get_node("AnimationPlayer").stop()
	$player.get_node("red_bird_ani").stop()
	$player.get_node("blue_bird_ani").stop()
	$player.get_node("black_bird_ani").stop()
	$player.get_node("white_bird_ani").stop()
	$player.get_node("gray_bird_ani").stop()
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



