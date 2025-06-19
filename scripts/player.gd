extends CharacterBody2D


const SPEED = 150.0
const JUMP_VELOCITY = 400.0

@onready var anim = $AnimatedSprite2D




func _physics_process(delta):
	var crch = false
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
	
	#if crch and self.is_on_floor():
		#velocity.y += -150
		
	
	if velocity.x > 0:
		anim.flip_h = false
	elif velocity.x != 0: anim.flip_h = true

	move_and_slide()
