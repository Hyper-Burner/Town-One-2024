extends Node2D

var isInteract = false
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if(Input.is_action_just_pressed("Interact") && isInteract== true):
		print("button pressed") #send signal to change 


func _on_area_2d_area_entered(area: Area2D) -> void:
	isInteract = true
	print("area entered")


func _on_area_2d_area_exited(area: Area2D) -> void:
	isInteract = false
