extends Node
# class member variables go here, for example:
# var a = 2
# var b = "textvar"

var merge

var time_start = 0
var time_now = 0
var time_elapsed
var enemies = []
var enemy1 = preload("res://Assets/Resources/Enemy1.tscn")
var enemy2 = preload("res://Assets/Resources/Enemy2.tscn")
var enemy3 = preload("res://Assets/Resources/Enemy3.tscn")


func _ready():
	pass
	enemies.push_back(enemy1)
	enemies.push_back(enemy2)
	enemies.push_back(enemy3)
#	enemy = enemy1.instance()
#	self.add_child(enemy)

func _process(delta):
	pass
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here
	
#
#	if(enemy.position.y > -5):
#		enemy = enemy1.instance()
#		enemy.position.y = -1080
#		self.add_child(enemy)
	