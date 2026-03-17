extends Node

#game variables
var score : int
var game_started : bool = false

#grid variables
var cells : int = 16
var cell_size : int = 40

var segment_scene = preload("res://player_segment.tscn")
var cat := []
var direction := Vector2.RIGHT

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	start_game()
	
	var timer = Timer.new()
	timer.wait_time = 0.4
	timer.timeout.connect(move_cat)
	timer.autostart = true
	add_child(timer)
	
func start_game():
	cat.clear()
	
	var start_pos = Vector2(2.5,2)
	
	for i in range(1):
		var segment = segment_scene.instantiate()
		add_child(segment)
		
		segment.position = (start_pos - Vector2(i,0)) * cell_size
		segment.set_direction(direction)
		
		cat.append(segment)
func move_cat():
	var new_head_pos = cat[0].position + direction * cell_size
	
	#move it
	for i in range(cat.size() - 1, 0, -1):
		cat[i].position = cat[i - 1].position
		
		var dir = (cat[i - 1].position - cat[i].position).sign()
		cat[i].set_direction(dir)
		
	#move first kitty
	cat[0].position = new_head_pos
	cat[0].set_direction(direction)

func _input(event):
	if event.is_action_pressed("ui_up") and direction != Vector2.DOWN:
		direction = Vector2.UP
	elif event.is_action_pressed("ui_down") and direction != Vector2.UP:
		direction = Vector2.DOWN
	elif event.is_action_pressed("ui_left") and direction != Vector2.RIGHT:
		direction = Vector2.LEFT
	elif event.is_action_pressed("ui_right") and direction != Vector2.LEFT:
		direction = Vector2.RIGHT

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
