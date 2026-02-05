extends KinematicBody2D

func _physics_process(delta: float) -> void:

	for i in get_slide_count():
		var collision = get_slide_collision(i)
		if(collision.collider.is_in_group("enemy")):
			print(collision.collider.name)
