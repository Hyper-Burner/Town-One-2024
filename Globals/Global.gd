extends Node

#temporary global life count
@onready var lives_counter_scene = preload("res://Nodes/Scenes/lives_counter.tscn")

var is_dragging = false

var in_minigame = false

var engine_minigame_counter = 0
