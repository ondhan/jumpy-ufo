extends Node2D


@onready var is_paused = false


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#if Input.is_action_just_pressed("jump") and is_paused == true:
	#	print("resuming on pause menu through key")
	#	is_paused = false
	#	_on_resume_button_pressed()
	#if Input.is_action_just_pressed("ui_cancel") and is_paused == true:
	#	print("quitting on pause menu through key")
	#	get_tree().quit()
	#else:
	#	is_paused = true
	pass


func _on_resume_button_pressed() -> void:
	print("resuming on pause menu through button")
	hide()
	get_tree().paused = false
	is_paused = false
	

func _on_exit_button_pressed() -> void:
	print("quitting on pause menu through button")
	get_tree().quit()
