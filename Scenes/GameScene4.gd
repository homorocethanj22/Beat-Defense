extends Node

var map_node
var drums

var total = 1161
var final_score = 0
var score = 0



## Enemies/Monsters
var enemy1 = preload("res://Monster/Monster.tscn")
var enemy2 = preload("res://Monster/Monster2.tscn")
var enemy3 = preload("res://Monster/Monster3.tscn")
var enemy4 = preload("res://Monster/Monster4.tscn")

var textbox_scene = preload("res://Scenes/Textbox.tscn")
var textbox = null

func _ready():
	
	get_node("House").connect("dead", self, "endgame")
	
	map_node = get_node("Map4")
	drums = map_node.get_child(3)
	
	textbox = textbox_scene.instance()
	textbox.position = Vector2(485, 220)
	textbox.set_scale(Vector2(3, 3))
	add_child(textbox)
	
	textbox.set_text("3")
	textbox.visible = true
	yield(get_tree().create_timer(1), "timeout")
	textbox.visible = false
	
	textbox.set_text("2")
	textbox.visible = true
	yield(get_tree().create_timer(1), "timeout")
	textbox.visible = false
	
	textbox.set_text("1")
	textbox.visible = true
	yield(get_tree().create_timer(1), "timeout")
	textbox.visible = false
	
	$BillieJean.play();

func endgame():
	final_score = float(score) / total
	print(stepify(final_score * 100, 0.01))
	yield(get_tree().create_timer(5), "timeout")
	get_tree().change_scene("res://Scenes/MainMenu.tscn")

func _on_BeatKeeper_whole_beat(number, exact_msec):
	if (number < 255):
		var new_enemy = enemy1.instance()
		total += 1
		map_node.get_node("TopLeftPath").add_child(new_enemy, true)
	if (number == 261):
		endgame()
		$BillieJean.stop()


func _on_BeatKeeper_half_beat(number, exact_msec):
	if (number % 4 == 0 && number > 79 && number < 272):
		var new_enemy = enemy3.instance()
		total += 1
		map_node.get_node("BottomRightPath").add_child(new_enemy, true)
	elif (number % 4 == 0 && number > 335 && number < 368):
		var new_enemy = enemy3.instance()
		total += 1
		map_node.get_node("BottomRightPath").add_child(new_enemy, true)
	elif (number % 4 == 0 && number > 383 && number < 397):
		var new_enemy = enemy3.instance()
		total += 1
		map_node.get_node("BottomRightPath").add_child(new_enemy, true)
	elif (number % 4 == 0 && number > 415 && number < 510):
		var new_enemy = enemy3.instance()
		total += 1
		map_node.get_node("BottomRightPath").add_child(new_enemy, true)





func _on_BillieJean_third_beat(number, exact_msec):
	if (number % 3 != 2 && number > 550 && number < 578):
		var new_enemy = enemy2.instance()
		total += 1
		map_node.get_node("BottomLeftPath").add_child(new_enemy, true)
	elif(number % 3 != 2 && number > 599 && number < 627):
		var new_enemy = enemy2.instance()
		total += 1
		map_node.get_node("BottomLeftPath").add_child(new_enemy, true)
	elif (number == 406 || number == 430 || number == 454 || number == 478 || number == 484 || number == 490 || number == 496 || number == 502 || number == 504):
		var new_enemy = enemy4.instance()
		total += 1
		map_node.get_node("TopRightPath").add_child(new_enemy, true)
	elif (number > 473 && number < 478):
		var new_enemy = enemy4.instance()
		total += 1
		map_node.get_node("TopRightPath").add_child(new_enemy, true)



func _on_Map4_hit_key(points):
	score += points
