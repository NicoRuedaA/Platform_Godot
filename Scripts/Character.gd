extends KinematicBody2D


export var gravity = 200
export var fallMultiplier = 2 
export var lowJumpMultiplier = 10 
export var jumpVelocity = 400 
export var health = 1

# Salto más alto/bajo
const JUMP_FORCE = -700.0  # Número más alto = salta más

# Caída más rápida/lenta
const GRAVITY = 1200.0  # Número más alto = cae más rápido

# Movimiento más rápido/lento
export var speed = 250  # Cambia en Character.gd
export var initialSpeed = 250  # Cambia en Character.gd


			
func matar():
		queue_free()
