extends StaticBody2D

var broke
var moscaPrefab
export var mosca = false

var time 


# Called when the node enters the scene tree for the first time.
func _ready():
	broke = false
	time= 0

#funcion que detecte la colision

func _process(delta):
	if(broke):
		time+=delta
		if(time>0.5):
			func matar():
		queue_free()

func romper():
	if(mosca):
		pass
	
	
		#play animationW
		#cuando acabe la animacion
		#if mosca
			#instanciar mosca
		#eliminar caja
