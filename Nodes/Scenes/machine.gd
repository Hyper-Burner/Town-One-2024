extends Area2D
class_name Machine

@export var minigame : PackedScene
@export var icon : CompressedTexture2D

@onready var icon_root: Notification = %IconRoot;

func _ready() -> void:
	icon_root.icon.texture = icon;

func get_machine():
	return minigame
