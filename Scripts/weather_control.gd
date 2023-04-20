extends StaticBody2D

var current_weather = "rain" #none rain_middle, drizzle

func _ready() -> void:
	if current_weather == "none":
		$rain_middle.visible = false
		$drizzle.visible = false
		$raincolor.visible = false
	if current_weather == "rain":
		$rain_middle.visible = true
		$drizzle.visible = false
		$raincolor.visible = true
	if current_weather == "drizzle":
		$rain_middle.visible = false
		$drizzle.visible = true
		$raincolor.visible = true

func _on_rain_middle_timer_timeout() -> void:
	if current_weather == "none":
		current_weather = "rain"
		$rain_middle_Timer.wait_time = randi_range(10,30)
		$rain_middle_Timer.start()
	elif  current_weather == "rain":
		current_weather = "none"
		$rain_middle_Timer.wait_time = randi_range(20,60)
		$rain_middle_Timer.start()

func _on_drizzle_timer_timeout() -> void:
	if current_weather == "none":
		current_weather = "drizzle"
		$rain_middle_Timer.wait_time = randi_range(10,30)
		$rain_middle_Timer.start()
	elif  current_weather == "drizzle":
		current_weather = "none"
		$rain_middle_Timer.wait_time = randi_range(20,60)
		$rain_middle_Timer.start()

func _process(delta: float) -> void:
	Global.weather = current_weather
	if current_weather == "none":
		$rain_middle.visible = false
		$drizzle.visible = false
		$raincolor.visible = false
	if current_weather == "rain":
		$rain_middle.visible = true
		$drizzle.visible = false
		$raincolor.visible = true
	if current_weather == "drizzle":
		$rain_middle.visible = false
		$drizzle.visible = true
		$raincolor.visible = true
