extends Node2D

func _physics_process(delta: float) -> void:
	$"TileMap/Player/follow cam/coinstext".text = ("= " + str(Global.coins))
