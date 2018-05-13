extends KinematicBody2D

#enemy moving from side to side
var speed_river = 50
var speed_side = 50
var dir

func _ready():
	dir = Vector2(speed_side * 5, speed_river);
	var random_x = randi() % 1300 + 200
	position = Vector2(random_x, -50)

func _process(delta):
	position += dir * delta

	if (self.dir.x < 0):
		rotation -= delta * PI 
	else: 
		rotation += delta * PI 
	
	if (position.x <= 200 or position.x >= 1600 - get_node("enemy2").texture.get_width()):
		dir.x = - dir.x
		