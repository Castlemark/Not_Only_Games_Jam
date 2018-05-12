extends Sprite

#Enemy following the player
var speed = 50
var dir

func _ready():
	dir = Vector2(0, speed);
	var random_x = randi()%1921
	position = Vector2(random_x, -50)

func _process(delta):
	position += dir * delta
