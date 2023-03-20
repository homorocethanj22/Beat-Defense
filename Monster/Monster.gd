extends PathFollow2D


var speed = 600

func _physics_process(delta):
	offset += speed * delta
	if offset >= 10000:
		queue_free() ## suppose to mean reached end of path


