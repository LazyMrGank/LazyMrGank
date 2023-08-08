extends CharacterBody2D


@export var speed = 200
@export var jump_velocity = -500
@export var max_speed =400
@export var friction = 10

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle Jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		
		velocity.y = jump_velocity

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction and is_on_floor():
		$AnimatedSprite2D.play("Run")
		velocity.x = move_toward(velocity.x, direction * max_speed, speed)
	elif not is_on_floor():
		$AnimatedSprite2D.play("Jump")
		velocity.x = move_toward(velocity.x, direction * max_speed, speed)
	else:
		$AnimatedSprite2D.play("Idle1")
		velocity.x = move_toward(velocity.x, 0, friction)
		
		
	#Change direction
	if direction > 0:
		$AnimatedSprite2D.flip_h = false
	if direction < 0:
		$AnimatedSprite2D.flip_h = true
		
	move_and_slide()
