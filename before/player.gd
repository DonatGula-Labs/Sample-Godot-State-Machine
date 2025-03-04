extends CharacterBody2D


var gravity = 500

func _physics_process(delta: float) -> void:
	var axis = Input.get_axis('ui_left', 'ui_right')
	if axis == -1:
		$AnimatedSprite2D.flip_h = true
	else:
		$AnimatedSprite2D.flip_h = false
	if axis != 0:
		$AnimatedSprite2D.play('run')
		velocity.x = delta * axis * 10000
	else:
		$AnimatedSprite2D.play('idle')
		velocity.x = 0
	if !is_on_floor():
		velocity.y += delta * gravity
	move_and_slide()
