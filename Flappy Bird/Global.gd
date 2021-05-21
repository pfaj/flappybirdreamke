extends Node

signal passed
signal lose

var started = false
var lost = false 
var score = 0
var high_score = 0
var new_score = false

var rand = RandomNumberGenerator.new()
var randT = RandomNumberGenerator.new()

func lose():
	started = false
	if not lost:
		calculate_high_score(score)
		emit_signal("lose")
		lost = true
		$die_sound.play()
		$hit_sound.play()
		
		
func reset():
	$button_press.play()
	Global.new_score = false
	started = false
	lost = false
	Global.score = 0
	get_tree().reload_current_scene()

func point():
	if not lost:
		Global.score += 1
		emit_signal("passed")
		$score_sound.play()

func calculate_high_score(current_score):
	var config = ConfigFile.new()
	var err = config.load("user://score.txt")
	var last_high_score = config.get_value("score", "high_score", 0)
	if  current_score > last_high_score:
		high_score = current_score
		print("new")
		new_score = true
		config.set_value("score", "high_score", high_score)
		config.save("user://score.txt")
	else:
		high_score = last_high_score
		
