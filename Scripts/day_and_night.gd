extends StaticBody2D

var state: String = "day" #day night

var change_state: bool = false

var lenght_of_day: int = 120 #sec
var lenght_of_night: int = 40 #sec
var day: int = 1

func _ready() -> void:
	if state == "day":
		$ColorRect.color.a = 0
	elif state == "night":
		$ColorRect.color.a = 150

func _on_timer_timeout() -> void:
	if state == "day":
		state = "night"
	elif  state == "night":
		state = "day"
	change_state = true
	
func _process(delta: float) -> void:
	if change_state == true:
		change_state = false
		if state == "day":
			change_to_day()
		elif state == "night":
			change_to_night()
			
func change_to_day():
	$AnimationPlayer.play("nighttoday")
	$Timer.wait_time = lenght_of_day
	$Timer.start()
	day += 1
	Global.day = day
	
func change_to_night():
	$AnimationPlayer.play("daytonight")
	$Timer.wait_time = lenght_of_night
	$Timer.start()
