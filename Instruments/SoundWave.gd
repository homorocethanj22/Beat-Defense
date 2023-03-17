extends Area2D

var damage = 100
func free():
	queue_free()


func _on_SoundWave_body_entered(body):
	body.hit(damage)
	


