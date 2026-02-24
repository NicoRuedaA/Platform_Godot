extends KinematicBody2D

export var health = 4
var invulnerable = false # Nuestro candado

func take_damage():
	# Si es invulnerable, ignoramos CUALQUIER llamada inmediatamente
	if invulnerable:
		return
	
	# Activamos invulnerabilidad antes de restar vida
	invulnerable = true
	health -= 1
	print("Vida restante del jefe: ", health)
	
	# Feedback visual
	modulate = Color.red
	
	# Comprobar muerte
	if health <= 0:
		matar()
		return # Si muere, salimos ya

	# Esperar antes de poder recibir daño otra vez
	# Usamos un Timer del árbol para que sea más fiable
	yield(get_tree().create_timer(0.8), "timeout") 
	
	modulate = Color.white
	invulnerable = false # Abrimos el candado

func matar():
	if get_tree().get_current_scene().get_name() == "level 2":
		Global.win()
	else:
		Global.restarMosca()
	queue_free()
