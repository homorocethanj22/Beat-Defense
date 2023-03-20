extends PathFollow2D


var speed = 100
var health = 100

func _physics_process(delta):
	offset += speed * delta
	if offset >= 3800:
		queue_free() ## suppose to mean reached end of path

func hit(damage):
	health = health - damage
	if (health <= 0):
		queue_free()
