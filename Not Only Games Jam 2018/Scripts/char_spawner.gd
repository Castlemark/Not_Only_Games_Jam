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

var timeLastEnemy = OS.get_unix_time()
var frecuency = 1000

func _ready():
	randomize()
	parseData()
	loadAssets()
	pass

func _process(delta):
	
	var randomTime = randi()%frecuency
	var time_elapsed_last_enemy = OS.get_unix_time() - timeLastEnemy
	
	if (time_elapsed_last_enemy >= randomTime):
		instanceChar()
		timeLastEnemy = OS.get_unix_time()
	
	for item in self.get_children():
		if(item.position.y > 1080 or item.ttl <= 0):
			self.remove_child(item)
			return
	
	pass

func loadAssets():
	#we load afr heads
	assets.head.afr.append(load("res://Assets/Sprites/Head/Afroamerican/ch1_c3_front.png"))
	assets.head.afr.append(load("res://Assets/Sprites/Head/Afroamerican/ch6_c2_front.png"))
	assets.head.afr.append(load("res://Assets/Sprites/Head/Afroamerican/ch6_c3_front.png"))
	assets.head.afr.append(load("res://Assets/Sprites/Head/Afroamerican/ch5_c3_front.png"))
	assets.head.afr.append(load("res://Assets/Sprites/Head/Afroamerican/ch5_c2_front.png"))
	assets.head.afr.append(load("res://Assets/Sprites/Head/Afroamerican/ch4_c2_front.png"))
	assets.head.afr.append(load("res://Assets/Sprites/Head/Afroamerican/ch3_c2_front.png"))
	assets.head.afr.append(load("res://Assets/Sprites/Head/Afroamerican/ch2_c3_front.png"))
	assets.head.afr.append(load("res://Assets/Sprites/Head/Afroamerican/ch1_c4_front.png"))
	
	#we load cau heads
	assets.head.cau.append(load("res://Assets/Sprites/Head/Caucasian/ch6_c1_front.png"))
	assets.head.cau.append(load("res://Assets/Sprites/Head/Caucasian/ch5_c1_front.png"))
	assets.head.cau.append(load("res://Assets/Sprites/Head/Caucasian/ch4_c1_front.png"))
	assets.head.cau.append(load("res://Assets/Sprites/Head/Caucasian/ch3_c1_front.png"))
	assets.head.cau.append(load("res://Assets/Sprites/Head/Caucasian/ch3_c1_front.png"))
	assets.head.cau.append(load("res://Assets/Sprites/Head/Caucasian/ch2_c2_front.png"))
	assets.head.cau.append(load("res://Assets/Sprites/Head/Caucasian/ch2_c1_front.png"))
	assets.head.cau.append(load("res://Assets/Sprites/Head/Caucasian/ch1_c2_front.png"))
	assets.head.cau.append(load("res://Assets/Sprites/Head/Caucasian/ch1_c1_front.png"))
	
	#we load asi heads
	assets.head.asi.append(load("res://Assets/Sprites/Head/Asiatic/ch6_c3_front.png"))
	assets.head.asi.append(load("res://Assets/Sprites/Head/Asiatic/ch5_c3_front.png"))
	assets.head.asi.append(load("res://Assets/Sprites/Head/Asiatic/ch4_c3_front.png"))
	assets.head.asi.append(load("res://Assets/Sprites/Head/Asiatic/ch3_c3_front.png"))
	assets.head.asi.append(load("res://Assets/Sprites/Head/Asiatic/ch2_c4_front.png"))
	assets.head.asi.append(load("res://Assets/Sprites/Head/Asiatic/ch1_c6_front.png"))
	assets.head.asi.append(load("res://Assets/Sprites/Head/Asiatic/ch1_c5_front.png"))
	
	#we load young faces
	assets.face.young.append(load("res://Assets/Sprites/Face/Young/ch1.png"))
	
	#we load middle faces
	assets.face.middle.append(load("res://Assets/Sprites/Face/Middle/ch2.png"))
	assets.face.middle.append(load("res://Assets/Sprites/Face/Middle/ch5.png"))
	assets.face.middle.append(load("res://Assets/Sprites/Face/Middle/ch3.png"))
	
	#we load old faces
	assets.face.old.append(load("res://Assets/Sprites/Face/Old/ch4.png"))
	
	#we load slim bodies
	assets.body.slim.append(load("res://Assets/Sprites/body/slim/ch5_c1_front.png"))
	assets.body.slim.append(load("res://Assets/Sprites/body/slim/ch4_c2_front.png"))
	assets.body.slim.append(load("res://Assets/Sprites/body/slim/ch4_c1_front.png"))
	assets.body.slim.append(load("res://Assets/Sprites/body/slim/ch3_c2_front.png"))
	assets.body.slim.append(load("res://Assets/Sprites/body/slim/ch2_c2_front.png"))
	assets.body.slim.append(load("res://Assets/Sprites/body/slim/ch2_c1_front.png"))
	assets.body.slim.append(load("res://Assets/Sprites/body/slim/ch1_c3_front.png"))
	assets.body.slim.append(load("res://Assets/Sprites/body/slim/ch1_c2_front.png"))
	assets.body.slim.append(load("res://Assets/Sprites/body/slim/ch1_c1_front.png"))
	
	#we load fat bodies
	assets.body.fat.append(load("res://Assets/Sprites/body/fat/ch5_c2_front.png"))
	assets.body.fat.append(load("res://Assets/Sprites/body/fat/ch4_c5_front.png"))
	assets.body.fat.append(load("res://Assets/Sprites/body/fat/ch4_c3_front.png"))
	assets.body.fat.append(load("res://Assets/Sprites/body/fat/ch3_c3_front.png"))
	assets.body.fat.append(load("res://Assets/Sprites/body/fat/ch2_c4_front.png"))
	assets.body.fat.append(load("res://Assets/Sprites/body/fat/ch2_c3_front.png"))
	assets.body.fat.append(load("res://Assets/Sprites/body/fat/ch1_c7_front.png"))
	assets.body.fat.append(load("res://Assets/Sprites/body/fat/ch1_c5_front.png"))
	assets.body.fat.append(load("res://Assets/Sprites/body/fat/ch1_c4_front.png"))
	
	pass

