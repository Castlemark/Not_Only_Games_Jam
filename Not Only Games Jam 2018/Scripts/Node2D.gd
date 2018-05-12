extends Node2D

var merge

var riu_scene = preload("res://Assets/Resources/Sprite_Riu.tscn")
var riu

func _ready():
	riu = riu_scene.instance()
	self.add_child(riu)
	pass

func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here
	
	if(riu.position.y > -5):
		riu = riu_scene.instance()
		riu.position.y = -1080
		self.add_child(riu)

	
	for item in self.get_children():
		item.position += Vector2(0,50*delta)
		if( item.position.y > 1080):
			self.remove_child(item)
			return
	