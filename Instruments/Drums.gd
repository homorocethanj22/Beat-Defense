extends Node2D


var ready = true
const soundWavePath = preload("res://Instruments/SoundWave.tscn")


func _unhandled_key_input(event):
	if event.is_action_pressed("play_drum") and ready == true:
		play_drums()


func play_drums():
	ready = false

	$Drums.play("beat")

	var sound_wave = soundWavePath.instance()
	add_child(sound_wave)
	sound_wave.position = $Drums/SoundWaveOrigin.position

	yield(get_tree().create_timer(0.1), "timeout")

	sound_wave.free()

	$Drums.frame = 0

	ready = true




