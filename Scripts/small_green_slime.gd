extends CharacterBody2D

var speed: float = 140.0
var player_chase: bool = false
var player = null

var health = 50
var player_inattack_zone = false


func _physics_process(delta):
	if player_chase == true:
		position += (player.position - position) / speed
		
		if(player.position.x - position.x) < 0:
			$AnimatedSprite2D.play("walkLeft")
		elif(player.position.x - position.x) > 0:
			$AnimatedSprite2D.play("walkRight")
	else:
			$AnimatedSprite2D.play("idleDown")
			
	deal_with_damage()

func _on_detection_area_body_entered(body):
	player = body
	player_chase = true

func _on_detection_area_body_exited(body):
	player = null
	player_chase = false

func enemy():
	pass


func _on_enemy_hitbox_body_entered(body):
	if body.has_method("player"):
		player_inattack_zone = true


func _on_enemy_hitbox_body_exited(body):
	if body.has_method("player"):
		player_inattack_zone = false
		
func deal_with_damage():
	if player_inattack_zone and Global.player_current_attack == true:
		health = health - 20
		print("slime health: " + health)
		if health <= 0:
			print("slime has been dead")
			self.queue_free()
