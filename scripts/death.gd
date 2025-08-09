extends Area3D
@onready var death: Area3D = $"."
@onready var camera_3: Camera3D = $Camera3

var dead = false
signal killed
signal otherKilled

func _on_kill_area_entered(area: Area3D) -> void:
	if area == $".":
		dead = true
		killed.emit()
		await get_tree().create_timer(2.5).timeout
		get_tree().reload_current_scene()


func _on_st_rail_area_entered(area: Area3D) -> void:
	if area == $".":
		await get_tree().create_timer(0.05).timeout
		if dead == false:
			otherKilled.emit()
