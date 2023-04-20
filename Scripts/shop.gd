extends StaticBody2D

func _physics_process(delta: float) -> void:
	$anitka.play("default")

func _ready() -> void:
	$shopmenu.visible = false
	
func _process(delta: float) -> void:
	if Global.weather == "rain":
		$anitka.visible = false
	elif Global.weather == "none":
		$anitka.visible = true
	if $shopmenu.item1owned == true:
		$carrot_seedpack.visible = true
	if $shopmenu.item2owned == true:
		$onion_seedpack.visible = true
	if $shopmenu.item3owned == true:
		$cappage_seedpack.visible = true
	if $shopmenu.item4owned == true:
		$corn_seedpack.visible = true
	if $shopmenu.item5owned == true:
		$strawberry_seedpack.visible = true

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.has_method("player_shop_method"):
		$shopmenu.visible = true


func _on_area_2d_body_exited(body: Node2D) -> void:
	if body.has_method("player_shop_method"):
		$shopmenu.visible = false
