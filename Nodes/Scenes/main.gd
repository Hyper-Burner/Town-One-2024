extends Node

func _ready() -> void:
	#uncomment to start timer
	process_mode = Node.PROCESS_MODE_PAUSABLE

func _start() -> void:
	$Timer.start()

func _process(delta: float) -> void:
	pass
