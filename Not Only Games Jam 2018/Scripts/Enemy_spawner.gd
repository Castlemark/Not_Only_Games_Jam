extends Node2D

var enemies = []
var enemy1 = preload("res://Assets/Resources/enemy1.tscn")
var enemy2 = preload("res://Assets/Resources/enemy2.tscn")
var enemy3 = preload("res://Assets/Resources/enemy3.tscn")
var enemy4 = preload("res://Assets/Resources/enemy3.tscn")
var timeLastEnemy = OS.get_unix_time()
var frecuency = 50

func _ready():
	randomize()
	enemies.push_back(enemy1)
	enemies.push_back(enemy2)
	enemies.push_back(enemy3)
	enemies.push_back(enemy4)

func _process(delta):
	var randomTime = randi()%frecuency
	var time_elapsed_last_enemy = OS.get_unix_time() - timeLastEnemy
	
	if (time_elapsed_last_enemy == randomTime):
		var random = randi()%enemies.size()
		var enemy = enemies[random].instance()
		timeLastEnemy = OS.get_unix_time()
		var random_x = randi()%1921
		enemy.position = Vector2 (random_x, -50)
		self.add_child(enemy)
	
	for item in self.get_children():
		if(item.position.y > 1080):
			self.remove_child(item)
			return
