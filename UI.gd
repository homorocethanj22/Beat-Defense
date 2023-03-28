extends Node

##
## Game Control Functions
##
func _on_PausePlay_pressed():
	if get_tree().is_paused():
		get_tree().paused = false
	else:
		get_tree().paused = true
