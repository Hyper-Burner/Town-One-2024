extends Area2D

signal inminigame

var isInteract = false
var minigame = Global.Reactor

func _process(delta: float) -> void:
	if(Input.is_action_just_pressed("Interact") && isInteract== true):
		print("button pressed") #freeze player
		inminigame.emit()

func _on_area_2d_area_entered(area: Area2D) -> void:
	isInteract = true
	print("area entered")


func _on_area_2d_area_exited(area: Area2D) -> void:
	isInteract = false
