extends Node2D

signal hit_key(points)


func _on_Drums_hit_key(points):
	emit_signal("hit_key", points)
