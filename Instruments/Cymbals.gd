extends Node2D


var ready = true

var perfect = false
var good = false
var okay = false

var currentEnemy = null

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

	#$Cymbals.play("beat")

	#var sound_wave = soundWavePath.instance()
	#add_child(sound_wave)
	#sound_wave.position = $Cymbals/SoundWaveOrigin.position
	#sound_wave.key_stroke()
	
	if (currentEnemy != null):
		if (perfect):
			currentEnemy.hit(3)
			textbox.set_text("PERFECT!")
			textbox.visible = true
			yield(get_tree().create_timer(0.02), "timeout")
			textbox.visible = false
			print("perfect")
		elif (good):
			currentEnemy.hit(2)
			textbox.set_text("GOOD!")
			textbox.visible = true
			yield(get_tree().create_timer(0.02), "timeout")
			textbox.visible = false
			print("good")
		elif(okay):
			currentEnemy.hit(1)
			textbox.set_text("OKAY!")
			textbox.visible = true
			yield(get_tree().create_timer(0.02), "timeout")
			textbox.visible = false
			print("okay")
	else:
		print("missed...")
		textbox.set_text("MISSED!")
		textbox.visible = true
		yield(get_tree().create_timer(0.02), "timeout")
		textbox.visible = false
		$RecordScratch.play()



	#sound_wave.free()

	#$Cymbals.frame = 0

	ready = true


func _on_OkayArea_body_entered(body):
	if ("Monster" in body.get_parent().name):
		okay = true
		currentEnemy = body.get_parent()


func _on_OkayArea_body_exited(body):
	if ("Monster" in body.get_parent().name):
		okay = false
		currentEnemy = null


func _on_GoodArea_body_entered(body):
	if ("Monster" in body.get_parent().name):
		good = true


func _on_GoodArea_body_exited(body):
	if ("Monster" in body.get_parent().name):
		good = false


func _on_PerfectArea_body_entered(body):
	if ("Monster" in body.get_parent().name):
		perfect = true


func _on_PerfectArea_body_exited(body):
	if ("Monster" in body.get_parent().name):
		perfect = false
