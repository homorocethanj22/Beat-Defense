extends Node

var map_node
var drums
var last_msec = 0

## Enemies/Monsters
var enemy1 = preload("res://Monster/Monster.tscn")
var enemy2 = preload("res://Monster/Monster2.tscn")
var enemy3 = preload("res://Monster/Monster3.tscn")
var enemy4 = preload("res://Monster/Monster4.tscn")

func _ready():
	map_node = get_node("Map2")
	drums = map_node.get_child(3)
	$BeatKeeper.play();


func _on_BeatKeeper_whole_beat(number, exact_msec):
	var new_enemy = enemy1.instance()
	var e = enemy2.instance()
	if number % 2 != 0 :
		map_node.get_node("TopLeftPath").add_child(new_enemy, true) # drums
	print(number)
	last_msec = exact_msec

func _on_BeatKeeper_half_beat(number, exact_msec):
	var e = enemy1.instance()
	if number % 2 != 0 && number > 9:
		map_node.get_node("BottomRightPath").add_child(e, true) # cymbals
	if number > 200 && number < 344 && number % 3 == 0:
			map_node.get_node("BottomRightPath").add_child(e, true) # cymbals
