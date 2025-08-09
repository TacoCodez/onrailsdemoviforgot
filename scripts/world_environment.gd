extends WorldEnvironment
@onready var world_environment: WorldEnvironment = $"."
@onready var audio_stream_player_3d_2: AudioStreamPlayer3D = $"../Player/AudioStreamPlayer3D2"

var fog = 0.05
signal fogDeath
var recovery = 1

func _process(delta: float) -> void:
	var areas = $"../Player/Death".get_overlapping_areas()
	world_environment.get_environment().set_fog_density(fog)
	fog += 0.005 * delta * recovery
	if fog < 0.01:
		fog = 0.01
	if fog < 0.07:
		audio_stream_player_3d_2.stop()
	if fog > 0.07:
		if audio_stream_player_3d_2.playing == false:
			audio_stream_player_3d_2.play()
		audio_stream_player_3d_2.set_volume_db(fog - 20)
	if fog > 0.20:
		fogDeath.emit()


func _on_fog_recovery_zone_area_entered(_area: Area3D) -> void:
	recovery = -10


func _on_fog_recovery_zone_area_exited(_area: Area3D) -> void:
	recovery = 1

func get_fog_value() -> float:
	return fog
