extends Node
# class member variables go here, for example:
# var a = 2
# var b = "textvar"

var merge

var time_start = 0
var time_now = 0
var time_elapsed

func _ready():
	time_start = OS.get_unix_time()

func _process(delta):
	time_now = OS.get_unix_time()
	time_elapsed = time_now - time_start