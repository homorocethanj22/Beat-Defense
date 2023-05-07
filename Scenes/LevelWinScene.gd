extends Control

var click_sound

onready var score = get_node("Score")
# Called when the node enters the scene tree for the first time.
func _ready():
	score.text = score.text % Global.user_points
	
	get_node("VBoxContainer/LevelSelect").connect("pressed", self, "on_level_select_pressed")
	get_node("VBoxContainer/Quit").connect("pressed", self, "on_quit_pressed")
	
	# Load sound into AudioStreamPlayer node
	click_sound = AudioStreamPlayer.new()
	add_child(click_sound)
	var click_sound_file = preload("res://Sounds/click2.wav")
	click_sound.stream = click_sound_file

func on_level_select_pressed():
	click_sound.play()
	yield(click_sound, "finished")
	get_tree().change_scene("res://Scenes/LevelSelect.tscn")

func on_quit_pressed():
	get_tree().quit()
