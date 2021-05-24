extends Node2D

func _on_GameModeToggle_toggled(button_pressed):
	if button_pressed:
		Global.FLAP_FORCE = 300
		Global.gravity = -8.75
	else:
		Global.FLAP_FORCE = -300
		Global.gravity = 8.75

func _on_speed_slider_value_changed(value):
	$settings_panel/speed_slider/speed_label.text = str(value) 
	Global.pipe_speed = value
