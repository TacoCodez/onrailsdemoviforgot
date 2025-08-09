extends Control

@onready var oxygen_bar = $OxygenBar
@onready var world_env = get_node("/root/YourScene/WorldEnvironment")  # Change this path

func _process(delta):
	if not world_env or not world_env.environment:
		return

	var fog_value = world_env.environment.fog_density

	var oxygen_percent = clamp(1.0 - fog_value, 0.0, 1.0)
	oxygen_bar.value = oxygen_percent * 100.0

	# Optional: Change bar color based on level
	var style = oxygen_bar.get("custom_styles/fg")
	if style:
		if oxygen_percent > 0.5:
			style.bg_color = Color(0, 1, 0)
		elif oxygen_percent > 0.25:
			style.bg_color = Color(1, 1, 0)
		else:
			style.bg_color = Color(1, 0, 0)
