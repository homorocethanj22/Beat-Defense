extends Node

var map_node
var enemy = preload("res://Monster/Monster.tscn")
var map_file = "res://Sounds/120_bpm_music.mboy"
# Monsters that spawn every 0.5 seconds or 60/120bpm
var wave_data = [["Monster", 0.5], ["Monster", 0.5], ["Monster", 0.5], ["Monster", 0.5],
	["Monster", 0.5], ["Monster", 0.5], ["Monster", 0.5], ["Monster", 0.5]]

var current_wave = 0
var enemies_in_wave = 0

func _ready():
	map_node = get_node("Map1")
	start_next_wave()
	

# Spawning Functions
func start_next_wave():
	yield(get_tree().create_timer(0.2),"timeout") ## padding between waves
	spawn_enemies(wave_data)
	current_wave += 1
	enemies_in_wave = wave_data.size()
	return wave_data

func spawn_enemies(wave_data):
	for i in wave_data:
		var new_enemy = enemy.instance()
		map_node.get_node("Path").add_child(new_enemy, true)
		yield(get_tree().create_timer(i[1]), "timeout")
