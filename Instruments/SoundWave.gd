extends AnimatedSprite


var damage = 1
var textbox_scene = preload("res://Scenes/Textbox.tscn")

var okay = false
var good = false
var perfect = false
var currentEnemy = null #may need to make array -\_(:P)_/-

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
	

func key_stroke():
	if (currentEnemy != null):
		print("hello")
		if (perfect):
			currentEnemy.get_parent().hit(damage * 3)
			print("perfect")
		elif (good):
			currentEnemy.get_parent().hit(damage * 2)
			print("good")
		elif (okay):
			currentEnemy.get_parent().hit(damage)
			print("okay")
		else:
			pass #play record scratch
	else:
		pass #play record scratch

func _on_OkayArea_body_entered(body):
	if ("Monster" in body.get_parent().name):
		okay = true
		currentEnemy = body
		print(currentEnemy.get_parent().name)


func _on_OkayArea_body_exited(body):
	if ("Monster" in body.get_parent().name):
		okay = false
		currentEnemy = null


func _on_GoodArea_body_entered(body):
	if ("Monster" in body.get_parent().name):
		good = true


func _on_GoodArea_body_exited(body):
	if ("Monster" in body.get_parent().name):
		good = false


func _on_PerfectArea_body_entered(body):
	if ("Monster" in body.get_parent().name):
		perfect = true


func _on_PerfectArea_body_exited(body):
	if ("Monster" in body.get_parent().name):
		perfect = false
