extends CharacterBody2D

@export var speed = 600

var selected_machine: Machine = null;

@onready var animatedSprite = $AnimatedSprite2D
@onready var globals = get_node("/root/Global")

func _physics_process(_delta: float) -> void:
	
	if Input.is_action_just_pressed("Interact") and selected_machine != null:
		selected_machine._interact();

	if(!Global.in_minigame):
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

		var direction = Input.get_vector("Left", "Right", "Up", "Down")
		velocity = direction * speed
		move_and_slide()

func _on_area_2d_area_entered(area: Area2D) -> void:
	if area is Machine and area.damaged:
		globals.active_game_machine = area;
		selected_machine = area


func _on_area_2d_area_exited(area: Area2D) -> void:
	if area is Machine:
		selected_machine = null;
		globals.active_game_machine = null;
