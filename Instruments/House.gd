extends Area2D

onready var h_bar = get_node("HealthBar")
var health = 100
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	h_bar.max_value = health
	h_bar.value = health


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_House_body_entered(body):
	health = health - body.get_parent().get_health()
	body.get_parent().free()
	h_bar.value = health
	print(health)
