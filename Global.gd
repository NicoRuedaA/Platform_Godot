extends Node2D


var from_level
var moscas


var level1_1 = "res://Levels/Level 1/scene1.tscn"
var level1_2 = "res://Levels/Level 1/scene2.tscn"
var level1_3 = "res://Levels/Level 1/scene3.tscn"
var level1_4 = "res://Levels/Level 1/scene4.tscn"
var level2 = "res://Levels/Level 2/level 2.tscn"
var GAMEOVER = "res://Levels/gameover.tscn"
var win = "res://Levels/win.tscn"

var health

func _ready():
	#hauriem de referenciar al jugador i igualar la variable heath. Mha faltat temps

	moscas = 10
	
func _process(delta):
	if(health<1):
		reset()

func restarMosca():
	moscas-=1
	if(moscas<=0):
		if(get_tree().get_current_scene().get_name() == "level 2"):
			win()
		else:
			goToBoss()
		
		
		
func reset():
	print("se acabo mamahuevo")
	get_tree().change_scene(GAMEOVER)
	
func setHealth(x):
	health = x
	
func restarVida():
	health -=1
	
	
func goToBoss():
	get_tree().change_scene(level2)

func win():
	get_tree().change_scene(win)
		
