extends Node2D


#Riu
var riu_scene = preload("res://Assets/Resources/Sprite_Riu.tscn")
var riu_img1 = preload("res://Assets/Sprites/Scenery/stage1.png")
var riu_img2 = preload("res://Assets/Sprites/Scenery/stage2.png")
var riu
var current = 1
var riu_img

func _ready():
	riu_img = [riu_img1, riu_img2]
	riu = riu_scene.instance()
	self.add_child(riu)
	pass

func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here
	
	if(riu.position.y > -5):
		riu = riu_scene.instance()
		
		if (current == 0):
			riu.get_node("image").texture = riu_img[0]
			current = 1
			
		else: 
			riu.get_node("image").texture = riu_img[1]
			current = 0
			
		
		riu.position.y = -1080
		self.add_child(riu)

	
	for item in self.get_children():
		item.position += Vector2(0,50*delta)
		if( item.position.y > 1080):
			self.remove_child(item)
			return
	