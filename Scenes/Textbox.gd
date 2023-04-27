extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func set_text(text: String):
	$Label2.text = text
	
func set_rect_size(width: float, height: float):
	$Label2.rect_size = Vector2(width, height)
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
