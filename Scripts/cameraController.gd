extends Camera2D


#onready var player =  get_tree().get_nodes_in_group("player")
onready var player = get_parent().get_node("Escena/Player")
export var moveY = true
export var moveX =true

func _process(delta):
	if player != null and is_instance_valid(player):
		position = player.position
	if(moveY):
		var prueba = player.position.y
		self.position.y = prueba
	if(moveX):
		var prueba = player.position.x
		self.position.x = prueba
