extends Node2D

#Obstacles
var scenes = []
var scene1 = preload("res://Assets/Resources/scenes/1.tscn")
var scene2 = preload("res://Assets/Resources/scenes/2.tscn")
var scene3 = preload("res://Assets/Resources/scenes/3.tscn")
var scene4 = preload("res://Assets/Resources/scenes/4.tscn")
var scene5 = preload("res://Assets/Resources/scenes/5.tscn")
var scene6 = preload("res://Assets/Resources/scenes/6.tscn")
var scene7 = preload("res://Assets/Resources/scenes/7.tscn")
var scene8 = preload("res://Assets/Resources/scenes/8.tscn")
var scene9 = preload("res://Assets/Resources/scenes/9.tscn")
var scene10 = preload("res://Assets/Resources/scenes/10.tscn")
var scene11 = preload("res://Assets/Resources/scenes/11.tscn")
var scene12 = preload("res://Assets/Resources/scenes/12.tscn")
var scene13 = preload("res://Assets/Resources/scenes/13.tscn")
var scene14 = preload("res://Assets/Resources/scenes/14.tscn")

var timeLastEnemy = OS.get_unix_time()
var frecuency = 5000

func _ready():
	randomize()
	scenes.push_back(scene1)
	scenes.push_back(scene2)
	scenes.push_back(scene3)
	scenes.push_back(scene4)
	scenes.push_back(scene5)
	scenes.push_back(scene6)
	scenes.push_back(scene7)
	scenes.push_back(scene8)
	scenes.push_back(scene9)
	scenes.push_back(scene10)
	scenes.push_back(scene11)
	scenes.push_back(scene12)
	scenes.push_back(scene13)
	scenes.push_back(scene14)

func _process(delta):
	var randomTime = randi()%frecuency
	var time_elapsed_last_enemy = OS.get_unix_time() - timeLastEnemy
	
	if (time_elapsed_last_enemy == randomTime):
		var random = randi()%scenes.size()
		var enemy = scenes[random].instance()
		timeLastEnemy = OS.get_unix_time()
		self.add_child(enemy)
	
	for item in self.get_children():
		var itemClass = item.get_children()[0].name
		if(item.position.y > 1080):
			self.remove_child(item)
			return
	
		

#
#func createScene():
#	var random = randi()%scenes.size()
#	var scene = scenes[random].instance()
#	timeLastScene = OS.get_unix_time()
#	self.add_child(scene)
	