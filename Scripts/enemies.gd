extends CharacterBody2D

@export var speed: float = 1
@export var limit: float = 0.5
@export var endPoint: Marker2D
const MOVE_SPEED: float = 20.0

@onready var animations = $AnimatedSprite2D

var animationString = "walkDown"
var startPosition
var endPosition

func _ready() -> void:
	startPosition = position
	endPosition = endPoint.global_position
	
func changeDirection():
	var tempEnd = endPosition
	endPosition = startPosition
	startPosition = tempEnd
	
func updateVelocity():
	var moveDirection = (endPosition - position)
	if moveDirection.length() < limit:
		changeDirection()
	velocity = moveDirection.normalized()*(speed*MOVE_SPEED)
	move_and_slide()
	
func updateAnimation():
	if velocity.y > 0: animationString = "walkDown"
	elif velocity.y < 0: animationString = "walkUp"
	elif velocity.x > 0: animationString = "walkRight"
	elif velocity.x < 0: animationString = "walkLeft"
	
	animations.play(animationString)
	
func _physics_process(delta: float) -> void:
	updateVelocity()
	updateAnimation()
