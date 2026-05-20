extends CharacterBody2D
class_name Player

## Basic player controller for the MVP
## Supports 4-direction movement with WASD / Arrow keys.

@export var speed: float = 120.0

func _physics_process(delta: float) -> void:
	var input_vector := Vector2.ZERO

	# Using custom input actions (defined in project.godot)
	input_vector.x = Input.get_axis("move_left", "move_right")
	input_vector.y = Input.get_axis("move_up", "move_down")

	if input_vector != Vector2.ZERO:
		input_vector = input_vector.normalized()
		velocity = input_vector * speed
	else:
		velocity = Vector2.ZERO

	move_and_slide()


func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_cancel"):
		get_tree().quit()