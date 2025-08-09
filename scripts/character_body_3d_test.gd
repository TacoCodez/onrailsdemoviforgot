extends CharacterBody3D

@onready var camera_3: Camera3D = $Camera3
@onready var player: CharacterBody3D = $"."
@onready var audio_stream_player_3d: AudioStreamPlayer3D = $AudioStreamPlayer3D
@onready var collision_shape_3d: CollisionShape3D = $CollisionShape3D

var flip = 3
var cameraRotationX
var mouse_sensitivity := 0.005
var camera_input := Vector3(0,0,0)
var items: Array
var dead := false

func _ready() -> void:
	$"Camera3/You dead lol".set_visible(false)
	print(dead)
	$"Camera3/You dead lol".set_self_modulate(Color(0,0,0,0))
	audio_stream_player_3d.play()
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED



func _process(_delta: float) -> void:
	if dead == false:
		var input := Vector3.ZERO
		input.z = Input.get_axis("W", "S")
		input.x = Input.get_axis("A","D")
		var basiss = $".".basis
		
		
		if Input.is_action_just_pressed("ui_cancel"):
			Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
		await get_tree().process_frame
		velocity = (basiss * input * 6.0)
		if is_on_floor() == false:
			velocity.y -= 25
		audio_stream_player_3d.pitch_scale = randf_range(0.5, 1.5)
		if player.velocity == Vector3(0,0,0) and audio_stream_player_3d.playing == false:
			audio_stream_player_3d.stop()
		elif audio_stream_player_3d.playing == false:
			audio_stream_player_3d.play()
		move_and_slide()

func _input(event: InputEvent) -> void:
	if dead == false:
		if event is InputEventMouseMotion:
			if Input.mouse_mode == Input.MOUSE_MODE_CAPTURED:
				camera_input.x = - event.relative.x * mouse_sensitivity
				camera_input.y = - event.relative.y * mouse_sensitivity
				camera_3.rotate_x(camera_input.y)
				$".".rotate_y(camera_input.x)
				camera_3.rotation.x = clamp(camera_3.rotation.x, deg_to_rad(-70), deg_to_rad(60))
		if event is InputEventMouseButton:
			if Input.mouse_mode == Input.MOUSE_MODE_VISIBLE:
				Input.mouse_mode = Input.MOUSE_MODE_CAPTURED


func _on_death_killed() -> void:
	dead = true
	player.set_rotation_degrees(Vector3(90,10,10))
	player.set_position(player.position - (Vector3(0,0,20)))
	


func _on_death_other_killed() -> void:
	dead = true
	$Eletric.play()
	for cameraRotation in 20:
		await get_tree().process_frame
		camera_3.set_rotation_degrees(Vector3(camera_3.rotation_degrees.x + flip,camera_3.rotation_degrees.y,camera_3.rotation_degrees.z))
		await get_tree().process_frame
		camera_3.set_rotation_degrees(Vector3(camera_3.rotation_degrees.x + flip,camera_3.rotation_degrees.y,camera_3.rotation_degrees.z))
		flip *= -1
	$Eletric.stop()
	die()

func die():
	var a = 0
	await get_tree().create_timer(0.1).timeout
	$"Camera3/You dead lol".set_visible(true)
	for camerayn in 5:
		if get_tree():
			await get_tree().process_frame
		camera_3.position.y -= 0.6
		a += 0.2
		print(a)
		$"Camera3/You dead lol".set_self_modulate(Color(0,0,0,a))
	a += 0.2
	if get_tree():
		get_tree().reload_current_scene()
	else:
		print("get_tree() is null?! Cannot reload scene.")


func _on_world_environment_fog_death() -> void:
	die()
