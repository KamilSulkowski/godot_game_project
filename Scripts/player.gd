extends CharacterBody2D

@export var speed: int = 1
@onready var animations = $AnimationPlayer

var direction = "IdleDown"

const MOVE_SPEED: float = 35.0

func handleInput():
	var moveDirection = Input.get_vector("ui_left", "ui_right","ui_up","ui_down")
	velocity = moveDirection * (speed * MOVE_SPEED)
	move_and_slide()

func walkAnimation():
	if velocity.length() == 0:
		if direction == "Left": direction = "IdleLeft"
		elif direction == "Right": direction = "IdleRight"
		elif direction == "Up": direction = "IdleUp"
		elif direction == "Down": direction = "IdleDown"
		
	if velocity.x < 0: direction = "Left"
	elif velocity.x > 0: direction = "Right"
	elif velocity.y < 0: direction = "Up"
	elif velocity.y > 0: direction = "Down"
		
	if animations.has_animation("walk" + direction):
		animations.play("walk" + direction)
	elif animations.has_animation(direction):
		animations.play(direction)
	else:
		print("Animation not found: walk" + direction)
		
func attackAnimation():
	if Input.is_action_just_pressed("ui_attack"):
		animations.play("attackDown")
	
func _physics_process(delta: float) -> void:
	handleInput()
	walkAnimation()
	attackAnimation()

func player_sell_method():
	pass
func player_shop_method():
	pass
