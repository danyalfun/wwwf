extends Area2D

@onready var scale_ = $CollisionShape2D.shape.radius
var x = 1

func _ready():
	$CollisionShape2D.shape.radius = 0

func _process(_delta):
	translate(Vector2(1 * x,0))
	
	await get_tree().create_timer(0.9).timeout
	$CollisionShape2D.shape.radius = scale_
	await get_tree().create_timer(0.1).timeout
	queue_free()
