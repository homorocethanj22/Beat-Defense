extends Node

func _ready():
	get_node("MainMenu/MarginContainer/VBoxContainer/LevelSelect").connect("pressed", self, "on_level_select_pressed")
	get_node("MainMenu/MarginContainer/VBoxContainer/Settings").connect("pressed", self, "on_settings_pressed")
	get_node("MainMenu/MarginContainer/VBoxContainer/About").connect("pressed", self, "on_about_pressed")
	get_node("MainMenu/MarginContainer/VBoxContainer/Quit").connect("pressed", self, "on_quit_pressed")
	
func on_level_select_pressed():
	get_tree().change_scene("res://Scenes/LevelSelect.tscn")
	
func on_settings_pressed():
	get_tree().change_scene("res://Scenes/SettingsScene.tscn")
	
func on_about_pressed():
	get_tree().change_scene("res://Scenes/AboutScene.tscn")

func on_quit_pressed():
	get_tree().quit()
