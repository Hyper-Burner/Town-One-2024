extends Node2D
const SPEED = 5
@onready var machine: Machine = get_node("/root/Global").active_game_machine
var starting = false

var label = Label
var time = Timer
var victory_label = Label
var map_hard = Node2D

func _ready():
	label = $"../Node2D/Label/Label"
	time = $"../Node2D/Label/game_time"
	victory_label = $end_portal/Victory
	victory_label.set_visible(false)
	
	map_hard = $MapHard

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if starting:
		position.x -= SPEED 

func _on_label_ready_over() -> void:
	starting = true
	set_physics_process(true)

func _on_ship_restart() -> void:
	position.x = 0;
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
