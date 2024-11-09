extends Control
class_name Notification

@onready var icon: TextureRect = %Icon
@onready var player: CharacterBody2D = get_node("/root/Main/Player");
@onready var machine: Node = get_parent()
var alert_enabled = true;

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	icon.visible = alert_enabled;

func update_position() -> void:
	self.global_position = lerp(
		machine.global_position,
		 player.global_position,
		 0.5);
