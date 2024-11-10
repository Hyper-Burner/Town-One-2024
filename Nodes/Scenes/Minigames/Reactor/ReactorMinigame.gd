extends TextureRect

var rng = RandomNumberGenerator.new()
var answer

func _ready():
	answer = rng.randi_range(0, 3)

func check_answer(input, answer):
	if input == answer:
		print("correct")
	else:
		get_node("/root/Main/LivesCounter").lose_life()

func _on_circle_pressed() -> void:
	check_answer(0, answer)

func _on_square_pressed() -> void:
	check_answer(1, answer)

func _on_triangle_pressed() -> void:
	check_answer(2, answer)

func _on_diamond_pressed() -> void:
	check_answer(3, answer)
