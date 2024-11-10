extends CharacterBody2D

@export var speed = 600

var near_minigame = false
var in_minigame = false
var minigame_scene
var minigame_instance

@onready var animatedSprite = $AnimatedSprite2D

func _physics_process(delta: float) -> void:
	if(Input.is_action_pressed("Left")):
		animatedSprite.play("walk_left")
	elif(Input.is_action_pressed("Right")):
		animatedSprite.play("walk_right")
	elif(Input.is_action_pressed("Up")):
		animatedSprite.play("walk_up")
	elif(Input.is_action_pressed("Down")):
		animatedSprite.play("walk_down")
	else:
		animatedSprite.play("idle")
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
	if(Global.engine_minigame_counter == 5):
		in_minigame = false
		minigame_instance.queue_free()
		Global.engine_minigame_counter = 0
func _on_area_2d_area_entered(area: Area2D) -> void:
	if area is Machine and area.damaged:
		near_minigame = true
		minigame_scene = area.get_machine()

func _on_area_2d_area_exited(area: Area2D) -> void:
	if area is Machine:
		near_minigame = false
