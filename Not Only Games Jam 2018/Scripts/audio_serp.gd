extends AudioStreamPlayer2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var time = 0

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	self.play()
	pass

func _process(delta):
	# Called every frame. Delta is time since last frame.
	# Update game logic here.
	
	time += delta
	
	if (time > 0.9):
		self.stop()
	pass
