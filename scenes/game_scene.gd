extends Node2D


@onready var timer_1 = $SpawnManager/Obstacle1Timer
@onready var score = 0 # current run score
var highscore = 0 # highest score
var save_file = { # save file data
	"highscore": highscore # highest score
}
var save_path = "user://jumpyufosav.txt" # path to save files
const FILE_NAME = "user://game-data.json"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#timer_1.wait_time = 3.0 # obstacle 1 timing
	load_game()
	$ScoreLabel.text = str("Score: ", score)
	$HighScoreLabel.text = str("Highscore: ", highscore)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_cancel") and get_node("PauseScreen").is_paused == false:
		pause_game()
	else:
		get_node("PauseScreen").is_paused = false
	pass


# spawns instances of obstacle 1
func spawn_obstacle_1():
	var rand = RandomNumberGenerator.new()
	var obstacle_scene = load("res://scenes/obstacle.tscn")
	var obstacle = obstacle_scene.instantiate()
	var x = 1250 # x coordinate is set outside of the screen
	rand.randomize()
	var y = rand.randf_range(800, 450) # y coordinate is randomized 
	obstacle.position.x = x
	obstacle.position.y = y
	add_child(obstacle)


# pauses the game
func pause_game():
	get_tree().paused = true
	get_node("PauseScreen").show()


# upon player hitting an object pauses the game and shows the game over menu
func game_over():
	if score > highscore:
		highscore = score
		$HighScoreLabel.text = str("High score: ", highscore)
		save_game(highscore)
	get_tree().paused = true
	get_node("GameOverScreen").show()
	

# resets the game to the initial state
func reset_game():
	score = 0
	get_node("Player").position = Vector2(200, 300) # resets player position
	for obstacle in get_tree().get_nodes_in_group("obstacles"): # deletes all summoned obstacles
		obstacle.remove_from_group("obstacles")
		obstacle.queue_free()


# timer spawning obstacle 1
func _on_obstacle_1_timer_timeout() -> void:
	spawn_obstacle_1()


# calls game over when player leaves the screen
func _on_world_boundaries_body_entered(body: Node2D) -> void:
	game_over()


# timer increasing the current run score
func _on_score_timer_timeout() -> void:
	score += 1
	$ScoreLabel.text = str("Score: ", score)


# saving the highest score
func save_game(highscore):
	var file = FileAccess.open(save_path,FileAccess.WRITE)
	file.store_var(highscore)


# loading save file
func load_game():
	if FileAccess.file_exists(save_path): # if save file found
		var file = FileAccess.open(save_path, FileAccess.READ)
		highscore = file.get_var()
	else: # if save file not found reset highscore
		highscore = 0
