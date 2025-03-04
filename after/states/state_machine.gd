class_name StateMachine extends Node

@export var init_state: State
@export var gravity = 1000
var curr_state: State
var states: Dictionary

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if init_state:
		curr_state = init_state
		curr_state.enter()
	for child in get_children():
		states[child.name] = child

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if curr_state: curr_state.update(delta)

func _physics_process(delta: float) -> void:
	if curr_state: curr_state.update_physics(delta)

func change_state(state_name: Variant) -> void:
	var new_state = states.get(state_name)
	if !new_state && state_name:
		return print(state_name, ' state did not exists')
	if curr_state:
		curr_state.exit()
	if new_state:
		print('entering state: ', new_state.name)
		new_state.enter()
	else:
		print('entering null state for: ', get_parent().name)
	curr_state = new_state
