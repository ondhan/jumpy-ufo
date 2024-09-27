extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


# resets the game to the initial state
func reset_game():
	get_node("Player").position = Vector2(200, 300)
	# destroy all instances
	# reset score after


# upon player hitting an object pauses the game and shows the game over menu
func game_over():
	get_tree().paused = true
	get_node("GameOverScreen").show()
