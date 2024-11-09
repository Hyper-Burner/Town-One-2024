extends CharacterBody2D

@export var speed = 300

var near_minigame = false
var in_minigame = false
var minigame

func _physics_process(delta: float) -> void:
	if(!in_minigame):
		var direction = Input.get_vector("Left", "Right", "Up", "Down")
		velocity = direction * speed
		move_and_slide()

	if near_minigame and Input.is_action_just_pressed("Interact"):
		print("button pressed") #freeze player
		in_minigame = !in_minigame
		print(minigame)
		var instance = minigame.instantiate()
		$Camera2D.add_child(instance)

func _on_area_2d_area_entered(area: Area2D) -> void:
	print(area.minigame)
	if area is Machine:
		near_minigame = true
		minigame = area.get_machine()
