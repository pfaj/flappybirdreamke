extends Node

signal passed
signal lose

var started = false
var lost = false 
var score = 1

func lose():
	started = false
	emit_signal("lose")
	if not lost:
		Global.score -= 1
		lost = true
		$die_sound.play()
		$hit_sound.play()
		
func reset():
	lost = false
	Global.score = 1
	get_tree().reload_current_scene()

func point():
	emit_signal("passed")
	Global.score += 10
	$score_sound.play()
	
