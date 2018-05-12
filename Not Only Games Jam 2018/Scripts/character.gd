extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var mov = 50
var dir

var char_name
var char_surname
var death_line

var skin_color
var age
var type
var complexion

var ttl
var tth
var speed
var aoi

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	dir = Vector2(0, mov);
	pass

func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
	position += dir * delta
	ttl -= delta
	get_node("Control/TextureProgress").value = ttl
#	pass

func printInfo():
	print(str("ttl: ", ttl))
	print(str("tth: ", tth))
	print(str("speed: ", speed))
	print(str("aoi: ", aoi))