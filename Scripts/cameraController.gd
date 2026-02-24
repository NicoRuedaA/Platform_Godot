extends Camera2D

var player = null
export var moveY = true
export var moveX = true

func _ready():
	# Buscamos al primer nodo en el grupo "player"
	var players = get_tree().get_nodes_in_group("player")
	if players.size() > 0:
		player = players[0]
	else:
		print("Error: No se encontró ningún nodo en el grupo 'player'")

func _process(delta):
	# Verificamos que el player exista antes de pedirle la posición
	if player != null and is_instance_valid(player):
		if moveX:
			position.x = player.position.x
		if moveY:
			position.y = player.position.y
