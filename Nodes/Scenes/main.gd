extends Node

@onready var ui = %UI
var timer = 0
var spawn_chance = 0.2
var inactive_minigames = []

var SPAWN_FREQUENCY = 2
var SPAWN_CHANCE_DELTA = 0.05


func _ready() -> void:
	#uncomment to start timer
	$Timer.start()
	#add all minigames to inactive array
	#inactive_minigames.append(null)

func _process(delta: float) -> void:
	pass
	


func _on_timer_timeout() -> void:
	timer += 1
	print(timer)
	#increase the spawn chance
	#if timer % SPAWN_FREQUENCY * 3 == 0:
		#spawn_chance += SPAWN_CHANCE_DELTA
		
	#roll for a spawn
	#if timer % SPAWN_FREQUENCY == 0:
		##var random_roll = RandomNumberGenerator.new().randf_range(0, 1) 
		##if random_roll < spawn_chance:
			##add_child(Machine.new();
		#print("spawning")
		#
		#var dir = DirAccess.open("res://Nodes/Scenes/Minigames")
		#var names = Array(dir.get_files())
		#
		#var random_file = names.pick_random()
		#print(random_file)
#
		#while (random_file.get_extension() != "tscn"):
			#random_file = names.pick_random()
			#
		#var minigame = load(random_file)
		#add_child(minigame)
		#inactive_minigames.append(minigame)
		#pass
