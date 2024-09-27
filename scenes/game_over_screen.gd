extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


# hides the menu and unpauses the game
func _on_retry_button_pressed() -> void:
	hide()
	get_tree().paused = false
	get_parent().reset_game()

# quit the game after pressing the exit button 
func _on_exit_button_pressed() -> void:
	get_tree().quit()
