extends Node3D

@onready var sphere: MeshInstance3D = $Sphere
@onready var sphere_001: MeshInstance3D = $Sphere_001
@onready var sphere_002: MeshInstance3D = $Sphere_002
@onready var ssphere: MeshInstance3D = $"../../Textured Station 0/Signal/Sphere"
@onready var ssphere_001: MeshInstance3D = $"../../Textured Station 0/Signal/Sphere_001"
@onready var ssphere_002: MeshInstance3D = $"../../Textured Station 0/Signal/Sphere_002"
@onready var sssphere: MeshInstance3D = $"../../Station1/Signal/Sphere"
@onready var sssphere_001: MeshInstance3D = $"../../Station1/Signal/Sphere_001"
@onready var sssphere_002: MeshInstance3D = $"../../Station1/Signal/Sphere_002"
@onready var ssssphere: MeshInstance3D = $"../../Tunnel1/Signal/Sphere"
@onready var ssssphere_001: MeshInstance3D = $"../../Tunnel1/Signal/Sphere_001"
@onready var ssssphere_002: MeshInstance3D = $"../../Tunnel1/Signal/Sphere_002"

const GREEN = preload("res://resources/Green.tres")
const RED = preload("res://resources/Red.tres")
const YELLOW = preload("res://resources/Yellow.tres")
const GRAY = preload("res://resources/gray.tres")
func _ready() -> void:
	await get_tree().process_frame
	clear()

func clear():
	for num in get_tree().get_node_count_in_group("Signals"):
		get_tree().get_nodes_in_group("Signals")[num].get_child(1).set_material_override(GRAY)
		get_tree().get_nodes_in_group("Signals")[num].get_child(2).set_material_override(GREEN)
		get_tree().get_nodes_in_group("Signals")[num].get_child(3).set_material_override(GRAY)


func _on_ter_green() -> void:
	for num in get_tree().get_node_count_in_group("Signals"):
		get_tree().get_nodes_in_group("Signals")[num].get_child(1).set_material_override(GRAY)
		get_tree().get_nodes_in_group("Signals")[num].get_child(2).set_material_override(GREEN)
		get_tree().get_nodes_in_group("Signals")[num].get_child(3).set_material_override(GRAY)


func _on_ter_red() -> void:
	for num in get_tree().get_node_count_in_group("Signals"):
		get_tree().get_nodes_in_group("Signals")[num].get_child(1).set_material_override(GRAY)
		get_tree().get_nodes_in_group("Signals")[num].get_child(2).set_material_override(GRAY)
		get_tree().get_nodes_in_group("Signals")[num].get_child(3).set_material_override(RED)


func _on_ter_yellow() -> void:
	for num in get_tree().get_node_count_in_group("Signals"):
		get_tree().get_nodes_in_group("Signals")[num].get_child(1).set_material_override(YELLOW)
		get_tree().get_nodes_in_group("Signals")[num].get_child(2).set_material_override(GRAY)
		get_tree().get_nodes_in_group("Signals")[num].get_child(3).set_material_override(GRAY)
