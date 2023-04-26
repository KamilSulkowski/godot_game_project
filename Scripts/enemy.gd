extends CharacterBody2D
class_name enemy
#general pref

var player_chase: bool = false
var walking: bool = false
var idle: bool = false
var xdir: int = 1 # 1 == right # -1 == left
var ydir: int = 1 # 1 == down # -1 == up
var player = null
var player_inattack_zone: bool = false
var can_take_damage: bool = true
var moving_vertical_horizontal = 1 
var state: int = 1
#invidual pref
var health: int = 1
var speed: float = 1

#general method to be seen by an enemy
func enemy():
	pass	
func _ready() -> void:
	randomize()
func _physics_process(delta):
	deal_with_damage()
	player_chasing(delta)
	walking_free()
	move_and_slide()
#detect an player and chase him
func _on_detection_area_body_entered(body):
	player = body
	if body.has_method("player"):
		player_chase = true
#undetect an player and stop chase him
func _on_detection_area_body_exited(body):
	player = null
	player_chase = false
	walking = true
#method that detect an player in attack zone and if true deal demage
func _on_enemy_hitbox_body_entered(body):
	if body.has_method("player"):
		player_inattack_zone = true
#if false do not deal demage
func _on_enemy_hitbox_body_exited(body):
	if body.has_method("player"):
		player_inattack_zone = false
#if player_inattack_zone is true and if Global.player_current_attack is true
	#and if player can deal damage is true then health is - 20 and start
	#to timer that counts time to next can take damage when health is under 0 
	#enemy die and queue is geting free and Global.kill_counter is updating by 1
func deal_with_damage():
	if player_inattack_zone and Global.player_current_attack == true:
		if can_take_damage == true:
			health = health - Global.player_damage
			$take_demage_cooldown.start()
			can_take_damage = false
			if health <= 0:
				Global.kill_counter += 1
				self.queue_free()
func _on_take_demage_cooldown_timeout():
	can_take_damage = true
func _on_walkingtimer_timeout() -> void:
	moving_vertical_horizontal = randi_range(1,2)
	var x = randi_range(1,2)
	var y = randi_range(1,2)
	var waittime = randf_range(1,2)
	var z = randi_range(1,2)
	if x > 1:
		xdir = 1 #right
	else:
		xdir = -1 #left
	if y > 1:
		ydir = 1 #down
	else:
		ydir = -1 #up
	$walkingtimer.wait_time = waittime
	$walkingtimer.start()

func player_chasing(delta):
	if player_chase == true:
		walking = false
		var direction = (player.position - position).normalized()
		position += direction * speed * delta
		
		if(player.position.x - position.x) < 0:
			$AnimatedSprite2D.play("walkLeft")
		elif(player.position.x - position.x) > 0:
			$AnimatedSprite2D.play("walkRight")
		
func walking_free():
	var waittime: int = 1
	if walking == false:
		var x = randi_range(1,2)
		if x > 1:
			moving_vertical_horizontal = 1
		else:
			moving_vertical_horizontal = 2
	if walking == true:
		if moving_vertical_horizontal == 1:
			if xdir == -1:
				state = 1
				$AnimatedSprite2D.play("walkLeft")
			if xdir == 1:
				state = 2
				$AnimatedSprite2D.play("walkRight")
			velocity.x = speed * xdir
			velocity.y = 0
		elif moving_vertical_horizontal == 2:
			if ydir == -1:
				state = 3
				$AnimatedSprite2D.play("walkDown")
			if ydir == 1:
				state = 4
				$AnimatedSprite2D.play("walkUp")
			velocity.y = speed * xdir
			velocity.x = 0
		if idle == true:
			if state == 1:
				$AnimatedSprite2D.play("idleLeft")
			elif state == 2:
				$AnimatedSprite2D.play("idleRight")
			elif state == 3:
				$AnimatedSprite2D.play("idleDown")
			elif state == 4:
				$AnimatedSprite2D.play("idleUp")
			velocity.x = 0
			velocity.y = 0
func _on_changestatetimer_timeout() -> void:
	var waittime: int = 5
	if walking == true:
		idle = true
		walking = false
		waittime = randf_range(1,15)
	elif idle == true:
		walking = true
		idle = false
		waittime = randf_range(2,17)
	$changestatetimer.wait_time = waittime
	$changestatetimer.start()
