extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#get_node("lives_counter").connect("game_over")
	visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if get_node("/root/Main/LivesCounter").lives == 0:
		visible = true
	
	
