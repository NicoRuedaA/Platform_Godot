extends Area2D





func _on_to1_3_body_entered(body):
	get_tree().change_scene(Global.level1_3)


func _on_to1_4_body_entered(body):
	get_tree().change_scene(Global.level1_4)


func _on_level1_4to1_2_body_entered(body):
	get_tree().change_scene(Global.level1_2)


func _on_level1_3to1_2_body_entered(body):
	get_tree().change_scene(Global.level1_2)


