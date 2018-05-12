extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var names = []
var surnames =[]
var death_lines =[]

var assets = {
	head = {
		young = {
			afr = [],
			cau = [],
			asi = []
		},
		middle ={
			afr = [],
			cau = [],
			asi = []
		},
		old = {
			afr = [],
			cau = [],
			asi = []
		}
	},
	face = {
		young = [],
		middle = [],
		old = []
	},
	body ={
		fat = [],
		slim = []
	}
}

var head_afr_young = []
var head_afr_middle = []
var head_afr_old = []
var head_cau_young = []
var head_cau_middle = []
var head_cau_old = []
var head_asi_young = []
var head_asi_middle = []
var head_asi_old = []

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass

func loadAssets():
	pass

func instanceChar():
	pass

func parseData():
	pass
