extends KinematicBody2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

var speed = 5
var target = self.position
var move = 0
var type = 1;
var cam;
# tipus
#	1: + velocitat
#	2: - velocitat
#	3: vista
# 	5: rebelde : controls al revés
#	6: señuelo

func setStandardState():
	speed = 5;

	cam.current = false;
	get_node("Camera Ceg/ceg").hide()
	
	
func changeState(type):
	setStandardState()
	match type:
		1: 
			speed = 10
		2:
			speed = 2
		3: 
			cam.current = true;
			get_node("Camera Ceg/ceg").show()
			
		
		

func _ready():
	cam = get_node("Camera Ceg");
	setStandardState()
	changeState(3);
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
		cam.zoom = Vector2(1,1)
		target = event.position
		cam.zoom = Vector2(0.5,0.5)
		#target = target*cam.zoom.x  + (cam.global_position - Vector2(962.17749,536.604492)*cam.zoom.x )
		print(target)
	
#	if (event is InputEventMouseButton or (event is InputEventMouseMotion)):
#		target = event.position
		
		
func movePlayer ():
	if (target != null):
		var dir = Vector2(target - self.position)
	
		if (dir.length() >= 3): 
			dir = dir.normalized()
			move += speed * dir
		else:
			target = null

func getPosition():
	return position
