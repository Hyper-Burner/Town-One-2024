extends Node

@onready var ui = %UI
var timer = 0
var spawn_chance = 0.2
var inactive_minigames = []

var SPAWN_FREQUENCY = 2
var SPAWN_CHANCE_DELTA = 0.05


func _ready() -> void:
	#uncomment to start timer
	#$Timer.start()
	#add all minigames to inactive array
	inactive_minigames.append("Engine")
	inactive_minigames.append("nav_system")
	inactive_minigames.append("Reactor")

func _process(delta: float) -> void:
	pass
	


func _on_timer_timeout() -> void:
	timer += 1
	print(timer)
	#increase the spawn chance
	if timer % SPAWN_FREQUENCY * 3 == 0:
		spawn_chance += SPAWN_CHANCE_DELTA
		
	#roll for a spawn
	if timer % SPAWN_FREQUENCY == 0:
		var random_roll = RandomNumberGenerator.new().randf_range(0, 1) 
		if random_roll > spawn_chance:
			return
		
		var random_name = inactive_minigames.pick_random()
		var minigame_class = load("res://Nodes/Scenes/Minigames/"+random_name+"/"+random_name+".tscn")
		var minigame = minigame_class.instantiate()
		
		add_child(minigame)
		inactive_minigames.erase(random_name)
