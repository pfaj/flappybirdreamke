extends Node2D

export(PackedScene) var pipe_scene
export var speed = 200
onready var start_pos := position
var rand = RandomNumberGenerator.new()


func _on_Timer_timeout():
	print("SPAWN")
	var pipes = pipe_scene.instance()
	add_child(pipes)
	pipes.global_transform.origin = start_pos
	pipes.position.y = rand.randi_range(-100,100)

func _physics_process(delta):
	position.x -= speed * delta
