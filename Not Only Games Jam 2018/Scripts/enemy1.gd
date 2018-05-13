extends KinematicBody2D

#static enemy
var speed = 50
var dir

func _ready():
	dir = Vector2(0, speed);
	
	var random_x = randi()%500 + 200
	position = Vector2(random_x, -200)

func _process(delta):
	position += dir * delta
