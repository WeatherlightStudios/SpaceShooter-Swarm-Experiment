extends Node2D

export var speed = 50
export var gravity = 1
export var sensitivity = 1

var inputs = Vector2()

func get_raw_inputs():
	var inputs = Vector2()
	if Input.is_action_pressed("right"):
		inputs.x += 1
	if Input.is_action_pressed("left"):
		inputs.x -= 1
	# Y actions is inverted due to the inverted axis
	if Input.is_action_pressed("up"):
		inputs.y -= 1
	if Input.is_action_pressed("down"):
		inputs.y += 1
	return inputs

func get_inputs(delta):
	var raw = get_raw_inputs()
	
	# x-axis
	if raw.x == 0:
		var gravitier = - gravity * delta * sign(inputs.x)
		if sign(inputs.x) != sign(inputs.x + gravitier):
			inputs.x = 0
		if inputs.x != 0.0:
			inputs.x += gravitier
	else:
		inputs.x += raw.x * sensitivity * delta
	inputs.x = clamp(inputs.x, -1, 1)
	
	# y-axis
	if raw.y == 0:
		var gravitier = - gravity * delta * sign(inputs.y)
		if sign(inputs.y) != sign(inputs.y + gravitier):
			inputs.y = 0
		if inputs.y != 0.0:
			inputs.y += gravitier
	else:
		inputs.y += raw.y * sensitivity * delta
	inputs.y = clamp(inputs.y, -1, 1)
	print(inputs)
	return inputs

func _process(delta):
	translate(get_inputs(delta) * speed * delta)
