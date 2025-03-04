class_name PlayerIdleState extends State

@export var player: CharacterBody2D
@export var anim: AnimatedSprite2D

# Called when the node enters the scene tree for the first time.
func enter() -> void:
	assert(player, 'player not initialized')
	assert(anim, 'anim not initialized')
	anim.play('idle')

# Called every frame. 'delta' is the elapsed time since the previous frame.
func update_physics(delta: float) -> void:
	if Input.get_axis('ui_left', 'ui_right') != 0:
		get_parent().change_state('PlayerRunState')
