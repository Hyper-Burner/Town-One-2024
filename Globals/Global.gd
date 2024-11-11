extends Node

#temporary global life count
@onready var lives_counter_scene = preload("res://Nodes/Scenes/lives_counter.tscn")
@onready var camera = get_node("/root/Main/Camera2D")

var is_dragging = false
var in_minigame = false
var engine_minigame_counter = 0
var active_game_machine = null;
var play_nav_tutorial = true;
