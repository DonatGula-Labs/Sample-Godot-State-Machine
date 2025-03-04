extends CharacterBody2D


var gravity = 500

func _physics_process(delta: float) -> void:
	if !is_on_floor():
		velocity.y += delta * gravity
	move_and_slide()
