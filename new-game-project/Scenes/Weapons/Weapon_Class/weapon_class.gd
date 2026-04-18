extends Area2D

var angle
var speed = Vector2(100, 100)
func shoot(_angle):
	angle = _angle - PI
func move(delta):
	position += speed * delta
