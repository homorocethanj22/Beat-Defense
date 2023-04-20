extends Node

var map_node
var drums
var last_msec = 0
var val = 0
var count = 0

## Enemies/Monsters
var enemy1 = preload("res://Monster/Monster.tscn")
var enemy2 = preload("res://Monster/Monster2.tscn")
var enemy3 = preload("res://Monster/Monster3.tscn")
var enemy4 = preload("res://Monster/Monster4.tscn")

func _ready():
	map_node = get_node("Map4")
	drums = map_node.get_child(3)
	$BillieJean.play();


func _on_BeatKeeper_whole_beat(number, exact_msec):
	var new_enemy = enemy1.instance()
	map_node.get_node("TopLeftPath").add_child(new_enemy, true)


func _on_BeatKeeper_half_beat(number, exact_msec):
	if (number % 4 == 0 && number > 79 && number < 272):
		var new_enemy = enemy1.instance()
		map_node.get_node("BottomRightPath").add_child(new_enemy, true)
	elif (number % 4 == 0 && number > 335 && number < 368):
			var new_enemy = enemy1.instance()
			map_node.get_node("BottomRightPath").add_child(new_enemy, true)
	elif (number % 4 == 0 && number > 383 && number < 397):
		var new_enemy = enemy1.instance()
		map_node.get_node("BottomRightPath").add_child(new_enemy, true)
	elif (number % 4 == 0 && number > 415):
		var new_enemy = enemy1.instance()
		map_node.get_node("BottomRightPath").add_child(new_enemy, true)





func _on_BillieJean_third_beat(number, exact_msec):
	if (number % 3 != 2 && number > 550 && number < 578):
		var new_enemy = enemy1.instance()
		map_node.get_node("BottomLeftPath").add_child(new_enemy, true)
	elif(number % 3 != 2 && number > 599 && number < 627):
		var new_enemy = enemy1.instance()
		map_node.get_node("BottomLeftPath").add_child(new_enemy, true)
	elif (number == 406 || number == 430 || number == 454 || number == 478 || number == 484 || number == 490 || number == 496 || number == 502 || number == 504):
		var new_enemy = enemy1.instance()
		map_node.get_node("TopRightPath").add_child(new_enemy, true)
	elif (number > 473 && number < 478):
		var new_enemy = enemy1.instance()
		map_node.get_node("TopRightPath").add_child(new_enemy, true)
	print(number)
