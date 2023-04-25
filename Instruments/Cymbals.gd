extends Node2D

signal hit_key(points)

var ready = true

var perfect = false
var good = false
var okay = false

var enemyList = []
var currentEnemy = null
var streak = 0

func combo(perf):
	if (perf):
		streak += 1
		if (streak == 10):
			print("Cymbals Streak")
			$Cymbals.play("combo")
	else:
		if (streak >= 10):
			print("End Cymbals Streak")
		streak = 0


const soundWavePath = preload("res://Instruments/SoundWave.tscn")

var textbox_scene = preload("res://Scenes/Textbox.tscn")

func _unhandled_key_input(event):
	if event.is_action_pressed("play_cymbals") and ready == true:
		play_cymbals()


func play_cymbals():
	ready = false

	var textbox = textbox_scene.instance()
	textbox.position = get_parent().position + Vector2(-70, -60)
	add_child(textbox)

	if (len(enemyList) != 0):
		var enemy = enemyList.pop_at(0)
		perfect = enemy[3]
		good = enemy[2]
		okay = enemy[1]
		if (perfect):
			currentEnemy = enemy[0]
			currentEnemy.hit(3)
			textbox.set_text("PERFECT!")
			textbox.visible = true
			yield(get_tree().create_timer(0.02), "timeout")
			textbox.visible = false
			combo(true)
			emit_signal("hit_key", 3)
		elif (good):
			$Cymbals.play("beat")
			currentEnemy = enemy[0]
			currentEnemy.hit(2)
			textbox.set_text("GOOD!")
			textbox.visible = true
			yield(get_tree().create_timer(0.02), "timeout")
			textbox.visible = false
			combo(false)
			emit_signal("hit_key", 2)
		elif(okay):
			$Cymbals.play("beat")
			currentEnemy = enemy[0]
			currentEnemy.hit(1)
			textbox.set_text("OKAY!")
			textbox.visible = true
			yield(get_tree().create_timer(0.02), "timeout")
			textbox.visible = false
			combo(false)
			emit_signal("hit_key", 1)
	else:
		$Cymbals.play("beat")
		combo(false)
		textbox.set_text("MISSED!")
		textbox.visible = true
		yield(get_tree().create_timer(0.02), "timeout")
		textbox.visible = false
		$RecordScratch.play()

	$Cymbals.frame = 0
	ready = true


func _on_OkayArea_body_entered(body):
	if ("Monster" in body.get_parent().name):
		enemyList.append([body.get_parent(), true, false, false])

func _on_OkayArea_body_exited(body):
	if ("Monster" in body.get_parent().name):
		enemyList.pop_at(0)


func _on_GoodArea_body_entered(body):
	if ("Monster" in body.get_parent().name):
		var index = 0
		while (index < len(enemyList) && enemyList[index][2]):
			index += 1
		if (index < len(enemyList)):
			enemyList[index][2] = true


func _on_GoodArea_body_exited(body):
	if ("Monster" in body.get_parent().name):
		var index = 0
		while (index < len(enemyList) && !enemyList[index][2]):
			index += 1
		if (index < len(enemyList)):
			enemyList[index][2] = false


func _on_PerfectArea_body_entered(body):
	if ("Monster" in body.get_parent().name):
		var index = 0
		while (index < len(enemyList) && enemyList[index][3]):
			index += 1
		if (index < len(enemyList)):
			enemyList[index][3] = true


func _on_PerfectArea_body_exited(body):
	if ("Monster" in body.get_parent().name):
		var index = 0
		while (index < len(enemyList) && !enemyList[index][3]):
			index += 1
		if (index < len(enemyList)):
			enemyList[index][3] = false
