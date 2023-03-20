extends Node

var map_node
var drums
var enemy = preload("res://Monster/Monster.tscn")
var map_file = "res://Sounds/120_bpm_music.mboy"
# Monsters that spawn every 0.5 seconds or 60/120bpm
var wave_data = [["Monster", 2], ["Monster", 2], ["Monster", 2], ["Monster", 2],
	["Monster", 2], ["Monster", 2], ["Monster", 2], ["Monster", 2]]

var current_wave = 0
var enemies_in_wave = 0

onready var timer = get_node("SongTimer")
onready var child_timer = get_node("SongTimer/ChildTimer")


func _ready():
	timer.set_wait_time(2)
	timer.start()
	
	child_timer.set_wait_time(2)
	

	map_node = get_node("Map1")
	drums = map_node.get_child(3)
	
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


func _on_SongTimer_timeout():
	drums.ready = true
	child_timer.start()
	timer.stop()


func _on_ChildTimer_timeout():
	drums.ready = false
	child_timer.stop()
	timer.start()
