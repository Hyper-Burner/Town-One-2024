extends CharacterBody2D

@export var speed = 300

var near_minigame = false
var in_minigame = false
var minigame_scene
var minigame_instance

func _physics_process(delta: float) -> void:
	if near_minigame and !in_minigame and Input.is_action_just_pressed("Interact"):
		minigame_instance = minigame_scene.instantiate()
		$Camera2D.add_child(minigame_instance)
		in_minigame = true
	elif in_minigame and Input.is_action_just_pressed("Interact"):
		minigame_instance.queue_free()
		in_minigame = false

	if(!in_minigame):
		var direction = Input.get_vector("Left", "Right", "Up", "Down")
		velocity = direction * speed
		move_and_slide()

func _on_area_2d_area_entered(area: Area2D) -> void:
	if area is Machine:
		near_minigame = true
		minigame_scene = area.get_machine()

func _on_area_2d_area_exited(area: Area2D) -> void:
	if area is Machine:
		near_minigame = false
