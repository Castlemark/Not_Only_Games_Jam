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

var timeLastScene = OS.get_unix_time()
var time_elapsed_last_scene
var frecuency = 50
var randomTime
var current = 0

var scenes_visible = [false, false]

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
	createScene()

func _process(delta):
	
	randomTime = randi()%frecuency
	time_elapsed_last_scene = OS.get_unix_time() - timeLastScene
	var scenes = self.get_children()
	var scene1 = scenes[0]
	var scene2
	
	if (scenes.size() > 1): 
		scene2 = self.get_children()[1]
	
	if (scene1.position.y > -5 and scene1.position.y < 1080):
		scenes_visible[0] = true
	else: 
		scenes_visible[0] = false
		createScene()
	
	if (scene2 != null and scene2.position.y > -5 and scene2.position.y < 1080):
		scenes_visible[1] = true
	else:
		scenes_visible[1] = false
		createScene()
		

			
			
func createScene():
	
	if (current < 2 and time_elapsed_last_scene == randomTime):
		if (scenes_visible[0] == false or scenes_visible[1] == false):
			print("crea_escena")
			current += 1
			var random = randi()%scenes.size()
			var scene = scenes[random].instance()
			timeLastScene = OS.get_unix_time()
			self.add_child(scene)
			if (scenes_visible[0] == false and scenes_visible[1] == true): scenes_visible[0] = true
			else:
				scenes_visible[1] = true
	