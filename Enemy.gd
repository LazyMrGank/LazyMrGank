extends Area2D

@export var left_limit = 0
@export var right_limit = 0

@onready var vertical_position = position.y
var direction = 1
@export var speed = 100
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	translate(Vector2.RIGHT * direction * delta * speed)
	$AnimatedSprite2D.play("Run2")
	if direction > 0 :
		$AnimatedSprite2D.flip_h = false
	else:
		$AnimatedSprite2D.flip_h = true
		
	if position.x > right_limit:
		direction = -1
	if position.x < left_limit:
		direction = 1
		
	
