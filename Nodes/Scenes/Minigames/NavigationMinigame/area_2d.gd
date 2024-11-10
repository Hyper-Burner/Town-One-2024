extends Area2D
@export var areaID: int
var is_inside_droppable = false
var draggable = false
var body_ref

signal correct_place
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if draggable:
		if Input.is_action_just_pressed("click"):
			Global.is_dragging = true
		if Input.is_action_pressed("click"):
			get_child(1).global_position = get_global_mouse_position()
			get_child(0).global_position = get_global_mouse_position()
		elif Input.is_action_just_released("click"):
			Global.is_dragging = false
			if is_inside_droppable:
				correct_place.emit()
				get_child(1).free()
				get_child(0).global_position = Vector2(-2000,-2000)


func _on_mouse_entered() -> void:
	if not Global.is_dragging:
		draggable = true


func _on_mouse_exited() -> void:
	if not Global.is_dragging:
		draggable = false
		


func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group('Droppable'):
		if area.get_child(1).pieceID == areaID:
			is_inside_droppable = true
			body_ref = area.get_child(0)

func _on_area_exited(area: Area2D) -> void:
	if area.is_in_group('Droppable'):
		if area.get_child(1).pieceID == areaID:
			is_inside_droppable = false
