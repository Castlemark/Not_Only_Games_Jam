extends KinematicBody2D

#enemy moving from side to side
var speed_river = 50
var speed_side = 50
var dir

func _ready():
	dir = Vector2(speed_side * 5, speed_river);

func _process(delta):
	print (get_node("enemy3"))
	position += dir * delta

	if (self.dir.x < 0):
		rotation -= delta * PI 
	else: 
		rotation += delta * PI 
	
	if (position.x <= 0 or position.x >= 1920 - get_node("enemy2").texture.get_width()):
		dir.x = - dir.x
		