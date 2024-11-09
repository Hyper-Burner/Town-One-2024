extends Node
# Frame rate data
const TARGET_FRAME_RATE: int = 60;
const FRAME_TIME_MS: float = 1000.0 / TARGET_FRAME_RATE;

#temporary global life coun
@onready var lives_counter_scene = preload("res://Nodes/Scenes/lives_counter.tscn")

func _ready() -> void:
	pass
# 
