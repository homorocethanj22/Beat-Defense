extends Control

# Called when the node enters the scene tree for the first time.
func _ready():
	get_node("MarginContainer/HBoxContainer/Level1").connect("pressed", self, "on_level_one_pressed")
	get_node("MarginContainer/HBoxContainer/Level2").connect("pressed", self, "on_level_two_pressed")
	get_node("MarginContainer/HBoxContainer/Level3").connect("pressed", self, "on_level_three_pressed")
	get_node("MarginContainer/HBoxContainer/Level4").connect("pressed", self, "on_level_four_pressed")
	get_node("VBoxContainer/BackButton").connect("pressed", self, "on_back_pressed")
	

func on_level_one_pressed():
	get_tree().change_scene("res://Scenes/GameScene.tscn")
	
func on_level_two_pressed():
	get_tree().change_scene("res://Scenes/GameScene2.tscn")
	
func on_level_three_pressed():
	get_tree().change_scene("res://Scenes/GameScene3.tscn")
	
func on_level_four_pressed():
	get_tree().change_scene("res://Scenes/GameScene4.tscn")
	
func on_back_pressed():
	get_tree().change_scene("res://Scenes/SceneHandler.tscn")
