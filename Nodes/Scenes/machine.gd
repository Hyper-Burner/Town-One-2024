extends Area2D
class_name Machine

@export var minigame : PackedScene;
@export var icon : CompressedTexture2D;
@export var min_occurance: int;
@export var max_occurance: int;
@export var time_to_fail: int;

@onready var icon_root: Notification = %IconRoot;

signal IsDamaged;
signal Repaired;

var time_to_breakdown: float;
var random_generator: RandomNumberGenerator;

var damaged: bool = false;

func _ready() -> void:
	icon_root.icon.texture = icon;
	icon_root.icon.hide();
	random_generator = RandomNumberGenerator.new();
	time_to_breakdown = _get_time_to_break();


func get_machine():
	return minigame

func _on_is_damaged() -> void:
	print("DAMAGED");
	icon_root.icon.show();
	damaged = true;

func _on_repaired() -> void:
	print("REPAIRED");
	icon_root.icon.hide();
	damaged = false;
	_reset_time_to_break();

func _process(delta: float) -> void:
	time_to_breakdown -= delta;
	if(time_to_breakdown <= 0.0):
		if(damaged == false):
			IsDamaged.emit()
			time_to_breakdown = time_to_fail;
		else:
			_reset_time_to_break();

func _get_time_to_break() -> float:
	return random_generator.randf_range(min_occurance, max_occurance);

func _reset_time_to_break():
	time_to_breakdown = _get_time_to_break();
