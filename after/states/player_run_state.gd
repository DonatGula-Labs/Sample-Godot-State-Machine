class_name PlayerRunState extends State

@export var player: CharacterBody2D
@export var anim: AnimatedSprite2D

# Called when the node enters the scene tree for the first time.
func enter() -> void:
	assert(player, 'player not initialized')
	assert(anim, 'anim not initialized')
	anim.play('run')

# Called every frame. 'delta' is the elapsed time since the previous frame.
func update_physics(delta: float) -> void:
	var axis = Input.get_axis('ui_left', 'ui_right')
	if axis == -1:
		anim.flip_h = true
	else:
		anim.flip_h = false
	if axis != 0:
		player.velocity.x = delta * axis * 10000
	else:
		get_parent().change_state('PlayerIdleState')
