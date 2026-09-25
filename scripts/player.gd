extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0
var is_jumping = false
var direction = 1

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	if is_on_floor():
		is_jumping = false

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		$animation.play("jump")
		is_jumping = true
		

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	direction = Input.get_axis("left", "right")
	
	if direction < 0:
		$animation.flip_h = true
		if not is_jumping:
			$animation.play("run")
	elif direction > 0:
		$animation.flip_h = false
		if not is_jumping:
			$animation.play("run")
	elif not is_jumping:
		$animation.play("idle")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
