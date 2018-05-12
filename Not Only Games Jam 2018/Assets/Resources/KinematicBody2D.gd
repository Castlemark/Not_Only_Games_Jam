extends KinematicBody2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var merge
var speed = 5
var target = self.position
var move = 0
var type = 0
var dir
# tipus
#	1: + velocitat
#	2: - velocitat
#	3: vista
#	4: matar enemic
# 	5: rebelde : controls al revés
#	6: señuelo

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass

func _process(delta):
	move = Vector2(0, 1)
	# Called every frame. Delta is time since last frame.
	# Update game logic here.
	movePlayer()
	
	var collision_info = move_and_collide(move)
	
	if collision_info: 
		move = move.bounce(collision_info.normal)
	

func _input(event):
	if (Input.is_action_pressed("mouse_pressed")):
		target = event.position
		
		
func movePlayer ():
	if (target != null):
		dir = Vector2(target - self.position)
		
		if (dir.length() >= 3): 
			dir = dir.normalized()
			move += speed * dir
		else:
			target = null
			
func getPosition():
	return position
