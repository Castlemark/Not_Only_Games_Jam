extends Sprite

var speed = 50
var dir;

func _ready():
	dir = Vector2(0, speed);
	pass

func _process(delta):
	position += dir * delta
	pass