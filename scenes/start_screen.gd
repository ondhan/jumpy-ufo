extends Node2D


@onready var has_started = false


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	get_tree().paused = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("jump") and has_started == false:
		has_started = true
		get_tree().paused = false
		hide()
