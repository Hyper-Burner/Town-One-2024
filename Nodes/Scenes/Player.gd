extends CharacterBody2D

const SPEED = 300.0

func _physics_process(delta: float) -> void:
	velocity = Input.get_vector("Left", "Right", "Up", "Down") * SPEED
	move_and_slide()
