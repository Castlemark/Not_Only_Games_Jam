extends Sprite

var speed = 5
var target = self.position


func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass

func _process(delta):
	
	self.position += Vector2(0, 1)
	movePlayer()
	pass
	
func _input(event):
	if (Input.is_action_pressed("mouse_pressed")):
		target = event.position
		
		
func movePlayer ():
	if (target != null):
		var dir = Vector2(target - self.position)
	
		if (dir.length() >= 3): 
			dir = dir.normalized()
			self.position += speed * dir
		else:
			target = null
