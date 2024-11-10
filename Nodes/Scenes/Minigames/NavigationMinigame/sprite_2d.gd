extends Sprite2D
@export var pieceID: int 

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_area_2d_correct_place() -> void:
	visible = true

func _on_area_2d_2_correct_place() -> void:
	visible = true

func _on_area_2d_3_correct_place() -> void:
	visible = true

func _on_area_2d_4_correct_place() -> void:
	visible = true

func _on_area_2d_5_correct_place() -> void:
	visible = true
