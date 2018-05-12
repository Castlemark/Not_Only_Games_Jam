extends ProgressBar


func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass

func _process(delta):
	var parent = get_parent().get_parent()
	value = parent.time_elapsed
	#var parent_game = get_parent().get_parent();
	#value = parent_game.time_elapsed / parent_game.total_time