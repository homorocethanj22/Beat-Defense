extends Control

var click_sound
var music

# Called when the node enters the scene tree for the first time.
func _ready():
	get_node("MarginContainer/HBoxContainer/Level1").connect("pressed", self, "on_level_one_pressed")
	get_node("MarginContainer/HBoxContainer/Level2").connect("pressed", self, "on_level_two_pressed")
	get_node("MarginContainer/HBoxContainer/Level3").connect("pressed", self, "on_level_three_pressed")
	get_node("MarginContainer/HBoxContainer/Level4").connect("pressed", self, "on_level_four_pressed")
	get_node("VBoxContainer/BackButton").connect("pressed", self, "on_back_pressed")
	
	# Load sound into AudioStreamPlayer node
	click_sound = AudioStreamPlayer.new()
	add_child(click_sound)
	var click_sound_file = preload("res://Sounds/click2.wav")
	click_sound.stream = click_sound_file

func on_level_one_pressed():
	click_sound.play()
	yield(click_sound, "finished")
	get_tree().change_scene("res://Scenes/GameScene.tscn")
	
func on_level_two_pressed():
	click_sound.play()
	yield(click_sound, "finished")
	get_tree().change_scene("res://Scenes/GameScene2.tscn")
	
func on_level_three_pressed():
	click_sound.play()
	yield(click_sound, "finished")
	get_tree().change_scene("res://Scenes/GameScene3.tscn")
	
func on_level_four_pressed():
	click_sound.play()
	yield(click_sound, "finished")
	get_tree().change_scene("res://Scenes/GameScene4.tscn")
	
func on_back_pressed():
	click_sound.play()
	yield(click_sound, "finished")
	get_tree().change_scene("res://Scenes/SceneHandler.tscn")
