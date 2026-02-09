extends "res://Scripts/Character.gd"

export var direction = true





func _physics_process(delta):
	for index in get_slide_count():
		var collision = get_slide_collision(index)
		if collision.collider.is_in_group("player"):
			# La mosca solo le quita vida al jugador
			collision.collider.take_damage()
		#			print("lenguetaso")
		#			var dir
					#if(position.x<body.collider.position.x):
					#	dir = 1
					#else:
					#	dir = 1
					#print(1)
					#print(str(position.x) + " " + str(body.collider.position.x))
	#			
	

	#detectar colision
	#si la colision es del grupo path
		#cambiar direction
	#sino, si la colision es de tipo puntita
		#health --
		#if health <= 0 
			#destruir
			#player moscas matadas ++

