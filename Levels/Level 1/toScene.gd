extends Area2D


#falta mover el personaje a las posiciones correctas al cambiar de escena. Falta de tiempo

func _on_Area2D_body_entered(body):
	print("vamos al nivel 1")
	get_tree().change_scene(Global.level1_2)


func _on_Area2D2_body_entered(body):
	print("vamos al nivel 2")
	get_tree().change_scene(Global.level1_2)


func _on_to1_3_body_entered(body):
	print("vamos al nivel 3")
	get_tree().change_scene(Global.level1_3)


func _on_to1_4_body_entered(body):
	print("vamos al nivel 4")
	get_tree().change_scene(Global.level1_4)


func _on_level1_4to1_2_body_entered(body):
	get_tree().change_scene(Global.level1_2)


func _on_level1_3to1_2_body_entered(body):
	get_tree().change_scene(Global.level1_2)


func _on_to1_1_body_entered(body):
	get_tree().change_scene(Global.level1_1)
