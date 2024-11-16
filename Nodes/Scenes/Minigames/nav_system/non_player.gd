extends Node2D
var speed = 7
@onready var machine: Machine = get_node("/root/Global").active_game_machine
@onready var play_tutorial = get_node("/root/Global").play_nav_tutorial
var starting = false

var label = Label
var time = Timer
var victory_label = Label

var map_hard = Node2D
var map_tut = Node2D
var map_easy = Node2D
var map_med_1 = Node2D
var map_array = []

var rng = RandomNumberGenerator.new()

func _ready():
	label = $"../Node2D/Label/Label"
	time = $"../Node2D/Label/game_time"
	victory_label = $end_portal/Victory
	victory_label.set_visible(false)
	
	map_easy = $MapEasy
	map_hard = $MapHard
	map_tut = $MapTutorial
	map_med_1 = $MapMedium1
	
	map_array = [map_easy,map_hard,map_med_1]
	map_hard.set_process_mode(PROCESS_MODE_DISABLED) 
	map_easy.set_process_mode(PROCESS_MODE_DISABLED) 
	map_tut.set_process_mode(PROCESS_MODE_DISABLED)
	map_med_1.set_process_mode(PROCESS_MODE_DISABLED)
	if play_tutorial == true:
		map_tut.set_process_mode(PROCESS_MODE_INHERIT)
		map_tut.set_visible(true)
		get_node("/root/Global").play_nav_tutorial = false;
	else:
		var map_chooser = rng.randi_range(0,2)
		map_array[map_chooser].set_process_mode(PROCESS_MODE_INHERIT)
		map_array[map_chooser].set_visible(true)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if starting:
		position.x -= speed 

func _on_label_ready_over() -> void:
	starting = true
	set_physics_process(true)

func _on_ship_restart() -> void:
	position.x = 300;
	starting = true

func _on_ship_pause() -> void:
	starting = false

func _on_ship_win() -> void:
	starting = false
	set_physics_process(false)
	time.set_paused(true)
	label.set_visible(false)
	victory_label.set_visible(true)
	machine.Repaired.emit();
