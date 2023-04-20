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
	map_node = get_node("Map3")
	drums = map_node.get_child(3)
	$BeatKeeper.play();


func _on_BeatKeeper_whole_beat(number, exact_msec):
	var e = enemy1.instance()
	if number % 2 != 0 && number > 11:
		if number != 43:
			map_node.get_node("TopLeftPath").add_child(e, true) # drums
	print(number) # 170 is about 2 minutes // Stop here


func _on_BeatKeeper_quarter_beat(number, exact_msec):
	var e = enemy1.instance()
	if number % 2 == 0 && number > 174 && number < 336:
		map_node.get_node("TopLeftPath").add_child(e, true) # drums
	if number % 2 == 0 && number > 464 && number < 520:
		map_node.get_node("TopLeftPath").add_child(e, true) # drums


func _on_BeatKeeper_half_beat(number, exact_msec):
	var e = enemy2.instance()
	var e3 = enemy3.instance()
	if number % 2 == 0 && number > 22:
		if number != 84:
			map_node.get_node("BottomLeftPath").add_child(e, true) # guitar
	if number % 2 != 0 && number > 22:
		if number != 84:
			map_node.get_node("TopRightPath").add_child(e3, true) # keyboard
