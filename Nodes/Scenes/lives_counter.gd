extends Node

signal life_lost
signal game_over

@export var lives: int


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	$Label.text = "Lives: "+  str(lives)
	pass

func lose_life():
	lives -= 1
	if (lives <= 0):
		game_over.emit()
		lives = 0


func _on_button_pressed() -> void:
	lose_life()
	pass # Replace with function body.
