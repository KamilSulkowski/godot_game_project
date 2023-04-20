extends StaticBody2D

var plant = Global.plantselected
var plantgrowing: bool = false
var plant_grown: bool = false

func _physics_process(delta: float) -> void:
	if plantgrowing == false:
		plant = Global.plantselected


func _on_area_2d_area_entered(area: Area2D) -> void:
	if not plantgrowing:
		if plant == 1:
			plantgrowing = true
			$carrotgrowtimer.start()
			$plant.play("carrotgrowanimation")
		if  plant == 2:
			plantgrowing= true
			$oniongrowtimer.start()
			$plant.play("oniongrowanimation")
		if plant == 3:
			plantgrowing = true
			$cappagegrowtimer.start()
			$plant.play("cabbagegrowanimation")
		if plant == 4:
			plantgrowing = true
			$corngrowtimer.start()
			$plant.play("corngrowanimation")
		if plant == 5:
			plantgrowing = true
			$strawberrygrowtimer.start()
			$plant.play("strawberrygrowanimation")
	else:
		print("plant is already growing here")

func _on_carrotgrowtimer_timeout() -> void:
	var carrot_plant = $plant
	if carrot_plant.frame == 0:
		carrot_plant.frame = 1
		$carrotgrowtimer.start()
	elif  carrot_plant.frame == 1:
		carrot_plant.frame = 2
		plant_grown = true
 
func _on_oniongrowtimer_timeout() -> void:
	var onion_plant = $plant
	if onion_plant.frame == 0:
		onion_plant.frame = 1
		$oniongrowtimer.start()
	elif  onion_plant.frame == 1:
		onion_plant.frame = 2
		plant_grown = true

func _on_corngrowtimer_timeout() -> void:
	var corn_plant = $plant
	if corn_plant.frame == 0:
		corn_plant.frame = 1
		$corngrowtimer.start()
	elif  corn_plant.frame == 1:
		corn_plant.frame = 2
		plant_grown = true

func _on_cappagegrowtimer_timeout() -> void:
	var cappage_plant = $plant
	if cappage_plant.frame == 0:
		cappage_plant.frame = 1
		$cappagegrowtimer.start()
	elif  cappage_plant.frame == 1:
		cappage_plant.frame = 2
		plant_grown = true

func _on_strawberrygrowtimer_timeout() -> void:
	var strawberry_plant = $plant
	if strawberry_plant.frame == 0:
		strawberry_plant.frame = 1
		$strawberrygrowtimer.start()
	elif  strawberry_plant.frame == 1:
		strawberry_plant.frame = 2
		plant_grown = true

func _on_area_2d_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if Input.is_action_just_pressed("click"):
		if plant_grown:
			if plant == 1:
				Global.numofcarrots += 2
				plantgrowing = false
				plant_grown = false
				$plant.play("none")
			if plant == 2:
				Global.numerofonions += 2
				plantgrowing = false
				plant_grown = false
				$plant.play("none")
			if plant == 3:
				Global.numofcappages += 2
				plantgrowing = false
				plant_grown = false
				$plant.play("none")
			if plant == 4:
				Global.numerofcorns += 3
				plantgrowing = false
				plant_grown = false
				$plant.play("none")
			if plant == 5:
				Global.numerofstrawberrys += 4
				plantgrowing = false
				plant_grown = false
				$plant.play("none")
		else:
			pass

