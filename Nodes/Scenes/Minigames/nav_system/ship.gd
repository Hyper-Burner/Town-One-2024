extends CharacterBody2D
const JUMP_VELOCITY = -65
signal pause
signal restart
signal win



func _ready():
	set_physics_process(false)
	

func _physics_process(delta: float) -> void:
	# Add the gravity.
	#if not is_on_floor():
	velocity += get_gravity() * 1.5 * delta
	# Handle jump.
	if Input.is_action_pressed("Fly"):
		velocity.y += JUMP_VELOCITY
		$AnimatedSprite2D.play("flying")
		if !$ThrusterSound.is_playing():
			$ThrusterSound.play()
		
	else:
		$AnimatedSprite2D.play("default")
		$ThrusterSound.stop()

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	move_and_slide()

func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.is_in_group("meteor") or area.is_in_group("borders"):
		pause.emit()
		$Timer.start()
		velocity.x = 0
		velocity.y = 0
		$CrashSound.play()
		set_physics_process(false)
		
	if area.is_in_group("end"):
		win.emit()
		velocity.x = 0
		velocity.y = 0
		set_physics_process(false)


func _on_timer_timeout() -> void:
	restart.emit()
	position.x = 0
	position.y = 0
	set_physics_process(true)


func _on_game_time_timeout() -> void:
	pause.emit()
	velocity.x = 0
	velocity.y = 0
	$Timer.set_paused(true)
	set_physics_process(false)


func _on_label_ready_over() -> void:
	set_physics_process(true)
