extends KinematicBody2D

const paddle_height = 80
const bounce_speed_up = 1.05
const speed = 600

var _upKey = 'ui_up'
var _downKey = 'ui_down'


func init(up: String, down: String) -> void:
	_upKey = up
	_downKey = down


func _physics_process(delta: float):
	var velocity = get_velocity_from_input()
	move_and_collide(velocity * delta)


func get_velocity_from_input() -> Vector2:
	# Detect up/down keystate and only move when pressed
	var velocity = Vector2()
	if Input.is_action_pressed(_downKey):
		velocity.y += 1
	if Input.is_action_pressed(_upKey):
		velocity.y -= 1
	return velocity.normalized() * speed


# Allow the player to aim shots by adjusting bounce angle based on where
# on the paddle the ball bounces
func custom_bounce(collision_info: KinematicCollision2D, speed: float) -> Vector2:
	var newVx = 1 if collision_info.normal.x > 0 else -1
	var newVy = (collision_info.position.y - collision_info.collider.position.y) / paddle_height
	return Vector2(newVx, newVy).normalized() * speed * bounce_speed_up
