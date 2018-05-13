extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
signal button_press
var dintre = false

var mov = 50
var dir

var char_name
var char_surname
var death_line

var skin_color
var age
var type = 0
var complexion

var ttl
var tth
var speed
var aoi

var possesed = false


func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	dir = Vector2(0, mov);
	pass

func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
	if !possesed:
		position += dir * delta
	ttl -= delta
	get_node("Control/TextureProgress").value = ttl
#	pass

func _input(event):
	if Input.is_action_pressed("mouse_pressed"):
		print(dintre)

func printInfo():
	print(str("ttl: ", ttl))
	print(str("tth: ", tth))
	print(str("speed: ", speed))
	print(str("aoi: ", aoi))

func copyInfo(character):
	char_name = character.char_name
	char_surname = character.char_surname
	death_line = character.death_line
	
	skin_color = character.skin_color
	age = character.age
	type = character.type
	complexion = character.complexion
	
	ttl = character.ttl
	tth = character.tth
	speed = character.speed
	aoi = character.aoi
	
	get_node("Control/TextureProgress").max_value = character.get_node("Control/TextureProgress").max_value
	
	get_node("head").texture = character.get_node("head").texture
	get_node("head/face").texture = character.get_node("head/face").texture
	get_node("head/body").texture = character.get_node("head/body").texture
	dir = Vector2(0,0)
	possesed = true
	position += Vector2(0,50)
	
	pass


func _on_KinematicBody2D_mouse_entered():
	dintre = true


func _on_KinematicBody2D_mouse_exited():
	dintre = false
