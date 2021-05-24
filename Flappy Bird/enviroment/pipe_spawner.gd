extends Node2D

export(PackedScene) var pipe_scene
onready var start_pos := position
var rand = RandomNumberGenerator.new()


func _on_Timer_timeout():
	if Global.started:
		var pipes = pipe_scene.instance()
		add_child(pipes)
		pipes.global_transform.origin = start_pos
		rand.randomize()
		pipes.position.y = rand.randi_range(-100, 100)

func _physics_process(delta):
	if Global.started and not Global.lost:
		position.x -= Global.pipe_speed * delta 
		
