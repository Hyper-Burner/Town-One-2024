extends Control
class_name UI

@onready var icon: TextureRect = %Icon
@onready var player: CharacterBody2D = %Player
@onready var reactor: Node2D = %Reactor
var reactorEnabled = true;

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	icon.visible = reactorEnabled;


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	self.global_position = lerp(
		reactor.global_position,
		 player.global_position,
		 0.5);
