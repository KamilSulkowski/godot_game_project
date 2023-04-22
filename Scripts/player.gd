extends CharacterBody2D

var enemy_inattack_range = false
var enemy_attack_cooldown = true
var health = 100
var player_alive = true
var attack_ip = false
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
	enemy_attack()
	
	if health <= 0:
		player_alive = false #back to menu
		health = 0
		print("player has been killed")
		self.queue_free()
	
func player_sell_method():
	pass
func player_shop_method():
	pass
func player():
	pass

func _on_player_hitbox_body_exited(body):
	if body.has_method("enemy"):
		enemy_inattack_range = true
	
func _on_player_hitbox_body_entered(body):
	if body.has_method("enemy"):
		enemy_inattack_range = false
		
func enemy_attack():
	if enemy_inattack_range and enemy_attack_cooldown == true:
		health = health - 5
		enemy_attack_cooldown = false
		$attack_cooldown.start()
		print(health)


func _on_attack_cooldown_timeout():
	enemy_attack_cooldown = true
