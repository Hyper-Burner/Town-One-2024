extends Control
class_name Notification
	
@onready var icon: TextureRect = %Icon;
@onready var player: CharacterBody2D = get_node("/root/Main/Player");
@onready var machine: Node = get_parent();
