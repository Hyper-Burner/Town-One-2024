extends Node

signal life_lost

var lives = 3

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func lose_life():
	lives -= 1
	if (lives <= 0):
		#game over
		lives = 0
