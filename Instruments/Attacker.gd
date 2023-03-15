extends KinematicBody2D


var velocity = Vector2(1, 0)
var speed = 100
var health = 100


func _physics_process(delta):
	move_and_slide(velocity * speed, Vector2(0, 0))

func hit(damage):
	health = health - damage
	if (health <= 0):
		queue_free()


