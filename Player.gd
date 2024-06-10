extends Area2D

@export var speed = 400
var screen_size

# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	# 	Check for input.
	var velocity = Vector2(0, 0)
	if Input.is_action_pressed("move_right"):
		velocity.x += 1
	if Input.is_action_pressed("mover_left"):
		velocity.x += -1
	if Input.is_action_pressed("move_up"):
		velocity.y += -1
	if Input.is_action_pressed("move_down"):
		velocity.y += +1

	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		$AnimatedSprite2D.play()
	else:
		$AnimatedSprite2D.stop()

	# Move in the given direction.
	position += velocity * delta
	position = position.clamp(Vector2.ZERO, screen_size)


	# Play the appropriate animation.
	#devil of the paradise