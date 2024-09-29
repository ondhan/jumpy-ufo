extends CharacterBody2D


const SPEED = 300.0 # left/right movement speed
const JUMP_VELOCITY = -400.0 # jump strength


func _physics_process(delta: float) -> void:
	# Add the gravity.
	velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump"):
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	var direction := Input.get_axis("move_left", "move_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
	
	if get_slide_collision_count() != 0:
		print("collision")
		get_parent().game_over()
