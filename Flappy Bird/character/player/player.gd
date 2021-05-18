extends RigidBody2D

export var FLAP_FORCE = -300
onready var animator = $AnimationPlayer


func _physics_process(delta):
	if Input.is_action_just_pressed("flap"):
		if !Global.started:
			start()
		flap()
		
	if linear_velocity.y == 0 and Global.started:
		$Sprite.rotation_degrees = 90
	elif linear_velocity.y < 0:
		$Sprite.rotation_degrees = lerp($Sprite.rotation_degrees, -30, 25 * delta)
	else:
		$Sprite.rotation_degrees = lerp($Sprite.rotation_degrees, linear_velocity.y / 6, 25 * delta)
		$Sprite.rotation_degrees = clamp($Sprite.rotation_degrees, -90, 90)


func start():
	if Global.started: return
	Global.started = true
	gravity_scale = 7.0
	animator.play("flap")

func flap():
	linear_velocity.y = FLAP_FORCE
	$AudioStreamPlayer2D.play()

func die():
	pass
