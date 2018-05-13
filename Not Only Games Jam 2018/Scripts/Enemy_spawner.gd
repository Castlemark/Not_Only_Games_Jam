extends Node2D

var enemies = []
var enemy1 = preload("res://Assets/Resources/enemy_static.tscn")
var enemy2 = preload("res://Assets/Resources/enemy_move.tscn")
var enemy3 = preload("res://Assets/Resources/enemy_follow.tscn")
var enemy4 = preload("res://Assets/Resources/enemy_kill.tscn")
var timeLastEnemy = OS.get_unix_time()
var frecuency = 500

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
		#enemy.set_class("enemy")
		timeLastEnemy = OS.get_unix_time()
		self.add_child(enemy)
	
	for item in self.get_children():
		if(item.position.y > 1080):
			self.remove_child(item)
			return
