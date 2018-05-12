extends Sprite

#enemy moving from side to side
var speed_river = 50
var speed_side = 50
var dir

func _ready():
	dir = Vector2(speed_side, speed_river);

func _process(delta):
	position += dir * delta
	
	if (position.x <= 0 or position.x >= 1920 - texture.get_width()):
		dir.x = - dir.x
