extends Node2D

# scene
var speed = 50
var dir

func _ready():
	dir = Vector2(0, speed);
	
	position = Vector2(0, -600)

func _process(delta):
	position += dir * delta
