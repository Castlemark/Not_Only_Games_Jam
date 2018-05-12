extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

var speed = 10
var target 
var move
var player


func _ready():
	
	var random_x = randi()%1921
	position = Vector2(random_x, -50)
		
	#changeState(4);
	# Called every time the node is added to the scene.
	# Initialization here
	
	print(player)
	pass

func _process(delta):
	move = Vector2(0, 5)
	# Called every frame. Delta is time since last frame.
	# Update game logic here.
	movePlayer()
	print(move)

	var collision_info = get_node("KinematicBody2D").move_and_collide(move)


		#target = target*cam.zoom.x  + (cam.global_position - Vector2(962.17749,536.604492)*cam.zoom.x )

	
#	if (event is InputEventMouseButton or (event is InputEventMouseMotion)):
#		target = event.position
		
		
func movePlayer ():
	player = get_parent().get_parent().get_node("Player").get_node("KinematicBody2D")
	target = player.global_position

	#if (self.position.y < target.y):

	var dir = Vector2(target- self.global_position)
	if (dir.length() >= 3): 
		print("hello")
		dir = dir.normalized()
		dir = Vector2(dir.x,0) 
		move += speed * dir


func getPosition():
	return position
