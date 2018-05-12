extends Node2D

enum ETHNIC {
	AFR
	CAU
	ASI
}

enum AGE {
	YOUNG
	MIDDLE
	OLD
}

enum COMPLEXION {
	FAT
	SLIM
}

var char_scene = preload("res://Assets/Resources/character.tscn")

var names = []
var surnames =[]
var death_lines =[]

var type = []
var skin_color = []

var assets = {
	head = {
		afr = [],
		cau = [],
		asi = []
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

func _ready():
	parseData()
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass

func loadAssets():
	pass

func instanceChar():
	var aux_char = char_scene.instance()
	
	#we set the miscellaneous data
	aux_char.char_name = names[randi() % names.size()]
	aux_char.char_surname = surnames[randi() % surnames.size()]
	aux_char.death_line = death_lines[randi() % death_lines.size()]
	
	#we set attribute and appearence modifiers
	skin = randi() % 3
	age = randi() % 3
	complexion = randi() % 2
	
	match skin:
		0:
			aux_char.skin_color = ETHNIC.AFR
			aux_char.get_node("head").texture = assets.head.afr[randi() % assets.head.afr.size()]
		1:
			aux_char.skin_color = ETHNIC.CAU
			aux_char.get_node("head").texture = assets.head.cau[randi() % assets.head.cau.size()]
		2:
			aux_char.skin_color = ETHNIC.ASI
			aux_char.get_node("head").texture = assets.head.asi[randi() % assets.head.asi.size()]
	
	match age:
		0:
			aux_char.age = AGE.YOUNG
			aux_char.get_node("head/face").texture = assets.face.young[randi() % assets.face.young.size()]
		1:
			aux_char.age = AGE.MIDDLE
			aux_char.get_node("head/face").texture = assets.face.middle[randi() % assets.face.middle.size()]
		2:
			aux_char.age = AGE.OLD
			aux_char.get_node("head/face").texture = assets.face.old[randi() % assets.face.old.size()]
	
	match complexion:
		0:
			aux_char.complexion = COMPLEXION.FAT
			aux_char.get_node("head/body").texture = assets.body.fat[randi() % assets.body.fat.size()]
		1:
			aux_char.complexion = COMPLEXION.SLIM
			aux_char.get_node("head/body").texture = assets.body.slim[randi() % assets.body.slim.size()]
		
	#reamins to implement type
	
	self.add_child(aux_char);
	
	pass

func parseData():
	var char_data = {}
	var file = File.new()

	file.open("res://data/data_characters.json", file.READ)
	var text = file.get_as_text()
	char_data = parse_json(text)
	file.close()
	
	names = char_data.name
	surnames = char_data.lastname
	death_lines = char_data.died
	pass