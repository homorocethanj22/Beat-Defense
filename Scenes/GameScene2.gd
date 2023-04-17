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
	print(number)
	var new_enemy = enemy1.instance()
	map_node.get_node("BottomLeftPath").add_child(new_enemy, true)
