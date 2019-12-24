extends Node2D

export var speed = 50

func _ready():
	pass

func _process(delta):
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
	
	translate(inputs * speed * delta)
