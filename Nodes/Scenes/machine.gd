extends Area2D
class_name Machine

@export var minigame : PackedScene
@export var icon : CompressedTexture2D

@onready var icon_root: Notification = %IconRoot;

signal IsDamaged;
signal Repaired;

var damaged: bool = false;

func _ready() -> void:
	icon_root.icon.texture = icon;

func get_machine():
	return minigame

func _on_is_damaged() -> void:
	icon_root.visible = true;

func _on_repaired() -> void:
	icon_root.visible = false;
