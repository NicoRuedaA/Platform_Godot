extends Label

func _process(delta):
	# Buscamos al jefe en el grupo
	var boss_nodes = get_tree().get_nodes_in_group("boss")
	
	if boss_nodes.size() > 0:
		var boss = boss_nodes[0] # Tomamos al primer jefe que encuentre
		text = "x" + str(boss.health)
	else:
		# Si el jefe muere o no está, podemos ocultar el texto o poner 0
		text = ""
