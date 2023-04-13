extends Area2D


var damage = 100
var textbox_scene = preload("res://Scenes/Textbox.tscn")

func free():
	queue_free()

	




func _on_SoundWave_body_entered(body):
	body.get_parent().hit(damage)
	
	var textbox = textbox_scene.instance()
	textbox.position = body.get_global_position() + Vector2(0, 10)
	print(textbox.position)
	body.get_parent().add_child(textbox)
	
	textbox.set_text("TEMP")
	
	textbox.visible = true
	

