extends CharacterBody2D


var SPEED = 300.0


func _physics_process(delta: float) -> void:

	velocity.x = -SPEED


	move_and_slide()

# despawns instance once it reaches a certain coordinates
	if position.x < -100:
		queue_free()
