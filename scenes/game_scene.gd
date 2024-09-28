extends Node2D


@onready var timer_1 = $SpawnManager/Obstacle1Timer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#timer_1.wait_time = 3.0 # obstacle 1 timing
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


# spawns instances of obstacle 1
func spawn_obstacle_1():
	var rand = RandomNumberGenerator.new()
	var obstacle_scene = load("res://scenes/obstacle.tscn")
	var obstacle = obstacle_scene.instantiate()
	var x = 1250
	rand.randomize()
	var y = rand.randf_range(800, 450) 
	obstacle.position.x = x
	obstacle.position.y = y
	add_child(obstacle)


# upon player hitting an object pauses the game and shows the game over menu
func game_over():
	get_tree().paused = true
	get_node("GameOverScreen").show()


# resets the game to the initial state
func reset_game():
	get_node("Player").position = Vector2(200, 300)
	for obstacle in get_tree().get_nodes_in_group("obstacles"):
		obstacle.remove_from_group("obstacles")
		obstacle.queue_free()
	# reset score after


# timer spawning obstacle 1
func _on_obstacle_1_timer_timeout() -> void:
	spawn_obstacle_1()
