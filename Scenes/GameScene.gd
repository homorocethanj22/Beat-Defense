extends Node

var map_node
var drums
var last_msec = 0

## Enemies/Monsters
var enemy1 = preload("res://Monster/Monster.tscn")
var enemy2 = preload("res://Monster/Monster2.tscn")
var enemy3 = preload("res://Monster/Monster3.tscn")
var enemy4 = preload("res://Monster/Monster4.tscn")

## Spawning Data: ["Monster#", seconds]
var wave_data = [["Monster", 1], ["Monster2", 1], ["Monster3", 1], ["Monster4", 1]]
	#["Monster1", 1], ["Monster1", 1], ["Monster2", 0.8], ["Monster2", 1], ["Monster2", 1], 
	#["Monster2", 1], ["Monster2", 1], ["Monster2", 1], ["Monster2", 1], ["Monster2", 0.5], 
	#["Monster3", 0.5], ["Monster3", 0.5], ["Monster3", 0.5], ["Monster3", 0.5], ["Monster3", 0.5], 
	#["Monster3", 0.5], ["Monster3", 0.5], ["Monster4", 0.5], ["Monster4", 0.5], ["Monster4", 0.5], 
	#["Monster4", 0.4], ["Monster4", 0.4], ["Monster4", 0.5]]

var current_wave = 0
var enemies_in_wave = 0

onready var timer = get_node("SongTimer")
onready var child_timer = get_node("SongTimer/ChildTimer")
onready var song_start = get_node("SongStart")

func _ready():
	#timer.set_wait_time(0.45) # 60/132 bpm = 0.45454545
	#timer.start()
	
	#song_start.set_wait_time(11.6)
	#song_start.start()
	
	#child_timer.set_wait_time(0.45)
	

	map_node = get_node("Map2")
	drums = map_node.get_child(3)
	$BeatKeeper.play();
	
	#start_next_wave()

# Spawning Functions
func start_next_wave():
	yield(get_tree().create_timer(0.2),"timeout") ## padding between waves
	spawn_enemies(wave_data)
	current_wave += 1
	enemies_in_wave = wave_data.size()
	return wave_data

func spawn_enemies(wave_data):
	for i in wave_data:
		if String(i[0]) == "Monster1":
			var new_enemy = enemy1.instance()
			map_node.get_node("TopLeftPath").add_child(new_enemy, true)
			yield(get_tree().create_timer(i[1]), "timeout")
		if String(i[0]) == "Monster2":
			var new_enemy2 = enemy2.instance()
			map_node.get_node("TopRightPath").add_child(new_enemy2, true)
			yield(get_tree().create_timer(i[1]), "timeout")
		if String(i[0]) == "Monster3":
			var new_enemy3 = enemy3.instance()
			map_node.get_node("BottomLeftPath").add_child(new_enemy3, true)
			yield(get_tree().create_timer(i[1]), "timeout")
		if String(i[0]) == "Monster4":
			var new_enemy4 = enemy4.instance()
			map_node.get_node("BottomRightPath").add_child(new_enemy4, true)
			yield(get_tree().create_timer(i[1]), "timeout")




func _on_SongTimer_timeout():
	drums.ready = true
	child_timer.start()
	timer.stop()


func _on_ChildTimer_timeout():
	drums.ready = false
	child_timer.stop()
	timer.start()


func _on_SongStart_timeout():
	$AudioStreamPlayer2D.play()
	song_start.stop()


func _on_BeatKeeper_whole_beat(number, exact_msec):
	var new_enemy = enemy1.instance()
	map_node.get_node("TopLeftPath").add_child(new_enemy, true)
	print(exact_msec - last_msec)
	last_msec = exact_msec
