extends "res://Scripts/Character.gd"


export var mosca = false


onready var sprite = preload("res://Objects/Mosca/MoscaEstatica/moscaEstatica.tscn")
onready var scene = get_parent().get_parent().get_parent().get_node("Moscas")

var animator
var broke
var time

func _ready():
	broke = false
	animator = $AnimatedSprite
	time = 0

func _process(delta):
	
	
	if(broke):
		time += 1*delta
		if(time>1):
			if(mosca):
				var bolita = sprite.instance()
				var instancePosition = self.get_global_position()
				print(scene.name)
				scene.add_child(bolita)
				bolita.position = instancePosition
			queue_free()
			


func destroy():
	broke = true
	animator.frame=1
	

