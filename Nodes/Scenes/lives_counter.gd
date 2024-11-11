extends Node

signal life_lost
signal game_over

@export var lives: int


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	$Label.text = "Lives: "+  str(lives)
	if lives < 0:
		game_over.emit()

func lose_life():
	lives -= 1
	if (lives <= 0):
		game_over.emit()
		lives = 0
