extends Node2D


var from_level
var moscas = 10
var health = 3 # Define la vida inicial aquí


var level1_1 = "res://Levels/Level 1/scene1.tscn"
var level1_2 = "res://Levels/Level 1/scene2.tscn"
var level1_3 = "res://Levels/Level 1/scene3.tscn"
var level1_4 = "res://Levels/Level 1/scene4.tscn"
var level2 = "res://Levels/Level 2/level 2.tscn"
var GAMEOVER = "res://Levels/gameover.tscn"
var win = "res://Levels/win.tscn"



func _ready():
	#hauriem de referenciar al jugador i igualar la variable heath. Mha faltat temps

	pass
	
func _process(delta):
	if(health<1):
		reset()

func restarMosca():
	moscas -= 1
	
	# Condición específica: Si quedan exactamente 4 moscas, cambiamos al nivel 1.2
	if moscas == 4:
		get_tree().change_scene(level1_2)
		return # Salimos de la función para que no ejecute lo de abajo en este frame

	# Lógica original para cuando llegas a 0 moscas
	if moscas <= 0:
		if get_tree().get_current_scene().get_name() == "level 2":
			win()
		else:
			goToBoss()
		
		
		
	
func setHealth(x):
	health = x
	
func restarVida():
	health -=1
	if health <= 0:
		reset()
	
	
func goToBoss():
	get_tree().change_scene(level2)

func win():
	get_tree().change_scene(win)
	
func reset():
	health = 3 # Resetear vida al morir de verdad
	moscas = 10
	get_tree().change_scene(GAMEOVER)
		
