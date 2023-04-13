extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	get_node("VBoxContainer/BackButton").connect("pressed", self, "on_back_pressed")
	
func on_back_pressed():
	get_tree().change_scene("res://Scenes/SceneHandler.tscn")
