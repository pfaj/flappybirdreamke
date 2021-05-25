extends RigidBody2D

onready var animator = $AnimationPlayer

func _unhandled_input(event):
	if event is InputEventMouseButton:
		if event.pressed:
			if Global.settings_menu:
				return
			else:
				if !Global.started and !Global.lost:
					start()
				if !Global.lost:
					flap()
	
	if event is InputEventKey:
		if event.is_action_pressed("flap"):
			if !Global.started and !Global.lost:
				start()
			if !Global.lost:
				flap()

func _process(delta):
			
	if linear_velocity.y == 0 and Global.started:
		$Sprite.rotation_degrees = 90
	
		$red_bird.rotation_degrees = 90		
		
		$blue_bird.rotation_degrees = 90	
			
		$black_bird.rotation_degrees = 90
		
		$white_bird.rotation_degrees = 90
		
		$gray_bird.rotation_degrees = 90
			
	elif linear_velocity.y < 0:	
		$Sprite.rotation_degrees = lerp($Sprite.rotation_degrees, -30, 25 * delta)
		
		$red_bird.rotation_degrees = lerp($red_bird.rotation_degrees, -30, 25 * delta)
		
		$blue_bird.rotation_degrees = lerp($blue_bird.rotation_degrees, -30, 25 * delta)
		
		$black_bird.rotation_degrees = lerp($black_bird.rotation_degrees, -30, 25 * delta)
		
		$white_bird.rotation_degrees = lerp($white_bird.rotation_degrees, -30, 25 * delta)
	
		$gray_bird.rotation_degrees = lerp($gray_bird.rotation_degrees, -30, 25 * delta)	
	else:
		$Sprite.rotation_degrees = lerp($Sprite.rotation_degrees, linear_velocity.y / 6, 25 * delta)
		$Sprite.rotation_degrees = clamp($Sprite.rotation_degrees, -90, 90)
		
		$red_bird.rotation_degrees = lerp($red_bird.rotation_degrees, linear_velocity.y / 6, 25 * delta)
		$red_bird.rotation_degrees = clamp($red_bird.rotation_degrees, -90, 90)
		
		$blue_bird.rotation_degrees = lerp($blue_bird.rotation_degrees, linear_velocity.y / 6, 25 * delta)
		$blue_bird.rotation_degrees = clamp($blue_bird.rotation_degrees, -90, 90)
		
		$black_bird.rotation_degrees = lerp($black_bird.rotation_degrees, linear_velocity.y / 6, 25 * delta)
		$black_bird.rotation_degrees = clamp($black_bird.rotation_degrees, -90, 90)

		$white_bird.rotation_degrees = lerp($white_bird.rotation_degrees, linear_velocity.y / 6, 25 * delta)
		$white_bird.rotation_degrees = clamp($white_bird.rotation_degrees, -90, 90)
		
		$gray_bird.rotation_degrees = lerp($gray_bird.rotation_degrees, linear_velocity.y / 6, 25 * delta)
		$gray_bird.rotation_degrees = clamp($gray_bird.rotation_degrees, -90, 90)
func start():
	if Global.started: return
	Global.started = true
	gravity_scale = Global.gravity
	animator.play("flap")
	$red_bird_ani.play("flap")
	$blue_bird_ani.play("flap")
	$black_bird_ani.play("flap")
	$gray_bird_ani.play("flap")
	$white_bird_ani.play("flap")
	$button_press.play()
	
func flap():
	linear_velocity.y = Global.FLAP_FORCE
	$AudioStreamPlayer2D.play()
	
func die():
	pass

