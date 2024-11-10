extends Node

var Reactor = preload("res://Nodes/Scenes/ReactorMinigame.tscn")
#temporary global life coun
@onready var lives_counter_scene = preload("res://Nodes/Scenes/lives_counter.tscn")

var is_dragging = false
