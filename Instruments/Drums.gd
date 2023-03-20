extends Node2D


var ready = false
var enemy_array = []
const soundWavePath = preload("res://Instruments/SoundWave.tscn")
var playbackPos = 0
var damage = 100

#onready var play_window = get_node("PlayWindow")


func _ready():
#	play_window.set_wait_time(3)
	pass
	
func _unhandled_key_input(event):
	if event.is_action_pressed("play_drum") and ready == true:

		play_drums()
	
		

func play_drums():
	#play_window.start()

	var sound_wave = soundWavePath.instance()
	add_child(sound_wave)
	sound_wave.position = $Drums/SoundWaveOrigin.position
	$Drums/AudioStreamPlayer2D.play(playbackPos)
	var curr_enemy = null
	if !enemy_array.empty():
		curr_enemy = enemy_array.pop_front()
		curr_enemy.hit(damage)
	#Deal Damage to Enemy on Collision
	#Animation
	yield(get_tree().create_timer(0.1), "timeout")
	#var last = playbackPos
	#laybackPos = $Drums/AudioStreamPlayer2D.get_playback_position()
	#if last == playbackPos:
	#	playbackPos = 0
	$Drums/AudioStreamPlayer2D.stop()
	sound_wave.free()



#func _on_PlayWindow_timeout():
#	ready = false
#	#play_window.stop()


func _on_Area2D_body_entered(body):
	enemy_array.append(body.get_parent())

