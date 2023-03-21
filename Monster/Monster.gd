extends PathFollow2D


var speed = 300
var health = 100

func _physics_process(delta):
	offset += speed * delta
	$KinematicBody2D/AnimatedSprite.play("walk")
	if offset >= 3800:
		queue_free() ## suppose to mean reached end of path
	
func hit(damage):
	health = health - damage
	$KinematicBody2D/AnimatedSprite.play("Damage Walk")
	if (health <= 0):
		queue_free()



