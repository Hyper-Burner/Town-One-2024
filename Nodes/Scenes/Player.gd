extends CharacterBody2D

@export var speed = 300.0

var inminigame = false;

func _physics_process(delta: float) -> void:
	if(!inminigame):
		velocity = Input.get_vector("Left", "Right", "Up", "Down") * speed
		move_and_slide()


func _on_reactor_inminigame() -> void:
	inminigame = !inminigame


func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.minigame:
		area.minigame.instantiate()
