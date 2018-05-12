extends Node2D

var enemies = []
var enemy1 = preload("res://Assets/Resources/Enemy1.tscn")
var enemy2 = preload("res://Assets/Resources/Enemy2.tscn")
var enemy3 = preload("res://Assets/Resources/Enemy3.tscn")

func _ready():
	enemies.push_back(enemy1)
	enemies.push_back(enemy2)
	enemies.push_back(enemy3)
	
#	if(enemy.position.y > -5):
#		enemy = enemy1.instance()
#		enemy.position.y = -1080
#		self.add_child(enemy)

func _process(delta):
	
	if(true):
		var random = randi()%enemies.size()
		
		var enemy = enemies[random].instance()
		var random_x = randi()%1921
		enemy.position = Vector2 (random_x, -50)
		self.add_child(enemy)
	
	for item in self.get_children():
		if(item.position.y > 1080):
			self.remove_child(item)
			return
