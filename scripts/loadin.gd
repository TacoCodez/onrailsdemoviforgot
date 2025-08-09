extends Node2D
@onready var label_2: Label = $Label2
@onready var sprite2d: Sprite2D = $"Sprite2D"
@onready var godot: Sprite2D = $Godot
@onready var blender_logo: Sprite2D = $BlenderLogo
@onready var label_4: Label = $Label4
@onready var label_5: Label = $Label5
@onready var label_6: Label = $Label6
@onready var label_7: Label = $Label7
@onready var button: Button = $Button
@onready var button_2: Button = $Button2
@onready var label: Label = $Label
@onready var label_8: Label = $Label8
@onready var label_9: Label = $Label9
@onready var label_10: Label = $Label10
@onready var label_11: Label = $Label11


func _ready() -> void:
	var a = 0
	button.disabled = true
	button_2.disabled = true
	blender_logo.self_modulate.a = 0
	godot.self_modulate.a = 0
	label_2.self_modulate.a = 0
	label_4.self_modulate.a = 0
	label_5.self_modulate.a = 0
	label_6.self_modulate.a = 0
	label_7.self_modulate.a = 0
	button.self_modulate.a = 0
	button_2.self_modulate.a = 0
	label.self_modulate.a = 0
	label_8.self_modulate.a = 0
	label_9.self_modulate.a = 0
	label_10.self_modulate.a = 0
	label_11.self_modulate.a = 0
	for b in 100:
		blender_logo.self_modulate.a = a
		godot.self_modulate.a = a
		label_2.self_modulate.a = a
		a += 0.01
		await get_tree().process_frame
	await get_tree().create_timer(1.5).timeout
	for b in 101:
		blender_logo.self_modulate.a = a
		godot.self_modulate.a = a
		label_2.self_modulate.a = a
		a -= 0.01
		await get_tree().process_frame
	await get_tree().create_timer(0.5).timeout
	for b in 100:
		label_4.self_modulate.a = a
		a += 0.01
		await get_tree().process_frame
	await get_tree().create_timer(4).timeout
	for b in 101:
		label_4.self_modulate.a = a
		a -= 0.01
		await get_tree().process_frame
	for b in 100:
		label_5.self_modulate.a = a
		label_6.self_modulate.a = a
		label_7.self_modulate.a = a
		a += 0.01
		await get_tree().process_frame
	await get_tree().create_timer(3).timeout
	for b in 101:
		label_5.self_modulate.a = a
		label_6.self_modulate.a = a
		label_7.self_modulate.a = a
		a -= 0.01
		await get_tree().process_frame
	for b in 100:
		label_11.self_modulate.a = a
		button.self_modulate.a = a
		label.self_modulate.a = a
		button_2.self_modulate.a = a
		a += 0.01
		await get_tree().process_frame
	button.disabled = false
	button_2.disabled = false


func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://sceens/Game.tscn")


func _on_button_2_pressed() -> void:
	var a = 1
	for b in 101:
		button.disabled = true
		button_2.disabled = true
		label_11.self_modulate.a = a
		button.self_modulate.a = a
		label.self_modulate.a = a
		button_2.self_modulate.a = a
		a -= 0.01
		await get_tree().process_frame
	for b in 100:
		label_8.self_modulate.a = a
		label_9.self_modulate.a = a
		label_10.self_modulate.a = a
		a += 0.01
		await get_tree().process_frame
	await get_tree().create_timer(6).timeout
	for b in 101:
		label_8.self_modulate.a = a
		label_9.self_modulate.a = a
		label_10.self_modulate.a = a
		a -= 0.01
		await get_tree().process_frame
	for b in 100:
		button.disabled = false
		button_2.disabled = false
		label_11.self_modulate.a = a
		button.self_modulate.a = a
		label.self_modulate.a = a
		button_2.self_modulate.a = a
		a += 0.01
		await get_tree().process_frame
	await get_tree().create_timer(3).timeout
