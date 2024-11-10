extends Area2D
class_name Machine

@export var minigame : PackedScene;
@export var icon : CompressedTexture2D;
@export var min_occurance: int;
@export var max_occurance: int;
@export var time_to_fail: int;

@onready var icon_root: Notification = %IconRoot;
@onready var time_text: Label = %TimeText;

signal IsDamaged;
signal Repaired;

var time_to_breakdown: float;
var random_generator: RandomNumberGenerator;
var damaged: bool = false;

func _ready() -> void:
	icon_root.icon.texture = icon;
	icon_root.icon.hide();
	random_generator = RandomNumberGenerator.new();
	time_to_breakdown = _randomize_time_to_break();


func get_machine():
	return minigame

func _on_is_damaged() -> void:
	print("DAMAGED");
	icon_root.icon.show();
	time_text.show();
	damaged = true;
	time_to_breakdown = time_to_fail;

func _on_repaired() -> void:
	print("REPAIRED");
	icon_root.icon.hide();
	time_text.hide();
	damaged = false;
	_reset_time_to_break();

func _process(delta: float) -> void:
	time_to_breakdown -= delta;
	if(damaged):
		time_text.text = str(int(time_to_breakdown), "\n Press 'E' to repair!");
	if(time_to_breakdown <= 0.0):
		if(damaged == false):
			IsDamaged.emit();
		else:
			get_node("/root/Main/LivesCounter").lose_life();
			Repaired.emit();

func _randomize_time_to_break() -> float:
	return random_generator.randf_range(min_occurance, max_occurance);

func _reset_time_to_break() -> void:
	time_to_breakdown = _randomize_time_to_break();