func instanceChar():
	var aux_char = char_scene.instance()
	
	#we set the miscellaneous data
	aux_char.char_name = names[randi() % names.size()]
	aux_char.char_surname = surnames[randi() % surnames.size()]
	aux_char.death_line = death_lines[randi() % death_lines.size()]
	
	#we set attribute and appearence modifiers
	var skin = randi() % 3
	var age = randi() % 3
	var complexion = randi() % 2
	
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
			aux_char.ttl = rand_range(20.00 , 30.00)
			aux_char.speed = rand_range(0.75, 1.00)
			aux_char.tth = rand_range(12.00 , 17.00) #between 12 and 17
			aux_char.aoi = rand_range(0.5, 0.75)
		1:
			aux_char.age = AGE.MIDDLE
			aux_char.get_node("head/face").texture = assets.face.middle[randi() % assets.face.middle.size()]
			aux_char.ttl = rand_range(15.00 , 25.00) #between 15 and 25
			aux_char.speed = rand_range(1.00, 1.25)
			aux_char.tth = rand_range(7.00 , 12.00) #between 7 and 12
			aux_char.aoi = rand_range(0.75, 1.00)
		2:
			aux_char.age = AGE.OLD
			aux_char.get_node("head/face").texture = assets.face.old[randi() % assets.face.old.size()]
			aux_char.ttl = rand_range(10.00 , 20.00) #between 10 and 20
			aux_char.speed = rand_range(0.5, 0.75)
			aux_char.tth = rand_range(2.00 , 7.00) # between 2 and 7
			aux_char.aoi = rand_range(1.00, 1.25)
	
	match complexion:
		0:
			aux_char.complexion = COMPLEXION.FAT
			aux_char.get_node("head/body").texture = assets.body.fat[randi() % assets.body.fat.size()]
		1:
			aux_char.complexion = COMPLEXION.SLIM
			aux_char.get_node("head/body").texture = assets.body.slim[randi() % assets.body.slim.size()]
		
	#reamins to implement type
	
	aux_char.get_node("AnimationPlayer").play("wiggle")
	aux_char.get_node("Control/TextureProgress").max_value = aux_char.ttl
	
	aux_char.position = Vector2(randi() % 1300 + 200, -50)
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
