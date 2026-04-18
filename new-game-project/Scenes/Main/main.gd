extends Node2D
@onready var bullets: Node2D = $Bullets

func new_bullet(bullet: Area2D, start_pos):
	bullets.add_child(bullet)
	bullet.position = start_pos
	bullet.look_at(get_global_mouse_position())

func move_bullet(bullet, delta):
	bullet.move(delta)

func _process(delta: float) -> void:
	for bullet in bullets.get_children():
		move_bullet(bullet, delta)
