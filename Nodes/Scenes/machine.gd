extends Area2D
class_name Machine

@export var minigame : PackedScene
@export var icon : CompressedTexture2D

@onready var icon_root: Notification = %IconRoot;

var onScreen: bool = true;

func _ready() -> void:
	icon_root.icon.texture = icon;

func get_machine():
	return minigame

func _process(_delta: float) -> void:
	if onScreen == false:
		icon_root.update_position();

func _on_visible_on_screen_notifier_2d_screen_entered() -> void:
	onScreen = true;
	icon_root.global_position = self.global_position;

func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	onScreen = false;
