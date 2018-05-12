extends KinematicBody2D

#Enemy following the player
var speed = 3
var speed_river = 3
var dir
var target = self.position

func _ready():
	dir = Vector2(0, speed);

func _input(event):
	if (Input.is_action_pressed("mouse_pressed")):
		target = event.position

func _process(delta):
	position += Vector2(0, speed_river)
	var player = get_parent().get_parent().get_parent().get_node("Player").get_node("KinematicBody2D")

	if (target != null && position.y < player.position.y):
		dir = Vector2(target - self.position)
		print (dir)
		if (dir.length() >= 3): 
			dir = dir.normalized()
			position += speed * dir
		else:
			target = null
	