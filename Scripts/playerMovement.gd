extends "res://Scripts/Character.gd"

# Referencias a nodos
onready var state_machine = $AnimationTree.get("parameters/playback")
onready var m_sprite = $idle
onready var m_tongueSprite = $lengua
onready var m_tongueColider = $lenguaColider # El Area2D
onready var ray_ground = $ray

# Variables de estado
var velocity = Vector2.ZERO
var is_jumping = false
var is_biting = false
var bite_timer = 0.0

# Variable manual para el salto con tecla física W o Flecha Arriba
var _was_up_pressed = false

# Sistema de doble salto
var jumps_available = 2
var current_jumps = 0

# Sistema de invulnerabilidad (Daño al jugador)
var invulnerable = false
var invulnerability_duration = 1.0

const MAX_FALL_SPEED = 600.0
const DOUBLE_JUMP_FORCE = -400.0
const JUMP_CUT_MULTIPLIER = 0.5
const FALL_GRAVITY_MULTIPLIER = 1.5

func _ready():
	# Tomamos la vida del Global para que no se reinicie al cambiar de escena
	if Global.health != null:
		self.health = Global.health
	
	# Desactivamos la lengua al inicio por seguridad
	_set_tongue_collision(true)

func _physics_process(delta: float) -> void:
	# 1. Verificar si los enemigos tocan al jugador
	_check_enemy_collisions()
	
	# --- LÓGICA MANUAL PARA SALTO (W o Flecha Arriba) ---
	var is_up_pressed = Input.is_key_pressed(KEY_W) or Input.is_key_pressed(KEY_UP)
	var up_just_pressed = is_up_pressed and not _was_up_pressed
	var up_just_released = not is_up_pressed and _was_up_pressed
	_was_up_pressed = is_up_pressed # Guardamos el estado para el siguiente frame
	# ----------------------------------------------------
	
	# 2. Obtener Input leyendo las teclas físicas WASD y Flechas
	var input_x = 0.0
	if Input.is_key_pressed(KEY_D) or Input.is_key_pressed(KEY_RIGHT):
		input_x += 1.0
	if Input.is_key_pressed(KEY_A) or Input.is_key_pressed(KEY_LEFT):
		input_x -= 1.0
		
	var is_running = Input.is_key_pressed(KEY_SHIFT)
	var on_ground = ray_ground.is_colliding()
	
	# ===== MOVIMIENTO HORIZONTAL =====
	if is_running:
		velocity.x = input_x * speed * 2
	else:
		velocity.x = input_x * speed 
	
	# Voltear sprites según dirección
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
		current_jumps = 0
		
		# Salto normal
		if up_just_pressed:
			velocity.y = JUMP_FORCE
			is_jumping = true
			current_jumps = 1
			state_machine.travel("jump")
	else:
		# Doble salto
		if up_just_pressed and current_jumps < jumps_available:
			velocity.y = DOUBLE_JUMP_FORCE
			current_jumps += 1
			state_machine.travel("jump")
		
		# Aplicar gravedad
		var gravity_force = GRAVITY
		if velocity.y > 0:
			gravity_force *= FALL_GRAVITY_MULTIPLIER
		
		velocity.y += gravity_force * delta
		
		# Salto variable (soltar tecla = salto corto)
		if velocity.y < 0 and up_just_released:
			velocity.y *= JUMP_CUT_MULTIPLIER
		
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
		speed = 0 # El jugador se detiene al atacar
		
		# RE-ACTIVAR LA LENGUA
		_set_tongue_collision(false)
	
	if is_biting:
		bite_timer += delta
		
		# Posicionar la lengua (Area2D) según dirección
		if m_sprite.flip_h:
			m_tongueSprite.position = Vector2(83, -8)
			m_tongueColider.position = Vector2(126, -9)
		else:
			m_tongueSprite.position = Vector2(-83, -9)
			m_tongueColider.position = Vector2(-126, -9)
		
		# Finalizar ataque
		if bite_timer >= 0.8:
			is_biting = false
			bite_timer = 0.0
			m_tongueColider.position = Vector2.ZERO
			speed = initialSpeed
			_set_tongue_collision(true) # Desactivar al terminar
	
	# ===== APLICAR MOVIMIENTO FINAL =====
	velocity = move_and_slide(velocity, Vector2.UP)

# Función auxiliar para activar/desactivar el colisionador
func _set_tongue_collision(disabled_status):
	if m_tongueColider:
		for child in m_tongueColider.get_children():
			if child is CollisionShape2D:
				child.disabled = disabled_status

func _check_enemy_collisions():
	"""Verifica colisiones físicas con el cuerpo del jugador (Daño recibido)"""
	for i in get_slide_count():
		var collision = get_slide_collision(i)
		if collision and collision.collider:
			var body = collision.collider
			if body.is_in_group("enemy") and not body.is_in_group("object"):
				take_damage()

func take_damage():
	"""Sistema de daño del jugador"""
	if invulnerable:
		return
	
	invulnerable = true
	# Knockback
	velocity.x = 200 if m_sprite.flip_h else -200
	velocity.y = -200
	
	Global.restarVida()
	_start_damage_flash()
	
	if Global.health <= 0:
		return 

	yield(get_tree().create_timer(invulnerability_duration), "timeout")
	invulnerable = false

func _start_damage_flash():
	for i in range(6):
		m_sprite.modulate.a = 0.3
		yield(get_tree().create_timer(0.1), "timeout")
		m_sprite.modulate.a = 1.0
		yield(get_tree().create_timer(0.1), "timeout")

func getDamage():
	take_damage()

# SEÑAL: Conecta el body_entered de tu Area2D de la lengua a esta función
func _on_Area2D_body_entered(body):
	if is_biting:
		if body.has_method("take_damage"):
			body.take_damage()
			_set_tongue_collision(true) 
			return
		elif body.is_in_group("enemy"):
			Global.restarMosca()
			body.queue_free()
