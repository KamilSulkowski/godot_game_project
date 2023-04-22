extends CharacterBody2D

@export var speed: float = 75
var player_chase = false
var player = null

func _physics_process(delta):
	if player_chase == true:
		position += (player.position - position) / speed

		if(player.position.x - position.x) < 0:
			$AnimatedSprite2D.play("walkLeft")
		elif(player.position.x - position.x) > 0:
			$AnimatedSprite2D.play("walkRight")
		elif(player.position.y - position.y) < 0:
			$AnimatedSprite2D.play("walkDown")
		elif(player.position.y - position.y) > 0:
			$AnimatedSprite2D.play("walkUp")
	else:
		if(position.x) < 0:
			$AnimatedSprite2D.play("idleLeft")
		elif(position.x) > 0:
			$AnimatedSprite2D.play("idleRight")
		elif(position.y) < 0:
			$AnimatedSprite2D.play("idlekDown")
		elif(position.y) > 0:
			$AnimatedSprite2D.play("idleUp")

func _on_detection_area_body_entered(body):
	player = body
	player_chase = true

func _on_detection_area_body_exited(body):
	player = null
	player_chase = false
