extends StaticBody2D

var selected: bool = false
var seed_type: int = 2 #onion

func _ready() -> void:
	$AnimatedSprite2D.play("default")
	

func _on_area_2d_input_event(viewport, event, shape_idx) -> void:
	if Input.is_action_just_pressed("click"):
		Global.plantselected = seed_type
		selected = true
		
func _physics_process(delta: float) -> void:
	if selected:
		global_position = lerp(global_position, get_global_mouse_position(), 25 * delta)
		
func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and not event.pressed:
			selected = false
	
