extends Sprite

#enemy moving from side to side
var speed_river = 50
var speed_side = 50
var dir

func _ready():
	dir = Vector2(speed_side * 5, speed_river);

func _process(delta):
	position += dir * delta

	if (self.dir.x < 0):
		flip_h = false
		rotation -= delta * PI 
	else: 
		flip_h = true
		rotation += delta * PI 
	
	if (position.x <= 0 or position.x >= 1920 - texture.get_width()):
		dir.x = - dir.x
		