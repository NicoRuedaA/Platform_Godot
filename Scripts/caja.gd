extends StaticBody2D

var broke = false
var time = 0.0
export var mosca = false

func _ready():
	broke = false
	time = 0.0

func _process(delta):
	if broke:
		time += delta
		if time > 0.5:
			queue_free() # Se elimina después de medio segundo

# Esta es la función que debe llamar la lengua
func destroy():
	if not broke:
		broke = true
		# Aquí podrías poner: $AnimationPlayer.play("romper")
		if mosca:
			# Aquí iría el código para spawnear una mosca si lo necesitas
			pass
