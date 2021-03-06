extends KinematicBody2D

var speed = 5
var target = self.position
var move = 0
var type = 1;
var cam;
var sentit = 1;
var char_scene = preload("res://Assets/Resources/character.tscn")
var ghost_scene = preload("res://Assets/Resources/ghost.tscn")
var mouse_pos
var score = 0
var ttl = 70;
# tipus
#	1: + velocitat
#	2: - velocitat
#	3: vista
# 	5: rebelde : controls al revés
#	6: señuelo

func setStandardState():
	speed = 5;
	sentit = 1;
	cam.current = false;
	get_parent().get_parent().get_node("Camera2D").current = true
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
			get_parent().get_parent().get_node("Enemy_spawner").hide()
		4: 
			sentit = -1
			
		
		
func check_ttl():
	if (position.y >= 1070 or ttl <= 0) : get_tree().change_scene("res://Assets/Resources/game_over.tscn")

func _ready():
	cam = get_node("Camera Ceg");
	setStandardState()
	pass

func _process(delta):
	check_ttl();
	ttl -= delta
	for body_inside in bodies:
		if ("character" in body_inside.get_parent().name):
			if (Vector2(mouse_pos - (Vector2(body_inside.global_position + Vector2(0,-50)))).length() < 100 ):
				print("Helo 3")
				var aux = char_scene.instance()
				ttl = body_inside.get_parent().ttl
				print(body_inside.get_parent().name)
				for item in aux.get_children():
					if(item.name == "KinematicBody2D"):
						aux.remove_child(item)
				aux.copyInfo(body_inside.get_parent())
				calcula_score(aux)
				self.remove_child(get_node("icon"))
				aux.name = 'icon'
				var move = body_inside.get_parent().position - self.get_parent().position
				changeState(body_inside.get_parent().type)
				
				body_inside.get_parent().get_parent().remove_child(body_inside.get_parent())
				
				var ghost = ghost_scene.instance()
				ghost.name = "ghost"
				self.add_child(ghost)
				
				self.get_node("ghost/AnimationPlayer").play("die")
				
				self.move_and_collide(to_local(move))
				self.add_child(aux)
				
				print(self.get_node("../../Control/UI").changeUI(aux))
			
	move = Vector2(0, 1)
	# Called every frame. Delta is time since last frame.
	# Update game logic here.
	movePlayer()
	
	var collision_info = move_and_collide(move)
	
	if collision_info: 
		move = move.bounce(collision_info.normal)
		var collider = collision_info.collider
		if (collider.name == "Enemy"):
			ttl -= randi()%5 + 2
			collider.hide()
			return
	
	
func calcula_score(body):
	if(score!= 0):
		
		if(body.skin_color != get_node("icon").skin_color):
			score += 1
		if(body.age != get_node("icon").age):
			score += 1
		if(body.type != get_node("icon").type):
			score += 1
		if(body.complexion != get_node("icon").complexion):
			score += 1
	else:
		score = 4
	get_parent().get_parent().get_node("Control").get_node("Label").text = str("Score: ",score)
		
func _input(event):
	
	if (Input.is_action_pressed("mouse_pressed")):
		mouse_pos = event.position
		if (cam.current):			
			cam.zoom = Vector2(1,1)
			target = event.position
			cam.zoom = Vector2(0.5,0.5)
		else:
			target = event.position
	if( Input.is_action_just_released("mouse_pressed")):
		mouse_pos = Vector2( 10000,1000)
		
func movePlayer ():
	if (target != null):
		var dir = Vector2(target - self.position)
	
		if (dir.length() >= 3): 
			dir = dir.normalized()
			move += speed * dir * sentit
		else:
			target = null

func getPosition():
	return position

var bodies = []
func _on_Area2D_body_entered(body):
	bodies.append(body)
	


func _on_Area2D_body_exited(body):
	bodies.erase(body)
	pass # replace with function body
