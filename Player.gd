extends CharacterBody2D

var move_speed : float = 100.0
var jump_force : float = 200.0
var gravity : float = 500.0

@onready var score_text : Label = get_node("CanvasLayer/Label")

func _ready():
	score_text.text = str("Score: ", Points.points)

func _physics_process(delta):
	if not is_on_floor():
		velocity.y += gravity * delta
		
	velocity.x = 0
	
	if Input.is_key_pressed(KEY_LEFT):
		velocity.x -= move_speed
	if Input.is_key_pressed(KEY_RIGHT):
		velocity.x += move_speed
		
	if Input.is_key_pressed(KEY_SPACE) and is_on_floor():
		velocity.y = -jump_force
		
	move_and_slide()
	
	if global_position.y > 100:
		game_over()
	
func game_over():
	Points.points = 0
	get_tree().reload_current_scene()
	
func add_score(amount):
	Points.points += amount
	var score = Points.points
	score_text.text = str("Score: ", score)
	

