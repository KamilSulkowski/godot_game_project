extends CharacterBody2D

var enemy_inattack_range = false
var enemy_attack_cooldown = true
var health = 100
var player_alive = true
var attack_ip = false
var cur_dir = "none"
@export var speed: int = 1
var movement = 0

var direction = "IdleDown"

const MOVE_SPEED: float = 35.0

func _ready():
	$AnimatedSprite2D.play("IdleDown")
	
func _physics_process(delta: float) -> void:
	if health > 0:
		player_movement(delta)
		enemy_attack()
		attack()
		Global.player_alive = player_alive
		player_alive = false #back to menu
	elif health <= 0:
		health = 0
		print("player has been killed")
	
func player_movement(delta):
	var mov_speed = speed * MOVE_SPEED
	if Input.is_action_pressed("ui_right"):
		cur_dir = "Right"
		play_anim(1)
		velocity.x = mov_speed
		velocity.y = 0
	elif Input.is_action_pressed("ui_left"):
		cur_dir = "Left"
		play_anim(1)
		velocity.x = -mov_speed
		velocity.y = 0
	elif Input.is_action_pressed("ui_down"):
		cur_dir = "Down"
		play_anim(1)
		velocity.x = 0
		velocity.y = mov_speed
	elif Input.is_action_pressed("ui_up"):
		cur_dir = "Up"
		play_anim(1)
		velocity.x = 0
		velocity.y = -mov_speed
	else:
		play_anim(0)
		velocity.x = 0
		velocity.y = 0
		movement == 0
	move_and_slide()
	
func play_anim(movement):
	if cur_dir == "Right":
		if movement == 1:
			$AnimatedSprite2D.play("walkRight")
		elif movement == 0: 
			if attack_ip == false:
				$AnimatedSprite2D.play("IdleRight")
	if cur_dir == "Left":
		if movement == 1: 
			$AnimatedSprite2D.play("walkLeft")
		elif movement == 0: 
			if attack_ip == false:
				$AnimatedSprite2D.play("IdleLeft")
	if cur_dir == "Down":
		if movement == 1: 
			$AnimatedSprite2D.play("walkDown")
		elif movement == 0: 
			if attack_ip == false:
				$AnimatedSprite2D.play("IdleDown")
	if cur_dir == "Up":
		if movement == 1: 
			$AnimatedSprite2D.play("walkUp")
		elif movement == 0: 
			if attack_ip == false:
				$AnimatedSprite2D.play("IdleUp")
		
func player_sell_method():
	pass
func player_shop_method():
	pass
func player():
	pass

func _on_player_hitbox_body_entered(body):
	if body.has_method("enemy"):
		enemy_inattack_range = true

func _on_player_hitbox_body_exited(body):
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

func attack():
	var attack_dir = cur_dir
	if Input.is_action_pressed("ui_attack"):
		Global.player_current_attack = true
		attack_ip = true
		if attack_dir == "Right":
			$AnimatedSprite2D.play("attackRight")
		if attack_dir == "Left":
			$AnimatedSprite2D.play("attackLeft")
			$deal_attack_timer.start()
		if attack_dir == "Down":
			$AnimatedSprite2D.play("attackDown")
			$deal_attack_timer.start()
		if attack_dir == "Up":
			$AnimatedSprite2D.play("attackUp")
			$deal_attack_timer.start()

func _on_deal_attack_timer_timeout():
	$deal_attack_timer.stop()
	Global.player_current_attack = false
	attack_ip = false
