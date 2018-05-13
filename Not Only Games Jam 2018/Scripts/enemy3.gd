extends Node2D

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

	var collision_info = get_node("Enemy").move_and_collide(move)
		
		
func movePlayer ():
	player = get_parent().get_parent().get_node("Player").get_node("KinematicBody2D")
	target = player.global_position

	var dir = Vector2(target- self.global_position)
	if (dir.length() >= 3): 
		dir = dir.normalized()
		dir = Vector2(dir.x,0) 
		move += speed * dir

func getPosition():
	return position
