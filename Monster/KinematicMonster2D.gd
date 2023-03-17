extends KinematicBody2D
var health = 100

func hit(damage):
	health = health - damage
	if (health <= 0):
		queue_free()
