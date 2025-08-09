extends Node3D


func _ready() -> void:
	await get_tree().create_timer(5).timeout
	get_tree().change_scene_to_file("res://sceens/Game.tscn")
