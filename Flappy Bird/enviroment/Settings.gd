extends Node2D

func _ready():
	load_settings()
	save_settings()
	update_settings()
	
func update_settings():
	$settings_panel/Label/GameModeToggle.pressed = Global.gravity < 0
	$settings_panel/speed_slider.value = Global.pipe_speed
	$settings_panel/speed_slider/Mute.pressed = Global.mute 

	
func _on_GameModeToggle_toggled(button_pressed):
	if button_pressed:
		Global.FLAP_FORCE = 300
		Global.gravity = -8.75
		save_settings()
	else:
		Global.FLAP_FORCE = -300
		Global.gravity = 8.75
		save_settings()
		
func _on_speed_slider_value_changed(value):
	$settings_panel/speed_slider/speed_label.text = str(value) 
	Global.pipe_speed = value
	save_settings()
	
func _on_Mute_toggled(mute_button_pressed):
	AudioServer.set_bus_mute(0,mute_button_pressed)
	Global.mute = mute_button_pressed
	save_settings()
	
func save_settings():
	var config = ConfigFile.new()
	var err = config.load("user://settings.cfg")
	config.set_value("settings", "flap_force", Global.FLAP_FORCE)
	
	config.set_value("settings", "gravity" , Global.gravity)
	
	config.set_value("settings","pipe_speed",Global.pipe_speed)
	
	config.set_value("settings" , "mute", Global.mute)
	
	config.save("user://settings.cfg")
	
func load_settings():
	var config = ConfigFile.new()
	var err = config.load("user://settings.cfg")
	Global.FLAP_FORCE = config.get_value("settings", "flap_force", -300)
	
	Global.gravity = config.get_value("settings", "gravity" , 8.75)
	
	Global.pipe_speed = config.get_value("settings","pipe_speed", 200)
	
	Global.mute = config.get_value("settings" , "mute", false)
	
	config.save("user://settings.cfg")


func _on_Reset_Button_pressed():
	Global.FLAP_FORCE = -300
	Global.gravity = 8.75
	Global.pipe_speed = 200
	Global.mute = false
	update_settings()
