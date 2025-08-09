extends Node3D
@onready var station_1: Node3D = $Station1
@onready var tunnel_1: Node3D = $Tunnel1
@onready var textured_station_2: MeshInstance3D = $"Station 2"



var station2
var stations: Array
var tunnles: Array
var z = 3
const station_x = 42.437
const tunnle_x = 42.434
const station2_x = 2.605
const y = -3.09
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for times in 10:
		stations.append(station_1.duplicate()) 
		$Station1.remove_child(stations[times])
		$".".add_child(stations[times])
		stations[times].set_position(Vector3(station_x,y,z))
		z += 232
		
		tunnles.append(tunnel_1.duplicate()) 
		$Station1.remove_child(tunnles[times])
		$".".add_child(tunnles[times])
		tunnles[times].set_position(Vector3(tunnle_x,y,z))
		z += 384.3
		print(z)
