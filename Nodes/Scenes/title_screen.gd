extends Control

signal startgame



func _on_button_pressed() -> void:
	startgame.emit()
