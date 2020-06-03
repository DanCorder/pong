extends KinematicBody2D

const paddle_height = 80

var speed = 300
var velocity = Vector2()
var upKey = 'ui_up'
var downKey = 'ui_down'

func init(up, down):
	upKey = up
	downKey = down

func get_input():
	# Detect up/down keystate and only move when pressed
	velocity = Vector2()
	if Input.is_action_pressed(downKey):
		velocity.y += 1
	if Input.is_action_pressed(upKey):
		velocity.y -= 1
	velocity = velocity.normalized() * speed

# Allow the player to aim shots by adjusting bounce angle based on where
# on the paddle the ball bounces
func custom_bounce_direction(collision_info):
	var newVx = 1 if collision_info.normal.x > 0 else -1
	var newVy = (collision_info.position.y - collision_info.collider.position.y) / paddle_height
	return Vector2(newVx, newVy).normalized()

func _physics_process(delta):
	get_input()
	move_and_collide(velocity * delta)
