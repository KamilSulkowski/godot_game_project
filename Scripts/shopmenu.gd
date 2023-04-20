extends StaticBody2D

#1 = carrot #2 - onion #3 - cappage #4 - corn #5 - strawberry
var item: int = 1

var item1price: int = 100
var item2price: int = 150
var item3price: int = 200
var item4price: int = 500
var item5price: int = 175

var item1owned: bool = false
var item2owned: bool = false
var item3owned: bool = false
var item4owned: bool = false
var item5owned: bool = false

var price: int

func _ready() -> void:
	$icon.play("carrotseed")
	item = 1

func _physics_process(delta: float) -> void:
	if self.visible == true:
		if item == 1:
			$price.text = str(item1price)
			$icon.play("carrotseed")
		if item == 2:
			$price.text = str(item2price)
			$icon.play("onionseed")
		if item == 3:
			$price.text = str(item3price)
			$icon.play("cappageseed")
		if item == 4:
			$price.text = str(item4price)
			$icon.play("cornseed")
		if item == 5:
			$price.text = str(item5price)
			$icon.play("strawberryseed")

func _on_leftbutton_pressed() -> void:
	swap_item_back()
func _on_rightbutton_pressed() -> void:
	swap_item_forward()
func _on_buybutton_pressed() -> void:
	if item == 1:
		price = item1price
		if Global.coins >= price:
			if item1owned == false:
				buy()
	elif item == 2:
		price = item2price
		if Global.coins >= price:
			if item2owned == false:
				buy()
	elif item == 3:
		price = item3price
		if Global.coins >= price:
			if item3owned == false:
				buy()
	elif item == 4:
		price = item4price
		if Global.coins >= price:
			if item4owned == false:
				buy()
	elif item == 5:
		price = item5price
		if Global.coins >= price:
			if item5owned == false:
				buy()

func swap_item_back():
	if item == 5:
		item = 4
	elif  item == 4:
		item = 3
	elif  item == 3:
		item = 2
	elif  item == 2:
		item = 1
	elif  item == 1:
		item = 5
		
func swap_item_forward():
	if item == 1:
		item = 2
	elif  item == 2:
		item = 3
	elif  item == 3:
		item = 4
	elif  item == 4:
		item = 5
	elif  item == 5:
		item = 1

func buy():
	Global.coins -= price
	if item == 1:
		item1owned = true
	if item == 2:
		item2owned = true
	if item == 3:
		item3owned = true
	if item == 4:
		item4owned = true
	if item == 5:
		item5owned = true
