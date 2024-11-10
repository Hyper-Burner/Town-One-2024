extends CharacterBody2D

@onready var machine: Machine = get_node("/root/Global").active_game_machine

const SPEED = 500

var label = Label
var ready_label = Label
var f_ready = Label
var victory_label = Label
var timeout_label = Label

var time = Timer
var ready_time =  Timer

signal ready_over

func _ready():
	victory_label = $Victory
	timeout_label = $Timeout
	label = $Label
	time = $game_time
	ready_time = $ready_time
	ready_label =$get_ready
	f_ready = $flavor_get_ready
	ready_time.start()
	label.set_visible(false)
	victory_label.set_visible(false)
	timeout_label.set_visible(false)
	set_physics_process(false)
	

func _on_ready_time_timeout() -> void:
	time.start(machine.time_to_breakdown);
	ready_label.set_visible(false)
	f_ready.set_visible(false)
	label.set_visible(true)
	ready_over.emit()
	set_physics_process(true)
	

func _process(_delta:float):
	update_label_text()
	update_ready_text()
	
func update_ready_text():
	ready_label.text = str(ceil(ready_time.time_left))
func update_label_text():
	if time.time_left > 10:
		label.text = str(ceil(time.time_left))
	else:
		label.text = str(snapped(time.time_left, 0.01))
		
func _physics_process(_delta: float) -> void:
	velocity.x = SPEED
	
	move_and_slide()


func _on_ship_pause() -> void:
	velocity.x = 0
	velocity.y = 0
	set_physics_process(false)


func _on_ship_restart() -> void:
	position.x = 0
	position.y = 0
	set_physics_process(true)


func _on_game_time_timeout() -> void:
	velocity.x = 0
	velocity.y = 0
	timeout_label.set_visible(true)
	set_physics_process(false)


func _on_ship_win() -> void:
	velocity.x = 0
	velocity.y = 0
	set_physics_process(false)
	time.set_paused(true)
	label.set_visible(false)
	victory_label.set_visible(true)
	machine.Repaired.emit();
