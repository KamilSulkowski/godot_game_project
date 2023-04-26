extends Node2D

func _physics_process(delta: float) -> void:
	if Global.player_alive:
		$"TileMap/Player/follow cam/coinstext".text = ("= " + str(Global.coins))
