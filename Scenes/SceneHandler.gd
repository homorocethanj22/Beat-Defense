extends Node

var click_sound
var music

func _ready():
	get_node("MainMenu/MarginContainer/VBoxContainer/LevelSelect").connect("pressed", self, "on_level_select_pressed")
	get_node("MainMenu/MarginContainer/VBoxContainer/Quit").connect("pressed", self, "on_quit_pressed")

	# Load sound into AudioStreamPlayer node
	click_sound = AudioStreamPlayer.new()
	add_child(click_sound)
	var click_sound_file = preload("res://Sounds/click2.wav")
	click_sound.stream = click_sound_file
	
	music = AudioStreamPlayer.new()
	add_child(music)
	var music_file = preload("res://Sounds/8bit.mp3")
	music.stream = music_file
	music.play()

func on_level_select_pressed():
	click_sound.play()
	yield(click_sound, "finished")
	get_tree().change_scene("res://Scenes/LevelSelect.tscn")

func on_quit_pressed():
	get_tree().quit()
