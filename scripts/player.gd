extends CharacterBody2D


const SPEED = 150.0
const JUMP_VELOCITY = 400.0

@onready var anim = $AnimatedSprite2D

var knockback_strength = 15
var bombing = false
var knockback = 0
@export var bomb_: PackedScene

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	
	
	#if Input.is_action_just_pressed("Crouch") and is_on_floor():
		#position.y -= 1
		#anim.play("Crouch")
		#
		#crch = true
	
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED
		anim.play("Run")
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		anim.play("IDLE2")
	
	if !self.is_on_floor() and velocity.y >= 0:
		anim.play("Fall")
	
	if Input.is_action_just_pressed("bomb"):
		bomb()
		
	
	if velocity.x > 0:
		anim.flip_h = false
	elif velocity.x != 0:
		anim.flip_h = true
	
	if knockback != 0:
		velocity.x += knockback *100
		knockback = 0
	move_and_slide()


func bomb():
	if bombing: return
	bombing = true
	
	#do
	var new = bomb_.instantiate()
	if anim.flip_h == false: new.x = 1
	else: new.x = -1
	add_child(new)
	await get_tree().create_timer(0.5).timeout
	set_process_input(false)
	
	knockback = knockback_strength * -new.x
	
	await get_tree().create_timer(0.1).timeout
	bombing = false
	
