extends Node2D

var enemies = []
var enemy1 = preload("res://Assets/Resources/Enemy1.tscn")
var enemy2 = preload("res://Assets/Resources/Enemy2.tscn")
var enemy3 = preload("res://Assets/Resources/Enemy3.tscn")

func _ready():
	
	enemies.push_back(enemy1)
	enemies.push_back(enemy2)
	enemies.push_back(enemy3)
	# Called every time the node is added to the scene.
	# Initialization here
	pass
	
#	if(enemy.position.y > -5):
#		enemy = enemy1.instance()
#		enemy.position.y = -1080
#		self.add_child(enemy)

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
