extends Sprite

#Enemy following the player
var speed = 50
var dir

func _ready():
	dir = Vector2(0, speed);

func _process(delta):
	position += dir * delta
