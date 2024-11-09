extends CharacterBody2D


var SPEED = 300.0

var inminigame = false;

func _physics_process(delta: float) -> void:
	if(!inminigame):
		var direction = Input.get_vector("Left", "Right", "Up", "Down")
		velocity = direction * SPEED
		move_and_slide()


func _on_reactor_inminigame() -> void:
	inminigame = !inminigame 
