extends Node3D
@onready var player: CharacterBody3D = $"../Player"
@onready var ex: Node3D = $"../Ex"
@onready var ter: Node3D = $"Ter"
@onready var class_360__1_: Node3D = %"Class360 (1)"


var time = 40
var rebounds : int
var direction = -1
@export var type = 0
signal yellow
signal red
signal green

func _ready():

	rebounds = randi_range(2,4)

	if not ex:
		print("❌ ERROR: ex node not found")
	if not ter:
		print("❌ ERROR: terminator node not found")
	if not class_360__1_:
		print("❌ ERROR: Class 360 node not found")
	if not player:
		print("❌ ERROR: player node not found")

func on_train_despawn():
	

	var random = 0
	rebounds = randi_range(2, 4)
	random = randi_range(10, 10)
	time = randi_range(20, 60)

	print("New spawn cycle starting!")
	print("Random number:", random)

	ex.set_position(player.position - Vector3(0, -200000, 0))
	ter.set_position(player.position - Vector3(0, -200000, 0))
	class_360__1_.set_position(player.position - Vector3(0, -200000, 0))

	if random <= 5:
		type = 0
		print("Next train: ACCELERATION")
	elif random > 5 and random < 9:
		type = 1
		print("Next train: TERMINATOR")
	elif random >= 9:
		type = 2
		time = 101
		print("Next train: BULLET")
		
func _process(delta: float) -> void:
	if time > 0 and time < 98:
		time -= 1 * delta
	if time < 0:
		if type == 0:
			yellow.emit()
			print("It's Acceleration Time")
			ex.set_position(Vector3(2.437, -3.406, player.position.z) + Vector3(0, 0, 1000))
			time = 100
		if type == 1:
			print("It's Terminator Time")
			ter.set_position(Vector3(43.82, -2.54, player.position.z) + Vector3(0, 0, 1000))
			time = 99
		if type == 2:
			print("It's Bullet Time")
			class_360__1_.set_position(Vector3(43.82, -2.54, player.positiom.z) + Vector3(0, 0, 1000))
			time = 98
			
	if time == 100:
		ex.set_position(ex.position + Vector3(0,0,-125 * delta))
		if ex.position.z < player.position.z + 400:
			red.emit()
		if ex.position.z < player.position.z - 1000:
			green.emit()
		if ex.position.z < player.position.z - 2000:
			print("thank you and goodnight")
			on_train_despawn()
	if time == 98:
		class_360__1_.set_position(class_360__1_.position + Vector3(0, 0, -125 * delta))
		if class_360__1_.position.z < player.position.z + 400:
			red.emit()
		if class_360__1_.position.z < player.position.z - 1000:
			green.emit()
		if class_360__1_.position.z < player.position.z - 2000:
			print("thank you and goodnight")
			on_train_despawn()
	if time == 99:
		ter.set_position(ter.position + Vector3(0,0,75 * delta * direction))
		if ter.position.z < player.position.z - 1000 and direction == -1:
			direction = 1
			rebounds -= 1
			if rebounds == 0:
				on_train_despawn()
		if ter.position.z > player.position.z + 1000 and direction == 1:
			direction = -1
			if rebounds == 0:
				on_train_despawn()
			rebounds -= 1
