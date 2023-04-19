extends PathFollow2D


var speed = 300
var health = 3

func _physics_process(delta):
	offset += speed * delta
	$KinematicBody2D/AnimatedSprite.play("walk")


func hit(damage):
	health = health - damage
	$KinematicBody2D/AnimatedSprite.play("Damage Walk")
	if (health <= 0):
		print(offset)
		queue_free()


func free():
	queue_free()
	


func get_health():
	return health



