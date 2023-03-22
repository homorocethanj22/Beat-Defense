extends Node2D


var ready = true
var enemy_array = []
const soundWavePath = preload("res://Instruments/SoundWave.tscn")
var playbackPos = 0
var damage = 100
var playback_array = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 14.5, 15, 15.5, 16, 16.4, 16.9, 17.4, 17.9, 18.4, 18.9, 19.4, 19.8, 20.3]
var timeout_array = [0.4, 0.4, 0.4, 0.4, 0.4, 0.4, 0.4, 0.4, 0.4, 0.4, 0.4, 0.4, 0.4, 0.4, 0.4, 0.4, 0.4, 0.4, 0.4, 0.4, 0.4, 0.4, 0.4, 0.4, 0.4, 0.4, 0.4, 0.4]
var note = 0

#onready var play_window = get_node("PlayWindow")


func _ready():
#	play_window.set_wait_time(3)
	pass


func _unhandled_key_input(event):
	if event.is_action_pressed("play_drum") and ready == true:
		play_drums()


func play_drums():
	ready = false
	#play_window.start()

	$Drums.play("beat")


	var sound_wave = soundWavePath.instance()
	add_child(sound_wave)
	sound_wave.position = $Drums/SoundWaveOrigin.position
	#$Drums/AudioStreamPlayer2D.play(playback_array[note])

	yield(get_tree().create_timer(0.2), "timeout")


	#$Drums/AudioStreamPlayer2D.stop()
	sound_wave.free()

	$Drums.frame = 0
	note += 1
	if note > len(playback_array) - 1:
		note = 0
	ready = true




