extends RigidBody2D

@export var max_es = Vector2(2,2)
@export var epf = Vector2(0.1,0.1)
@export var e: Area2D

var x
var now = false

func _ready():
	x = self.position.x
	
	$AnimatedSprite2D.play("default")
	await $AnimatedSprite2D.animation_finished
	now = true
	
	


func _physics_process(delta):
	self.position.x = x
	
	if now:
		if e.scale < max_es:
			e.scale += epf
	
