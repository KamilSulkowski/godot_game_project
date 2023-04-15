extends "enemies.gd"

@export var slimespeed: float = 20.0

func updateVelocity():
	var moveDirection = (endPosition - position)
	if moveDirection.length() < limit:
		changeDirection()
	velocity = moveDirection.normalized()*slimespeed
	move_and_slide()
