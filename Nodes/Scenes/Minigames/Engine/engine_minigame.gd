extends Node2D

@onready var machine: Machine = get_node("/root/Global").active_game_machine

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if(Global.engine_minigame_counter == 5):
		machine.Repaired.emit();
