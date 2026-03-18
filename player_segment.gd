extends Node2D
@onready var anim = $Sprite2D/AnimationPlayer

var direction := Vector2.RIGHT
var target_position: Vector2
var move_speed := 12.0


func set_direction(dir: Vector2):
	direction = dir
	update_animation()
	anim.seek(0)

func update_animation():
	if direction == Vector2.UP:
		anim.play("walk_up")
	elif direction == Vector2.DOWN:
		anim.play("walk_down")
	elif direction == Vector2.LEFT:
		anim.play("walk_left")
	elif direction == Vector2.RIGHT:
		anim.play("walk_right")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position = position.lerp(target_position, move_speed * delta)
