extends StaticBody2D



func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.has_method("player_sell_method"):
		var carrots = Global.numofcarrots
		var onions = Global.numerofonions
		var corn = Global.numerofcorns
		var strawberry = Global.numerofstrawberrys
		var cappage = Global.numofcappages
		var coins = Global.coins
		
		coins += carrots * 2
		coins += onions * 3
		coins += corn * 7
		coins += strawberry * 2
		coins += cappage * 7
		
		carrots = 0
		onions = 0
		corn = 0
		strawberry = 0
		cappage = 0
		
		Global.coins = coins
		
		Global.numofcarrots = carrots
		Global.numerofonions = onions
		Global.numerofcorns = corn
		Global.numerofstrawberrys = strawberry 
		Global.numofcappages = cappage
