extends Node

var map_node
var drums
var last_msec = 0
var pause_bool = false
var pos

var total = 1173
var final_score = 0
var score = 0

## Enemies/Monsters
var enemy1 = preload("res://Monster/Monster.tscn")
var enemy2 = preload("res://Monster/Monster2.tscn")
var enemy3 = preload("res://Monster/Monster3.tscn")
var enemy4 = preload("res://Monster/Monster4.tscn")

func _ready():
	map_node = get_node("Map3")
	drums = map_node.get_child(3)
	$BeatKeeper.play();

func _input(event):
	if event is InputEventKey and event.scancode == KEY_ESCAPE and event.pressed:
		pause()
		
func pause():
	if pause_bool == false:
		pos = $BeatKeeper.get_playback_position()
		$BeatKeeper.stop()
		pause_bool = true
		get_tree().paused = true
	elif pause_bool == true:
		$BeatKeeper.play(pos)
		pause_bool = false
		get_tree().paused = false;

func endgame():
	final_score = float(score) / total
	print(stepify(final_score * 100, 0.01))

func _on_BeatKeeper_whole_beat(number, exact_msec):
	var e = enemy1.instance()
	if number % 2 != 0 && number > 11 && number < 131:
		if number != 43:
			total += 1
			map_node.get_node("TopLeftPath").add_child(e, true) # drums
	if number == 132:
		endgame()
		$BeatKeeper.stop()


func _on_BeatKeeper_quarter_beat(number, exact_msec):
	var e = enemy1.instance()
	if number % 2 == 0 && number > 174 && number < 336:
		total += 1
		map_node.get_node("TopLeftPath").add_child(e, true) # drums
	if number % 2 == 0 && number > 464 && number < 520:
		total += 1
		map_node.get_node("TopLeftPath").add_child(e, true) # drums


func _on_BeatKeeper_half_beat(number, exact_msec):
	var e = enemy2.instance()
	var e3 = enemy3.instance()
	if number % 2 == 0 && number > 22 && number < 250:
		if number != 84:
			total += 1
			map_node.get_node("BottomLeftPath").add_child(e, true) # guitar
	if number % 2 != 0 && number > 22 && number < 250:
		if number != 84:
			total += 1
			map_node.get_node("TopRightPath").add_child(e3, true) # keyboard


func _on_Map3_hit_key(points):
	score += points
