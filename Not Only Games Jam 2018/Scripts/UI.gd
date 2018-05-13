extends Control

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass

func changeUI(character):
	
	self.get_node("head/name").text = character.char_name
	self.get_node("head/name/surname").text = character.char_surname
	self.get_node("head/name/surname/death").text = character.death_line
	
	self.get_node("head").texture = character.get_node("head").texture
	self.get_node("head/face").texture = character.get_node("head/face").texture
	
	
	pass
