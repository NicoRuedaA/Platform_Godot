extends "res://Scripts/Character.gd"

# Referencias a nodos
onready var state_machine = $AnimationTree.get("parameters/playback")
onready var m_sprite = $idle
onready var m_tongueSprite = $lengua
onready var m_tongueColider = $lenguaColider
onready var ray_ground = $ray

# Variables de estado
var velocity = Vector2.ZERO
var is_jumping = false
var is_biting = false
var bite_timer = 0.0

# Sistema de doble salto
var jumps_available = 2
var current_jumps = 0

# Sistema de invulnerabilidad
var invulnerable = false
var invulnerability_duration = 1.0

const MAX_FALL_SPEED = 600.0

const DOUBLE_JUMP_FORCE = -400.0  # Segundo salto un poco más bajo
const JUMP_CUT_MULTIPLIER = 0.5  # Reduce velocidad al soltar tecla
const FALL_GRAVITY_MULTIPLIER = 1.5  # Cae más rápido de lo que sube


func _ready():
	Global.health = health


func _physics_process(delta: float) -> void:
	# Verificar colisiones con enemigos
	_check_enemy_collisions()
	
	# Obtener input horizontal
	var input_x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	# verificar si está corriendo
	var is_running = Input.is_key_pressed(KEY_SHIFT)
	# Verificar si está en el suelo
	var on_ground = ray_ground.is_colliding()
	
	# ===== MOVIMIENTO HORIZONTAL =====
	if is_running:
		velocity.x = input_x * speed * 2
	else:
		velocity.x = input_x * speed 
	
	# Voltear sprite según dirección
	if input_x > 0:
		m_sprite.set_flip_h(true)
		m_tongueSprite.set_flip_h(true)
	elif input_x < 0:
		m_sprite.set_flip_h(false)
		m_tongueSprite.set_flip_h(false)
	
	# ===== GRAVEDAD Y SALTO =====
	if on_ground and velocity.y >= 0:
		velocity.y = 0
		is_jumping = false
		current_jumps = 0  # Resetear saltos al tocar el suelo
		
		# Primer salto desde el suelo
		if Input.is_action_just_pressed("up"):
			velocity.y = JUMP_FORCE
			is_jumping = true
			current_jumps = 1
			state_machine.travel("jump")
	else:
		# Doble salto en el aire
		if Input.is_action_just_pressed("up") and current_jumps < jumps_available:
			velocity.y = DOUBLE_JUMP_FORCE
			current_jumps += 1
			state_machine.travel("jump")
		
		# Aplicar gravedad
		var gravity_force = GRAVITY
		
		# Caída más rápida que subida (feel más dinámico)
		if velocity.y > 0:
			gravity_force *= FALL_GRAVITY_MULTIPLIER
		
		velocity.y += gravity_force * delta
		
		# Salto variable (soltar tecla = salto más bajo)
		if velocity.y < 0 and Input.is_action_just_released("up"):
			velocity.y *= JUMP_CUT_MULTIPLIER
		
		# Limitar velocidad de caída
		velocity.y = min(velocity.y, MAX_FALL_SPEED)
	
	# ===== ANIMACIONES =====
	if not is_biting:
		if on_ground:
			if abs(velocity.x) > 0:
				state_machine.travel("run")
			else:
				state_machine.travel("idle")
		else:
			if velocity.y > 0:
				state_machine.travel("fall")
	
	# ===== ATAQUE CON LENGUA =====
	if Input.is_action_just_pressed("bite") and not is_biting:
		is_biting = true
		bite_timer = 0.0
		state_machine.travel("bite")
		speed = 0
	
	if is_biting:
		bite_timer += delta
		
		# Posicionar lengua según dirección
		if m_sprite.flip_h:
			m_tongueSprite.position = Vector2(83, -8)
			m_tongueColider.position = Vector2(126, -9)
		else:
			m_tongueSprite.position = Vector2(-83, -9)
			m_tongueColider.position = Vector2(-126, -9)
		
		# Terminar ataque
		if bite_timer >= 0.8:
			is_biting = false
			bite_timer = 0.0
			m_tongueColider.position = Vector2.ZERO
			speed = initialSpeed
	
	# ===== APLICAR MOVIMIENTO =====
	velocity = move_and_slide(velocity, Vector2.UP)


func _check_enemy_collisions():
	"""Verifica colisiones con enemigos durante el movimiento"""
	for i in get_slide_count():
		var collision = get_slide_collision(i)
		if collision.collider.is_in_group("enemy") and not collision.collider.is_in_group("object"):
			take_damage()


func take_damage():
	"""Recibe daño con sistema de invulnerabilidad"""
	if invulnerable:
		return
	
	# Activar invulnerabilidad
	invulnerable = true
	
	# Knockback
	velocity.x = 200 if m_sprite.flip_h else -200
	velocity.y = -200
	
	# Reducir vida
	Global.restarVida()
	Global.restarMosca()
	
	# Parpadeo visual (opcional)
	_start_damage_flash()
	
	# Verificar muerte
	if Global.health <= 0:
		Global.reset()
		return
	
	# Timer de invulnerabilidad
	yield(get_tree().create_timer(invulnerability_duration), "timeout")
	invulnerable = false


func _start_damage_flash():
	"""Efecto visual de parpadeo al recibir daño"""
	for i in range(6):  # 6 parpadeos
		m_sprite.modulate.a = 0.3
		yield(get_tree().create_timer(0.1), "timeout")
		m_sprite.modulate.a = 1.0
		yield(get_tree().create_timer(0.1), "timeout")


# Función heredada para compatibilidad
func getDamage():
	take_damage()
