extends Node
@onready var gamenode = preload("res://Nodes/game.tscn")
var gamepackage
func _start() -> void:
	$TitleScreen.visible = true
func _on_timer_timeout() -> void:
	Global.you_win = true
	Global.playing = false
	$Win.visible = true
	gamepackage.free()

func _on_lives_counter_game_over() -> void:
	Global.playing = false
	gamepackage.queue_free()
	$GameOver.visible = true
	


func _on_title_screen_startgame() -> void:
	$TitleScreen.visible = false
	Global.playing = true
	gamepackage = gamenode.instantiate()
	$".".add_child(gamepackage)
	Global.camera = get_node("./game/Camera2D")
	print(gamepackage)
	$Timer.start()
	
