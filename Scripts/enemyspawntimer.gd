extends Timer

var forestmob1 = preload("res://enemies/small_green_slime.tscn")
var forestmobs = [forestmob1]


func _on_timeout() -> void:
	var kinds = forestmobs[randi()% forestmobs.size()]
	var forestmob = kinds.instantiate()
	forestmob.position = Vector2(randi_range(470,1140), randi_range(27,470)) 
	add_child(forestmob)
	print("dodano: ")
	wait_time = randi_range(15,20)
