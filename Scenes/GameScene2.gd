extends Node

var map_node
var drums

var total = 1425
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
	map_node = get_node("Map2")
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
	
	$BeatKeeper.play()

func endgame():
	final_score = float(score) / total
	print(stepify(final_score * 100, 0.01))

func _on_BeatKeeper_whole_beat(number, exact_msec):
	var new_enemy = enemy1.instance()
	var e = enemy1.instance()
	if number % 2 != 0 && number < 288:
		map_node.get_node("TopLeftPath").add_child(new_enemy, true) # drums
		total += 1
	if number == 295:
		endgame()
		$BeatKeeper.stop()


func _on_BeatKeeper_half_beat(number, exact_msec):
	var e = enemy4.instance()
	if number % 2 != 0 && number > 9 && number < 576:
		map_node.get_node("BottomRightPath").add_child(e, true) # cymbals
		total += 1
	if number > 200 && number < 344 && number % 3 == 0:
			map_node.get_node("BottomRightPath").add_child(e, true) # cymbals
			total += 1


func _on_Map2_hit_key(points):
	score += points
