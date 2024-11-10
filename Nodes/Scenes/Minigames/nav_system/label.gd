extends Node2D

@onready var machine: Machine = get_node("/root/Global").active_game_machine


var label = Label
var ready_label = Label
var f_ready = Label
var timeout_label = Label

var time = Timer
var ready_time =  Timer

signal ready_over

var is_moving = false

func _ready():
	timeout_label = $Timeout
	label = $Label
	time = $game_time
	ready_time = $ready_time
	ready_label =$get_ready
	f_ready = $flavor_get_ready
	ready_time.start()
	label.set_visible(false)
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
	is_moving = true
	

var healthy = Color(0.2980,0.6863,0.3137)
var healthy_shadow = Color(0.2196, 0.5569,0.2353)
var critical = Color(0.9568,0.2627,0.2117)
var critical_shadow = Color(0.8274,0.1843,0.1843)
var caution = Color(1,0.9216,0.2314)
var caution_shadow = Color(0.9843,0.7529,0.1765)
func update_label_text():
	if time.time_left > 10:
		label.text = str(ceil(time.time_left))
		label.set("theme_override_colors/font_color",healthy)
		label.set("theme_override_colors/font_shadow_color",healthy_shadow)
	elif time.time_left <= 10 and time.time_left > 5:
		label.text = str(snapped(time.time_left, 0.01))
		label.set("theme_override_colors/font_color",caution)
		label.set("theme_override_colors/font_shadow_color",caution_shadow)
	else:
		label.text = str(snapped(time.time_left, 0.01))
		label.set("theme_override_colors/font_color",critical)
		label.set("theme_override_colors/font_shadow_color",critical_shadow)
		
		
func _physics_process(_delta: float) -> void:
	#if is_moving:
		#position.x += 14
	return

func _on_game_time_timeout() -> void:
	is_moving = false
	timeout_label.set_visible(true)
	set_physics_process(false)


func _on_ship_win() -> void:
	is_moving = false
	set_physics_process(false)

func _on_ship_pause() -> void:
	is_moving = false
	set_physics_process(false)


func _on_ship_restart() -> void:
	position.x = 0
	is_moving = true
	set_physics_process(true)
