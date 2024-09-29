extends Node2D


@onready var is_over = false


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process( delta: float) -> void:
	#if Input.is_action_just_pressed("jump") and is_over == true:
	#	print("resuming on game over menu through key")
	#	_on_retry_button_pressed()
	#	is_over = false
	#if Input.is_action_just_pressed("ui_cancel") and is_over == true:
	#	print("quitting on game over menu through key")
	#	get_tree().quit()
	#else:
	#	is_over = true
	pass


# hides the menu and unpauses the game
func _on_retry_button_pressed() -> void:
	print("resuming on game over menu through button")
	hide()
	get_tree().paused = false
	get_parent().reset_game()
	is_over = false

# quit the game after pressing the exit button 
func _on_exit_button_pressed() -> void:
	print("qutting on game over menu through button")
	get_tree().quit()
