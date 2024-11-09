extends Control
class_name UI

@onready var icon: TextureRect = %Icon
@onready var player: CharacterBody2D = %Player
@onready var machine: Node2D = %Reactor
var alert_enabled = true;

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	icon.visible = alert_enabled;


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	self.global_position = lerp(
		machine.global_position,
		 player.global_position,
		 0.5);
