extends Node2D

var speed = 0.001
var target 
var move = Vector2 (0, 0)
var player
var visible_chars


func _ready():
	visible_chars = get_parent().get_parent().get_node("char_spawner").get_children()
		
	if (visible_chars.size() != 0):
		target = visible_chars[0].position
		position = Vector2(target.x, 1100)
	
func _process(delta):
	
	if (visible_chars.size() != 0):
		move -= Vector2(0, speed)
		var collision_info = get_node("Enemy_inverted").move_and_collide(move)

func getPosition():
	return position

