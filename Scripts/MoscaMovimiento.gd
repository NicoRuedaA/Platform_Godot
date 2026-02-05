extends "res://Scripts/Mosca.gd"

onready var m_sprite = $AnimatedSprite

func _physics_process(delta):
	if(direction):
		m_sprite.set_flip_h(true)
		move_and_slide(Vector2(speed, 0))
	else:
		m_sprite.set_flip_h(false)
		move_and_slide(Vector2(-speed, 0))


func _on_Area2D_body_entered(body):
	changeDirection()
	
func _on_Area2D3_body_entered(body):
	changeDirection()
	
func changeDirection():
	self.direction=!self.direction

