extends Sprite

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

var speed = 10
var dir;

func _ready():
	
	dir = Vector2(0,speed);
	
	pass

func _process(delta):
	moveBackground(delta)
	pass
	
func setPosY(y):
	self.position = Vector2(0,y)
	



func moveBackground(delta):
	position = (position + dir * delta)