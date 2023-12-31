extends Node

var map_node
var drums
var total = 792
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
	
	map_node = get_node("Map1")
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
	
	$TheChain.play()



func endgame():
	final_score = float(score) / total
	Global.user_points = stepify(final_score * 100, 0.01)
	get_tree().change_scene("res://Scenes/LevelWinScene.tscn")

func _on_TheChain_whole_beat(number, exact_msec):
	if (number % 2 == 0 && number < 63):
		var new_enemy = enemy1.instance()
		map_node.get_node("Path").add_child(new_enemy, true)
	elif (number % 2 == 0 && number > 64 && number < 128):
		var new_enemy = enemy1.instance()
		map_node.get_node("Path").add_child(new_enemy, true)
	elif (number % 2 == 1 && number > 129 && number < 155):
		var new_enemy = enemy1.instance()
		map_node.get_node("Path").add_child(new_enemy, true)
	elif (number % 2 == 1 && number > 154 && number < 158):
		var new_enemy = enemy1.instance()
		map_node.get_node("Path").add_child(new_enemy, true)
	elif (number % 2 == 1 && number > 161 && number < 191):
		var new_enemy = enemy1.instance()
		map_node.get_node("Path").add_child(new_enemy, true)
	elif (number % 2 == 1 && number > 209 && number < 224):
		var new_enemy = enemy1.instance()
		map_node.get_node("Path").add_child(new_enemy, true)
	elif (number % 2 == 1 && number > 225 && number < 257):
		var new_enemy = enemy1.instance()
		map_node.get_node("Path").add_child(new_enemy, true)
	elif (number % 2 == 1 && number > 257 && number < 321):
		var new_enemy = enemy1.instance()
		map_node.get_node("Path").add_child(new_enemy, true)
	elif (number % 2 == 0 && number > 322 && number < 346):
		var new_enemy = enemy1.instance()
		map_node.get_node("Path").add_child(new_enemy, true)
	elif (number % 2 == 0 && number > 347 && number < 352):
		var new_enemy = enemy1.instance()
		map_node.get_node("Path").add_child(new_enemy, true)
	elif (number % 2 == 0 && number > 355 && number < 384):
		var new_enemy = enemy1.instance()
		map_node.get_node("Path").add_child(new_enemy, true)
	elif (number % 2 == 0 && number > 388 && number < 414):
		var new_enemy = enemy1.instance()
		map_node.get_node("Path").add_child(new_enemy, true)



func _on_TheChain_third_beat(number, exact_msec):
	if (number > 457 && number < 460):
		var new_enemy = enemy1.instance()
		map_node.get_node("Path").add_child(new_enemy, true)
	elif (number > 474 && number < 487):
		var new_enemy = enemy1.instance()
		map_node.get_node("Path").add_child(new_enemy, true)
	elif (number > 570 && number < 583):
		var new_enemy = enemy1.instance()
		map_node.get_node("Path").add_child(new_enemy, true)
	elif(number > 1035 && number < 1039):
		var new_enemy = enemy1.instance()
		map_node.get_node("Path").add_child(new_enemy, true)
	elif (number > 1053 && number < 1067):
		var new_enemy = enemy1.instance()
		map_node.get_node("Path").add_child(new_enemy, true)
	elif (number > 1148 && number < 1163):
		var new_enemy = enemy1.instance()
		map_node.get_node("Path").add_child(new_enemy, true)
	elif (number > 1238 && number < 1260):
		var new_enemy = enemy1.instance()
		map_node.get_node("Path").add_child(new_enemy, true)
	elif (number == 1441):
		$TheChain.stop()
		endgame()


func _on_TheChain_half_beat(number, exact_msec):
	if (number == 256 || number == 257):
		var new_enemy = enemy1.instance()
		map_node.get_node("Path").add_child(new_enemy, true)
	elif (number == 642 || number == 643 || number == 644):
		var new_enemy = enemy1.instance()
		map_node.get_node("Path").add_child(new_enemy, true)


func _on_Map1_hit_key(points):
	score += points


func _on_House_dead():
	$TheChain.stop()
	get_tree().change_scene("res://Scenes/GameOverScene.tscn")
