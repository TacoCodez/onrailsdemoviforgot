extends AudioStreamPlayer2D
@onready var audio_stream_player_2d: AudioStreamPlayer2D = $"../AudioStreamPlayer2D"
@onready var audio_stream_player_2d_2: AudioStreamPlayer2D = $"."

func _process(delta: float) -> void:
	if audio_stream_player_2d.playing == false and audio_stream_player_2d_2.playing == false:
		audio_stream_player_2d_2.play()
