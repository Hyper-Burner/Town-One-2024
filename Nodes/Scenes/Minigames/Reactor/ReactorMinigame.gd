extends TextureRect

@onready var machine: Machine = get_node("/root/Global").active_game_machine

var rng = RandomNumberGenerator.new()
var answer

func _ready():
	answer = rng.randi_range(0, 3)
	print(answer)
	$CoverTexture.texture.region = Rect2(10, 449, 238, 389)
	if answer == 0:
		$StickyNote.texture.region = Rect2(0, 1127, 142, 123)
	elif answer == 1:
		$StickyNote.texture.region = Rect2(287, 1127, 142, 123)
	elif answer == 2:
		$StickyNote.texture.region = Rect2(144, 1127, 142, 123)
	else:
		$StickyNote.texture.region = Rect2(430, 1127, 142, 123)

func check_answer(input):
	Global.in_minigame = false
	if input == answer:
		machine.Repaired.emit()
		queue_free()
	else:
		get_node("/root/Main/LivesCounter").lose_life()
	queue_free()

func _on_circle_pressed() -> void:
	check_answer(0)

func _on_square_pressed() -> void:
	check_answer(1)

func _on_triangle_pressed() -> void:
	check_answer(2)

func _on_diamond_pressed() -> void:
	check_answer(3)

func _on_cover_button_pressed() -> void:
	print("bruh")
	$CoverTexture.texture.region = Rect2(493, 449, 238, 389)
	$CoverButton.queue_free()
	$StickyNote.queue_free()
