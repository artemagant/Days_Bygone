extends Node2D

@onready var main: Node2D = $".."

@onready var timer: Timer = $Timer

@export var weapon:PackedScene
@onready var weapon_start_pos = position - Vector2(50, 35)

var couldown := false
var mouse: Vector2
var angle
func _process(_delta: float) -> void:
	mouse = get_global_mouse_position()
	angle = rad_to_deg(position.angle_to(mouse))
	shoot()


func shoot():
	if couldown:
		return
	if not weapon:
		push_error("No Weapon")
		return
	var new_shoot = weapon.instantiate()
	main.new_bullet(new_shoot, weapon_start_pos)
	new_shoot.shoot(angle)
	couldown = true
	timer.start()


func _on_timer_timeout() -> void:
	couldown = false
