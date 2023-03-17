extends Node2D


var ready = true
const soundWavePath = preload("res://Instruments/SoundWave.tscn")
var playbackPos = 0

func _unhandled_key_input(event):
	if event.is_action_pressed("play_drum") and ready == true:

		play_drums()
	
		

func play_drums():
	ready = false

	var soundWave = soundWavePath.instance()
	add_child(soundWave)
	soundWave.position = $Drums/SoundWaveOrigin.position
	$Drums/AudioStreamPlayer2D.play(playbackPos)
	
	#Deal Damage to Enemy on Collision
	#Animation
	yield(get_tree().create_timer(8), "timeout")
	var last = playbackPos
	playbackPos = $Drums/AudioStreamPlayer2D.get_playback_position()
	if last == playbackPos:
		playbackPos = 0
	$Drums/AudioStreamPlayer2D.stop()
	soundWave.free()
	ready = true
	
