extends Node2D


var ready = true

var perfect = false
var good = false
var okay = false

var currentEnemy = null

const soundWavePath = preload("res://Instruments/SoundWave.tscn")


func _unhandled_key_input(event):
	if event.is_action_pressed("play_keyboard") and ready == true:
		play_keyboard()


func play_keyboard():
	ready = false

	#$Keyboard.play("beat")

	#var sound_wave = soundWavePath.instance()
	#add_child(sound_wave)
	#sound_wave.position = $Keyboard/SoundWaveOrigin.position
	#sound_wave.key_stroke()

	if (currentEnemy != null):
		if (perfect):
			currentEnemy.hit(3)
			print("perfect")
		elif (good):
			currentEnemy.hit(2)
			print("good")
		elif(okay):
			currentEnemy.hit(1)
			print("okay")
	else:
		print("missed...")
		$RecordScratch.play()

	yield(get_tree().create_timer(0.02), "timeout")

	#sound_wave.free()

	#$Keyboard.frame = 0

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
