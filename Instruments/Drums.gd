extends Node2D


var ready = true
const soundWavePath = preload("res://Instruments/SoundWave.tscn")

func _unhandled_key_input(event):
	if event.is_action_pressed("play_drum") and ready == true:
		play_drums()
	
		

func play_drums():
	ready = false

	var soundWave = soundWavePath.instance()
	add_child(soundWave)
	soundWave.position = $Drums/SoundWaveOrigin.global_position
	#Deal Damage to Enemy on Collision
	#Animation
	yield(get_tree().create_timer(1), "timeout")
	soundWave.free()
	ready = true
	
