extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

var riu_scene = preload("res://Sprite_Riu.tscn")
var riu

func _ready():
	riu = riu_scene.instance()
	self.add_child(riu)
	pass

func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.

	if(riu.position.y > -5):
		riu = riu_scene.instance()
		riu.position.y = -1080
		self.add_child(riu)
		print(self.get_child_count())
		
	pass
